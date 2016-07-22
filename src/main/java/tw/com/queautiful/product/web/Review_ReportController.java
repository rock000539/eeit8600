package tw.com.queautiful.product.web;

import java.sql.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.entity.Review_Report;
import tw.com.queautiful.product.service.MemberService;
import tw.com.queautiful.product.service.ReviewService;

@Controller
@RequestMapping("/review_report")
public class Review_ReportController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ReviewService reviewService;
	
	@PersistenceContext
	private EntityManager manager;
	
	@RequestMapping(value="/post",method = RequestMethod.POST)   
	@ResponseBody
	public String articlereport(
	@RequestParam long reviewId,@RequestParam long memberid,
	@RequestParam String reportContent,
	@RequestParam String report_title){
		java.util.Date now = new java.util.Date();
		String report_date= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(now);				
		String result="檢舉已送出";
		java.sql.Date reportSqlDate=new java.sql.Date(now.getTime());
		Member member=memberService.getById(memberid);
		long review_author=reviewService.getById(reviewId).getMemberId();
		Review_Report rp=new Review_Report();
		rp.setReportContent(reportContent);
		rp.setReportDate(reportSqlDate);
		rp.setMember(member);
		rp.setReportTitle(report_title);
		rp.setReview_author(review_author);
		rp.setReview(reviewService.getById(reviewId));
		Set<Review_Report> review_Reports=member.getReview_Reports();
		review_Reports.add(rp);
		member.setReview_Reports(review_Reports);
		memberService.update(member);
		return result;
	}
	@RequestMapping(value="/findByAthorId",method = RequestMethod.POST)   
	@ResponseBody
	@Transactional
	public List<Object[]> findBymenberId(@RequestParam long review_athor){
	String findByAthorId=
	"Select rv.[reviewid],rv.memberid,rv.[report_content],rv.[report_date],rv.[review_author],rv.[report_title] from [review_report] rv where [review_author]="+review_athor;
	List<Object[]> resultList =manager.createNativeQuery(findByAthorId).getResultList();		
				
		return resultList;		
	}
}
