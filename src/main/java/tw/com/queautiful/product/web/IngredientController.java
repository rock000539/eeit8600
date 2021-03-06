package tw.com.queautiful.product.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.product.entity.Ingredient;
import tw.com.queautiful.product.service.BrandService;
import tw.com.queautiful.product.service.IngredientService;
import tw.com.queautiful.product.service.ProdIngreListService;



@Controller
@RequestMapping("/ingredients")
public class IngredientController {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	IngredientService service;
	@Autowired
	ProdIngreListService prodIngreListService;
	@Autowired
	BrandService brandService;
	
	// 提供jqGrid抓取資料使用
		@RequestMapping("/select_jqgrid")
		@ResponseBody
		public Page<Ingredient> select(@RequestParam(required = false) Integer page,
				@RequestParam(required = false) Integer rows) {

			log.debug("page = {}", page);
			log.debug("rows = {}", rows);

			Pageable pageable = new PageRequest(page - 1, rows);
			Page<Ingredient> ingredPage = service.getAll(pageable);
			log.debug(ingredPage.toString());
			log.debug("getSize = {}", ingredPage.getSize()); // 列數(資料筆數)
			log.debug("getNumber = {}", ingredPage.getNumber()); // 頁數-1
			log.debug("getTotalPages() = {}", ingredPage.getTotalPages()); // 總共幾頁
			log.debug("getTotalElements = {}", ingredPage.getTotalElements()); // 全部有幾筆資料
			log.debug("getNumberOfElements = {}", ingredPage.getNumberOfElements()); // 列數(資料筆數)
			log.debug("----------------------------------------------------------"); // 測試
			return ingredPage;
		}

	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("ingredients", service.getAll());
		return "/ingredient/ingredientList";
	}
	
	@RequestMapping("/add")
	public String addPage() {
		return "/ingredient/ingredientAdd";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	public Ingredient post(@RequestBody Ingredient ingredient) {
		ingredient.setCheckedData(true);
		service.insert(ingredient);
		return ingredient;
	}
	
	@RequestMapping(value = "/clientinsert", method = RequestMethod.POST)
	@ResponseBody
	public Ingredient clientpost(@RequestBody Ingredient ingredient) {
		ingredient.setCheckedData(false);
		service.insert(ingredient);
		return ingredient;
	}
	
	@RequestMapping(value = "/post", method = RequestMethod.POST)
	@ResponseBody
	public Ingredient ajaxPost(@RequestParam String NewingredName, @RequestParam String NewingredChName, @RequestParam String NewIngredChar) {
		Ingredient ingredient=new Ingredient();
		ingredient.setIngredName(NewingredName);
		ingredient.setIngredChName(NewingredChName);
		ingredient.setIngredChar(NewIngredChar);
		ingredient.setCheckedData(true);
		service.insert(ingredient);
		return ingredient;
	}
	
	@RequestMapping("/edit")
	public String editPage(@RequestParam Long ingredId, Model model) {
		model.addAttribute("ingredient", service.getById(ingredId));
		return "/ingredient/ingredientEdit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Ingredient update(@RequestBody Ingredient ingredient ) {
		ingredient.setCheckedData(true);
		service.update(ingredient);
		return service.getById(ingredient.getIngredId());
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	@ResponseBody
	public void delete(@RequestParam Ingredient ingredient){
		service.delete(ingredient.getIngredId());
//		return "redirect:/ingredients/list";
	}
		
	
	@RequestMapping("/search") //進入成份找成份頁面
	public String searchPage(){
		return "/ingredient/ingredientSearch";
	}
	
	

	@RequestMapping(value="/SearchIngredient",method=RequestMethod.POST) //開始成份找成份
	public String search(String ingredName,Model model){
		if(ingredName!=""&&ingredName!=null){
			
		List<Ingredient> result=new ArrayList<Ingredient>();
				result=service.findByIngredName(ingredName);
		List resultCn=service.findByIngredChName(ingredName);
		for(int i=0;i<resultCn.size();i++){
			result.add((Ingredient) resultCn.get(i));
		}
		model.addAttribute("result", result);
		return "/ingredient/ingredientSearch";
		}else{
			
			model.addAttribute("resultStr", true);
			return "/ingredient/ingredientSearch";
		}
	}
	
	//前台成分找產品用
	@RequestMapping("/IngredientFindProducts")
	@ResponseBody
	public List<Map<String, Object>> IngredientFindProducts(@RequestParam String IngredientId){
		List<Map<String, Object>> resultList=prodIngreListService.IngredientFindProducts(IngredientId);	
		return resultList;
	}
	
	//前台首頁
	@RequestMapping("/main")
	public String IngredientMain(){
		return "/ingredient/ingredientmain";
	}
		

}
