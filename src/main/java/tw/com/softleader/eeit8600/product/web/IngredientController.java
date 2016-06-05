package tw.com.softleader.eeit8600.product.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.softleader.eeit8600.product.entity.Ingredient;
import tw.com.softleader.eeit8600.product.service.IngredientService;

@Controller
@RequestMapping("/ingredients")
public class IngredientController {
	@Autowired
	IngredientService service;

	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("ingredients", service.getAll());
		return "/ingredient/ingredientList";
	}

	@RequestMapping("/add")
	public String addPage() {
		return "/ingredient/ingredientAdd";
	}

	@RequestMapping(value = "/post", method = RequestMethod.POST)
	public String post( Model model,@RequestBody Ingredient bean) {
		service.insert(bean);
		return "redirect:/ingredient/ingredientList";
	}

	@RequestMapping("/update")
	public String editPage() {
		return "/ingredient/ingredientEdit";
	}

	@RequestMapping(value = "/put", method = RequestMethod.PUT)
	public String put(Model model,@RequestBody Ingredient bean,@RequestParam Long ingredId ) {
		service.update(bean);
		return "redirect:/ingredient/ingredientList?id="+ingredId;
	}

}
