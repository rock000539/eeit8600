package tw.com.softleader.eeit8600.coffee.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String addPage() {
		return "/coffee/coffeeAdd";
	}
	
	
	@RequestMapping(value = "/add", method=RequestMethod.POST)
	public String insert(Coffee coffee,Model model) {		
		coffeeService.insert(coffee);
		model.addAttribute("coffees", coffeeService.getAll());
		return "/coffee/coffeeAdd";
	}

	@RequestMapping("/edit")
	public String update() {
		return "/coffee/coffeeEdit";
	}
	@RequestMapping(value = "/update", method=RequestMethod.POST)
	public String update(Coffee coffee,Model model) {
		coffeeService.update(coffee);
		model.addAttribute("coffees", coffeeService.getAll());
		return "/coffee/coffeeEdit";
	}

	@RequestMapping("/delete")
	public String delete() {
		return "/coffee/coffeeEdit";
	}
	
//	@RequestMapping(value = "/delete", method=RequestMethod.POST)
//	public String delete(Model model, Long id) {
//
//		coffeeService.delete(id);
//		model.addAttribute("coffees", coffeeService.getAll());
//		return "/coffee/coffeeEdit";
//	}
}
