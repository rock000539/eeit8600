package tw.com.softleader.eeit8600.drama.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.softleader.eeit8600.drama.service.DramaService;

@Controller
@RequestMapping("/dramas")
public class DramaController {
	@Autowired
	private DramaService dramaService;
	
	// http://**.**.**/dramas/list
	@RequestMapping("/list")
	public String listPage(Model model){
		// prefix + string + suffix;
	    // "/WEB-INF/jsp/drama/dramaList.jsp
		model.addAttribute("dramas",dramaService.getAll());
		return "/drama/dramaList";
	}
	
	@RequestMapping("/add")
	public String addPage(){
		return "drama/dramaAdd";
	}

	
}
