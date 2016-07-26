package tw.com.queautiful.product.web;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.product.entity.Brand;
import tw.com.queautiful.product.entity.Category;
import tw.com.queautiful.product.entity.Ingredient;
import tw.com.queautiful.product.entity.ProdIngreList;
import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.service.BrandService;
import tw.com.queautiful.product.service.CategoryService;
import tw.com.queautiful.product.service.IngredientService;
import tw.com.queautiful.product.service.ProdIngreListService;
import tw.com.queautiful.product.service.ProductService;

@Controller
@RequestMapping("/prodIngreList")
public class ProdIngreListController {
	@Autowired
	private ProdIngreListService prodIngreListService;

	@Autowired
	private ProductService productService;

	@Autowired
	private IngredientService ingredientService;

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private BrandService brandService;
	
	@PersistenceContext
	private EntityManager manager;

	@RequestMapping("/list") // 後台修改成分產品對應用
	public String listPage(Model model) {
		return "/ingredient/ProductAndIngredientManagement";
	}
	
	
	@RequestMapping("/editIngredient") // 後台修改成分產品對應ajax用 step1
	public String listPageSearchProduct(Model model,@RequestParam String proIdStr) {

		List<Ingredient> ingredients = new ArrayList<Ingredient>();

		long prodId = Long.parseLong(proIdStr);

		String productName = productService.getById(prodId).getProdName();

		ingredients = prodIngreListService.findByProdIdEndsWith(prodId);
		

		model.addAttribute("ingredients", ingredients);
		model.addAttribute("productName", productName);
		model.addAttribute("productId",proIdStr);
		
		return "/ingredient/editIngredient";
	}
	
	
	@RequestMapping(value="/put",method=RequestMethod.POST) // 後台新增資料頁面用
	@ResponseBody
	@Transactional
	public List<String>  editProductIngredient
	(Model model, @RequestParam String[] IngredientNames ,@RequestParam String proName,@RequestParam String proId  ) {
		String findAllProductAndIngredietRelativeWithProId="select [ingredid] from [proingrelist] where [prodid]="+proId;
		
		List<Object> oleResultList=manager.createNativeQuery(findAllProductAndIngredietRelativeWithProId).getResultList();
		
		List<String> result=new ArrayList();
		
		for(int i=0;i<IngredientNames.length;i++){
		ProdIngreList prodIngreList=prodIngreListService.findOneByProidAndIngredientName(proId, IngredientNames[i]);
	
		if(prodIngreList.getIngredId()==null||prodIngreList.getProdId()==null){
			
			result.add(IngredientNames[i]);
			
		}else{//case 4比對舊資料，確認是否做更動
			for(int checkId=0;checkId<oleResultList.size();checkId++){	
//				long oleIntId=oleResultList.get(checkId);
				System.out.println("compare==="+prodIngreList.getIngredId()+" --- "+oleResultList.get(checkId));
				
				BigInteger bigId = (BigInteger) oleResultList.get(checkId);
				
				long BigInteger=bigId.longValue();
				
				if(prodIngreList.getIngredId()==BigInteger){
					oleResultList.remove(checkId);
				}
			}
			
		}//end if and else loop
		}//end of 	for(int i=0;i<IngredientNames.length;i++)
		
		if(result.size()==0){
			//result.add("無成份修改");
		}
		
		
		for(int i=0;i<oleResultList.size();i++){//case 4 比對完資料做刪除動作
		String oldIngredientId=oleResultList.get(i).toString();
		String deleteProductAndIngredietRelative="delete from [proingrelist] where [ingredid]="+oldIngredientId+" and [prodid]="+proId;	
		manager.createNativeQuery(deleteProductAndIngredietRelative).executeUpdate();	
						
		}
		
		return result;
	}

	
	@RequestMapping("/post") // 後台新增資料ajax用
	public String listPage(Model model, String prodIdStr, String ingredIdStr) {
		long prodId = Long.parseLong(prodIdStr);
		long ingredId = Long.parseLong(ingredIdStr);
		prodIngreListService.insert(prodId, ingredId);

		model.addAttribute("prodIngreListService", prodIngreListService.getAll());
		return "/ingerdient/IngredientSearchIngredient";
	}
	
	@RequestMapping("/autocomplete") //功能4 自動完成用
	@ResponseBody
	public List autocomplete(@RequestParam String IngredientName){

		List result=ingredientService.findByIngredName(IngredientName);

		List resultCh= ingredientService.findByIngredChName(IngredientName);
		for(int i=0;i<resultCh.size();i++){
			result.add(resultCh.get(i));
		}
		
		return result;
	}
	
	@RequestMapping("/checkIngredientName") //功能1  檢查資料用
	@ResponseBody
	public Ingredient checkIngredientName(@RequestParam String IngredientName){
		Ingredient ingredient=ingredientService.findByIngredCorrectName(IngredientName);		
		
		Ingredient ingredientCh=ingredientService.findByIngredChCorrectName(IngredientName);
		
		if(ingredient!=null){return ingredient;}
		else if(ingredientCh!=null){return ingredientCh;}
		else{return null;}
	}

	
//*--------------------------------------------------------------
	@RequestMapping("/prodNameSearchIngred") // 前台進入搜尋頁面
	public String searchPage() {

		return "/ingredient/prodNameSearchIngred";

	}

	@RequestMapping(value="/get",method=RequestMethod.POST) // 前後台產品找成分ajax用
	@ResponseBody
	public Map<String, Object> search(@RequestParam String prodName) {
		
		List<Product> products = productService.findByProdNameEndsWith(prodName);

		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();

		Map<String, Object> resultMap = new HashMap<String, Object>();

		List<Category> categorys = new ArrayList<Category>();
		
		List<Brand> brands= new ArrayList<Brand>();;

		for (int i = 0; i < products.size(); i++) {

			Product product = products.get(i);
			Category category = categoryService.getById(product.getCategoryId());
			Brand brand=brandService.getById(product.getBrandId());
			categorys.add(category);
			brands.add(brand);

		}
		resultMap.put("products", products);
		resultMap.put("categorys", categorys);
		resultMap.put("brands", brands);
		System.out.println(resultMap);
		return resultMap;
	}

	@RequestMapping("/showIngredient") // 前台產品找成分ajax用
	@ResponseBody
	public Map<String, Object> showIngredient(@RequestParam String proIdStr) {

		Map<String, Object> result = new HashMap();

		List<Ingredient> ingredients = new ArrayList<Ingredient>();

		long prodId = Long.parseLong(proIdStr);

		String productName = productService.getById(prodId).getProdName();

		ingredients = prodIngreListService.findByProdIdEndsWith(prodId);

		result.put("ingredients", ingredients);
		result.put("productName", productName);

		return result;
	}

	@RequestMapping("/showSearchResult")
	public String resultPage() {
		return "/ingredient/showSearchResult";
	}
	
	//進入前台share頁面
	@RequestMapping("/shareMainPage")
	public String shareMainPage(){
		return "/ingredient/share_editIngredient";
	}
	
	//前台用戶share分享用-------
	@RequestMapping("/share_editIngredient")
	public String shareEditIngredient(Model model,@RequestParam String proIdStr){
		List<Ingredient> ingredients = new ArrayList<Ingredient>();

		long prodId = Long.parseLong(proIdStr);

		String productName = productService.getById(prodId).getProdName();

		ingredients = prodIngreListService.findByProdIdEndsWith(prodId);
		

		model.addAttribute("ingredients", ingredients);
		model.addAttribute("productName", productName);
		model.addAttribute("productId",proIdStr);
				
		return "/ingredient/share_editIngredient";
	}
}
