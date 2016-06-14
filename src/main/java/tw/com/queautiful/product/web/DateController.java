package tw.com.queautiful.product.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.queautiful.product.service.DateService;



@Controller
@RequestMapping("/date")
public class DateController {
	@Autowired
	private DateService service;

	@RequestMapping("/list")
	public String listPage() {
		return "/date/dateList";
	}
	@RequestMapping("/add")
	public String addPage(){
		return "/date/dateAddPage";
	}
	@RequestMapping("/edit")
	public String editPage(){
		return "date/dateEditPage";
	}
}
