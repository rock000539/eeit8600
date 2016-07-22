package tw.com.queautiful.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.crsh.console.jline.internal.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hazelcast.hibernate.local.Timestamp;

import tw.com.queautiful.product.entity.ArticleCM;
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
	private ReviewService reveiwService;
	
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
	public ReviewCM insert(@RequestBody ReviewCM reviewCM,HttpServletRequest request){
		log.debug("{}",reviewCM);
		reviewCM.setReviewCMTime(new java.sql.Timestamp(System.currentTimeMillis()));
//		Long memberId = (Long) request.getSession().getAttribute("memberId");
		//FK
//		reviewCM.setReview(reveiwService.getById(reviewCM.getRcmId()));
//		reviewCM.setMember(memberService.getById(reviewCM.getRcmId()));
		
		log.debug("{}",reviewCM.getReviewCMTime());
		log.debug("{}",reviewCM);
//		log.debug("{}",reviewCM.getReviewId());
		reviewCM.setMember(memberService.getById(reviewCM.getMemberId()));
		reviewCM.setReview(reveiwService.getById(reviewCM.getReviewId()));
	
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
		
		//FK
		reviewCM.setReview(reveiwService.getById(reviewCM.getRcmId()));
		reviewCM.setMember(memberService.getById(reviewCM.getRcmId()));

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
