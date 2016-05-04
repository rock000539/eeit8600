package tw.com.softleader.eeit8600.coffee.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

	@RequestMapping("/addData")
	public String data() {
		Coffee coffee = new Coffee();
		coffee.setLocal("Australia");
		coffee.setName("Espresso");
		coffee.setPrice(100);
		coffee.setTesting("yes");
		System.out.println(coffee);
		coffeeService.insert(coffee);
		return "/coffees/coffeeAdd";
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
		// model.addAttribute("coffees", coffeeService.getAll());
		return "redirect:/coffee/coffeeList";

	}

	@RequestMapping("/edit")
	public String editPage(Long id, Model model) {
		model.addAttribute("coffees", coffeeService.getById(id));
		return "/coffee/coffeeEdit";
	}

//	@RequestMapping(value = "/update", method = RequestMethod.POST)
//	public void update(@RequestParam(required=false) String id, @RequestParam String name, @RequestParam String local,
//			@RequestParam String price, @RequestParam String testing, Model model) {
//		Coffee coffee = new Coffee();
//		
//		coffee.setId(Long.parseLong(id));
//		coffee.setName(name);
//		coffee.setLocal(local);
//		coffee.setPrice(Integer.parseInt(price));
//		coffee.setTesting(testing);
//		System.out.println(coffee);
//		coffeeService.update(coffee);

//		return "redirect:/coffees/list?="+id;
//	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Coffee coffee) {
		Long id=coffee.getId();
		coffeeService.update(coffee);
		return "redirect:/coffees/list?="+id;
	}
	

	@RequestMapping("/delete")
	public String delete(String id, Model model) {
		System.out.println(id);
		coffeeService.delete(Long.parseLong(id));
//		return "/coffee/coffeeList";
		 return "redirect:/coffees/list";

	}

}
