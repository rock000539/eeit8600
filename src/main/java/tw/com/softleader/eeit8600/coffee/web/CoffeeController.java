package tw.com.softleader.eeit8600.coffee.web;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

	@RequestMapping("/addSampleData")
	public String data() {
		
		Coffee coffee = new Coffee();
		
		coffee.setLocal("Australia");
		
		coffee.setName("Espresso");
		
		coffee.setPrice(100);
		
		coffee.setTesting("yes");
		
		System.out.println(coffee);
		
		coffeeService.insert(coffee);
		
		return "redirect:/coffees/list";
	}

	@RequestMapping("/add")
	public String addPage() {

		return "/coffee/coffeeAdd";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String insert(Coffee coffee, Model model) {

		
//		Map error=checkData(coffee);		
//		if(!error.isEmpty()){
//			model.addAttribute("errorMsg",error);
//			model.addAttribute("coffee",coffee);
//			return "/coffees/add";
//		}
		
		coffeeService.insert(coffee);
		
		return "redirect:/coffees/list";

	}

	@RequestMapping("/edit")
	public String editPage(Long id, Model model) {
		
		model.addAttribute("coffees", coffeeService.getById(id));
		
		return "/coffee/coffeeEdit";
	}

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
		
		 return "redirect:/coffees/list";

	}
	
	private Map checkData(Coffee coffee){
		Map err=new LinkedHashMap();
		
		if(coffee.getId()==null){
			err.put("errorId","Id不可空白");
		}
		if(coffee.getLocal()==null){
			err.put("errorLocal","Local不可空白");
		}
		if(coffee.getPrice()==null){
			err.put("errorPrice","Price不可空白");
		}
		if(coffee.getTesting()==null){
			err.put("errorTesting","Testing不可空白");
		}		
		if(coffee.getName()==null){
			err.put("errorName","Name不可空白");
		}
	
		return err;
	}

}
