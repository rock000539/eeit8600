package tw.com.softleader.eeit8600.product.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.softleader.eeit8600.product.service.ProductCategoryService;

@Controller
@RequestMapping("/categories")
public class ProductCategoryController {

	@Autowired
	private ProductCategoryService categorySerivce;
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("categorys", categorySerivce.getAll());
		
		return "/category/categoryList";
	}
	
}
