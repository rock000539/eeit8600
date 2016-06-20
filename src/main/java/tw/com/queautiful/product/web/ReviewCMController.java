package tw.com.queautiful.product.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.product.entity.ReviewCM;
import tw.com.queautiful.product.service.ReviewCMService;

@Controller
@RequestMapping("/reviewCMs")
public class ReviewCMController {

	@Autowired
	private ReviewCMService service;
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("reviewCMs", service.getAll());
		return "/reviewCM/reviewCMList";
	}
	
	@RequestMapping("/delete")
	public String delet(@RequestParam Long rcmId){
		service.delete(rcmId);
		return"redirect:/reviewCMs/list";
	}
	
	@RequestMapping("/add")
	public String addPage(){
		return"/reviewCM/reviewCMAdd";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	@ResponseBody
	public ReviewCM insert(@RequestBody ReviewCM reviewCM){
		service.insert(reviewCM);
		return reviewCM;
	}
	
	@RequestMapping("/edit")
	public String editPage(@RequestParam Long rcmId,Model model){
		model.addAttribute("reviewCM", service.getById(rcmId));
		return "/reviewCM/reviewCMEdit";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public ReviewCM update(@RequestBody ReviewCM reviewCM){
		service.update(reviewCM);
		return reviewCM;
	}
}
