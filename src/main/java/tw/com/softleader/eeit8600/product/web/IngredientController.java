package tw.com.softleader.eeit8600.product.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.softleader.eeit8600.product.service.IngredientService;

@Controller
@RequestMapping("/ingredients")
public class IngredientController {
	@Autowired
	IngredientService service;
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("ingredients", service.getAll());
		return "/ingredient/ingredientList";
	}
	
}
