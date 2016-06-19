package tw.com.queautiful.product.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.product.entity.Review;
import tw.com.queautiful.product.service.ReviewService;

@Controller
@RequestMapping("/reviews")
public class ReviewController {

	@Autowired
	private ReviewService service;
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("reviews", service.getAll());
		return "/review/reviewList";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam Long reviewId){
		service.delete(reviewId);
		return "redirect:/reviews/list";
	}
	
	@RequestMapping("/edit")
	public String editPage(@RequestParam Long reviewId,Model model){
		model.addAttribute("review", service.getById(reviewId));
		return "/review/reviewEdit";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public Review update(@RequestBody Review review){
		service.update(review);
		return review;
	}
	
	@RequestMapping("/add")
	public String addPage(){
		return"/review/reviewAdd";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	@ResponseBody
	public Review insert(@RequestBody Review review){
		service.insert(review);
		return review;
	}
	
}
