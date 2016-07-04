package tw.com.annotation.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.annotation.entity.Book;
import tw.com.annotation.service.BookService;

@Controller
@RequestMapping("/books")
public class BookController {

	@Autowired
	private BookService service;
	
	@RequestMapping("/select")
	@ResponseBody
	private List<Book> select() {
		return service.getAll();
	}
	
}
