package tw.com.queautiful.product.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.product.entity.Category;
import tw.com.queautiful.product.entity.Ingredient;
import tw.com.queautiful.product.entity.ProdIngreList;
import tw.com.queautiful.product.entity.Product;
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
		
		return "/ingredient/editIngredient";
	}
	
	
	@RequestMapping("/put") // 後台新增資料頁面用
	public String editProductIngredient(Model model, @RequestParam String prodId) {

		return "/ingerdient/IngredientSearchIngredient";
	}

	@RequestMapping("/post") // 後台新增資料ajax用
	public String listPage(Model model, String prodIdStr, String ingredIdStr) {
		long prodId = Long.parseLong(prodIdStr);
		long ingredId = Long.parseLong(ingredIdStr);
		prodIngreListService.insert(prodId, ingredId);

		model.addAttribute("prodIngreListService", prodIngreListService.getAll());
		return "/ingerdient/IngredientSearchIngredient";
	}
	
	
//*--------------------------------------------------------------
	@RequestMapping("/prodNameSearchIngred") // 前台進入搜尋頁面
	public String searchPage() {

		return "/ingredient/prodNameSearchIngred";

	}

	@RequestMapping("/get") // 前後台產品找成分ajax用
	@ResponseBody
	public Map<String, Object> search(@RequestParam String prodName) {

		List<Product> products = productService.findByProdNameEndsWith(prodName);

		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();

		Map<String, Object> resultMap = new HashMap<String, Object>();

		List<Category> categorys = new ArrayList<Category>();

		for (int i = 0; i < products.size(); i++) {

			Product product = products.get(i);
			Category category = categoryService.getById(product.getCategoryId());
			categorys.add(category);

		}
		resultMap.put("products", products);
		resultMap.put("categorys", categorys);

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
}
