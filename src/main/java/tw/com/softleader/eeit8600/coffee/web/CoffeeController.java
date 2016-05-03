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
		data();
		
		model.addAttribute("coffees", coffeeService.getAll());

		return "/coffee/coffeeList";
	}
	
	public void data(){
		Coffee coffee = new Coffee();
		coffee.setLocal("Australia");
		coffee.setName("Espresso");
		coffee.setPrice(100);
		coffee.setTesting("yes");
		System.out.println(coffee);
		coffeeService.insert(coffee);
		
	}

	@RequestMapping("/add")
	public String addPage() {
		
		return "/coffee/coffeeAdd";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String insert(Coffee coffee, Model model) {
		
		coffeeService.insert(coffee);
		model.addAttribute("msg", "added : ");
		model.addAttribute("result", coffeeService.getById(coffee.getId()));
//		model.addAttribute("coffees", coffeeService.getAll());
		return "/coffee/coffeeAdd";
		
	}

	@RequestMapping("/edit")
	public String editPage(Long id, Model model) {
		
		model.addAttribute("coffees", coffeeService.getById(id));
		return "/coffee/coffeeEdit";
		
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Coffee coffee, Model model) {
		
		coffeeService.update(coffee);
		model.addAttribute("msg", "update : ");
		model.addAttribute("result", coffeeService.getById(coffee.getId()));
		model.addAttribute("coffees", coffeeService.getAll());
		return "/coffee/coffeeEdit";
		
	}

	@RequestMapping("/delete")
	public String delete(Long id, Model model) {
		
		coffeeService.delete(id);
		return "redirect:/movies/list";
		
	}

}
