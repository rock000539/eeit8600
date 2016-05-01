package tw.com.softleader.eeit8600.coffee.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.softleader.eeit8600.book.service.BookService;
import tw.com.softleader.eeit8600.coffee.entity.Coffee;
import tw.com.softleader.eeit8600.coffee.service.CoffeeService;

@Controller
@RequestMapping("/coffees")
public class CoffeeController {
	
	@Autowired
	private CoffeeService coffeeService;

	@RequestMapping("/list")
	public String listPage(Model model) {
		
		model.addAttribute("coffees", coffeeService.getAll());
		
		return "/coffee/coffeeList";
	}
	
	@RequestMapping("/add")
	public String insert(Model model){
		CoffeeService coffeeService=new CoffeeService();
		Coffee coffee=new Coffee();
		
		coffee.setId(5);
		coffee.setLocal("TW");
		coffee.setName("TWcoffee");
		coffee.setPrice(100);
		coffee.setTesting("NO");
		
		coffeeService.insert(coffee);
		model.addAttribute("coffees", coffeeService.getAll());
		return "/coffee/coffeeInsert";
	}

}
