package tw.com.queautiful.product.web;

import java.util.List;

import org.apache.hadoop.mapred.gethistory_jsp;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.product.entity.Review;
import tw.com.queautiful.product.entity.ReviewCM;
import tw.com.queautiful.product.service.MemberService;
import tw.com.queautiful.product.service.ReviewCMService;
import tw.com.queautiful.product.service.ReviewService;

@Controller
@RequestMapping("/reviewCMs")
public class ReviewCMController {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private ReviewCMService service;

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("reviewCMs", service.getAll());
		return "/reviewCM/reviewCMList";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam Long rcmId){
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
		//FK
		reviewCM.setReview(reviewService.getById(reviewCM.getReviewId()));
		reviewCM.setMember(memberService.getById(reviewCM.getMemberId()));
		
		log.debug("{}",reviewCM);
		reviewCM.setReviewCMTime(new java.sql.Timestamp(System.currentTimeMillis()));
//		Long memberId = (Long) request.getSession().getAttribute("memberId");
		reviewCM.setMember(memberService.getById(reviewCM.getMemberId()));
		reviewCM.setReview(reviewService.getById(reviewCM.getReviewId()));
		reviewCM.setRcmShow(reviewCM.getRcmShow());
		reviewCM.setRcmReport(reviewCM.getRcmReport());
		log.debug("{}",reviewCM);
		service.insert(reviewCM);
		
		return reviewCM;	
	}
	
	@RequestMapping(value="/select_data",method=RequestMethod.POST)
	@ResponseBody
	public List<ReviewCM> selects(@RequestParam Long reviewId){
		log.debug("ReviewId={}",reviewId);		
		List<ReviewCM> reviewCMs = reviewService.getById(reviewId).getReviewCMs();
		log.debug("ReviewCMs={}",reviewCMs);
		
		return reviewCMs;	
	}
	
//	@RequestMapping(value="/select/{id}",method=RequestMethod.POST)
//	@ResponseBody
//	public List<ReviewCM> selects2(@PathVariable("id") Long reviewId){
//		log.debug("ReviewId={}",reviewId);		
//		List<ReviewCM> reviewCMs = reveiwService.getById(reviewId).getReviewCMs();
//		log.debug("ReviewCMs={}",reviewCMs);
//		
//		return reviewCMs;	
//	}
	
	@RequestMapping("/edit")
	public String editPage(@RequestParam Long rcmId,Model model){
		model.addAttribute("reviewCM", service.getById(rcmId));
		return "/reviewCM/reviewCMEdit";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public ReviewCM update(@RequestBody ReviewCM reviewCM){
		
		//FK
		reviewCM.setReview(reviewService.getById(reviewCM.getReviewId()));
		reviewCM.setMember(memberService.getById(reviewCM.getMemberId()));

		service.update(reviewCM);
		return reviewCM;
	}
	
	// 提供一般抓取資料使用
	@RequestMapping("/select")
	@ResponseBody
	public List<ReviewCM> select() {
		return service.getAll();
	}
}
