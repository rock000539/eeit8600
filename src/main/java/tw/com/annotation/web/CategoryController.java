package tw.com.annotation.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.annotation.entity.Category;
import tw.com.annotation.service.CategoryService;

@Controller
@RequestMapping("/categories")
public class CategoryController {
	
	@Autowired
	private CategoryService service;
	
	@RequestMapping("/select")
	@ResponseBody
	public List<Category> select() {
		return service.getAll();
	}
}
