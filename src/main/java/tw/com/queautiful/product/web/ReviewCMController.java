package tw.com.queautiful.product.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.queautiful.product.service.ReviewCMService;

@Controller
@RequestMapping("/reviewCMs")
public class ReviewCMController {

	@Autowired
	private ReviewCMService service;
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("reviewCMs", service.getAll());
		return "/reviewCM/reviewlist";
	}
	
	@RequestMapping("/delete")
	public String delet(@RequestParam Long reviewCMId){
		service.delete(reviewCMId);
		return"redirect:/reviewCM/reviewlist";
	}
}
