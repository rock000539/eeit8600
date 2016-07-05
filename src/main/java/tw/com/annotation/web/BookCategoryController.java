package tw.com.annotation.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.annotation.entity.BookCategory;
import tw.com.annotation.service.BookCategoryService;

@Controller
@RequestMapping("/categories")
public class BookCategoryController {
	
	@Autowired
	private BookCategoryService service;
	
	@RequestMapping("/select")
	@ResponseBody
	public List<BookCategory> select() {
		return service.getAll();
	}
}
