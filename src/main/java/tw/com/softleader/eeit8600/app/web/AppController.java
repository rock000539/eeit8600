package tw.com.softleader.eeit8600.app.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.softleader.eeit8600.app.service.AppService;

@Controller
@RequestMapping("/apps")
public class AppController {
	@Autowired
	private AppService appService;
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("apps", appService.select(null));
		return "/app/appList";
	}
}
