package tw.com.softleader.eeit8600.coffee.web;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	@RequestMapping("/addSampleData")
	public String data() {

		Coffee coffee = new Coffee();

		coffee.setLocal("Australia");

		coffee.setName("Espresso");

		coffee.setPrice(100);

		coffee.setTesting("yes");

		coffeeService.insert(coffee);

		Coffee coffee2 = new Coffee();
		coffee2.setLocal("African");

		coffee2.setName("Robusta");

		coffee2.setPrice(1800);

		coffee2.setTesting("no");

		coffeeService.insert(coffee2);

		Coffee coffee3 = new Coffee();
		coffee3.setLocal("African");

		coffee3.setName("Originally");

		coffee3.setPrice(800);

		coffee3.setTesting("yes");

		coffeeService.insert(coffee3);

		return "redirect:/coffees/list";
	}

	@RequestMapping("/add")
	public String addPage() {

		return "/coffee/coffeeAdd";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String insert(@RequestParam Long id, @RequestParam String local, @RequestParam String name,
			@RequestParam String price, @RequestParam String testing, Model model) {
		try {
			Coffee coffee = new Coffee();
			coffee.setId(id);
			coffee.setLocal(local);
			coffee.setName(name);
			coffee.setPrice(Integer.parseInt(price));
			coffee.setTesting(testing);
			coffeeService.insert(coffee);
			return "redirect:/coffees/list";
		} catch (Exception e) {
			model.addAttribute("errorMsg2", "資料輸入錯誤或空白,請檢查");
			return "/coffee/coffeeAdd";
		}
	}

	@RequestMapping("/edit")
	public String editPage(Long id, Model model) {

		model.addAttribute("coffees", coffeeService.getById(id));

		return "/coffee/coffeeEdit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Coffee coffee, Model model) {
		try {
			Long id = coffee.getId();
			coffeeService.update(coffee);
			return "redirect:/coffees/list?=" + id;
		} catch (Exception e) {
			model.addAttribute("errorMsg", "資料輸入錯誤或空白,請檢查");
			return "/coffee/coffeeEdit";
		}

	}

	@RequestMapping("/delete")
	public String delete(String id, Model model) {

		System.out.println(id);

		coffeeService.delete(Long.parseLong(id));

		return "redirect:/coffees/list";

	}

	private Map checkData(Coffee coffee) {
		Map err = new LinkedHashMap();

		if (coffee.getId() == null) {
			err.put("errorId", "Id不可空白");
		}
		if (coffee.getLocal() == null) {
			err.put("errorLocal", "Local不可空白");
		}
		if (coffee.getPrice() == null) {
			err.put("errorPrice", "Price不可空白");
		}
		if (coffee.getTesting() == null) {
			err.put("errorTesting", "Testing不可空白");
		}
		if (coffee.getName() == null) {
			err.put("errorName", "Name不可空白");
		}

		return err;
	}

	@RequestMapping("/findByName")
	public String findByName(@RequestParam String name,Model model) {
		List <Coffee> coffees=coffeeService.findByName(name);
		if(coffees!=null){
		model.addAttribute("coffees",coffees);
		System.out.println(name);
		//return "redirect:/coffees/list";
		//return "/coffees/list";
		return "/coffee/coffeeList";
		}else{
			model.addAttribute("errorMsg", "No result");
			System.out.println(name);
			//return "redirect:/coffees/list";			
			//return "/coffees/list";
			return "/coffee/coffeeList";			
		}
	}

}
