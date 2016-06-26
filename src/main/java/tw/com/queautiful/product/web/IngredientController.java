package tw.com.queautiful.product.web;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import tw.com.queautiful.product.entity.Ingredient;
import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.service.IngredientService;



@Controller
@RequestMapping("/ingredients")
public class IngredientController {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	IngredientService service;
	
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
		service.update(ingredient);
		return service.getById(ingredient.getIngredId());
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam Long ingredId){
		System.out.println(ingredId);
		service.delete(ingredId);
		return "redirect:/ingredients/list";
	}
	
	
//--------------------------------------------------------------------------------------
	
	@RequestMapping("/show")
	public String listJson(int pageNumber,int pageCount){
		
		List<Ingredient> ingredients=service.getAll();
		List<Ingredient> result=new ArrayList<Ingredient>();
	
		for(int i=((pageCount-1)*pageNumber);i<((pageCount*pageNumber)-1);i++){	
			result.add(ingredients.get(i));
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonInString=null;
		try {
			jsonInString = mapper.writeValueAsString(result);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		};
		return jsonInString;
	}

	

	
	@RequestMapping(value = "/post", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String postAdd(Model model,@RequestParam Long ingredId,@RequestParam String ingredName,
			@RequestParam String ingredChName,@RequestParam String ingredChar,
			@RequestParam Integer ingredIrritant,@RequestParam Integer ingredAcne,@RequestParam Integer ingredSafety) {
		
		System.out.println("postAdd IN");
		
		Ingredient ingredient=new Ingredient();
		ingredient.setIngredAcne(ingredAcne);
		ingredient.setIngredChar(ingredChar);
		ingredient.setIngredChName(ingredChName);
		ingredient.setIngredId(ingredId);
		ingredient.setIngredIrritant(ingredIrritant);
		ingredient.setIngredName(ingredName);
		ingredient.setIngredSafety(ingredSafety);		
		System.out.println(ingredient);
		try{service.insert(ingredient);
		System.out.println("success");
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonInString= mapper.writeValueAsString(ingredient);
		
		return jsonInString;
		
		}catch(Exception e){
			System.out.println("false");
			return null;
			}
	}
//--------------------------------------------------------------------------------------


}
