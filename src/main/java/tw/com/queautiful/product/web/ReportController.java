package tw.com.queautiful.product.web;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import scala.util.control.Exception.Finally;
import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.entity.Review_Report;
import tw.com.queautiful.product.service.ArticleService;
import tw.com.queautiful.product.service.Article_reportService;
import tw.com.queautiful.product.service.MemberService;
import tw.com.queautiful.product.service.ReviewService;
import tw.com.queautiful.product.service.Review_reportService;
@Controller
public class ReportController {
	@Autowired
	private Article_reportService article_reportService;
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private Review_reportService review_reportService;
	
	
	@RequestMapping("/bms/reportcontroller")
	public String reportPropertyController(Model model){
		Properties properties = new Properties();
		String configFile = "src/main/resources/report.properties";
		try {
			properties.load(new FileInputStream(configFile));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String reportProperty=properties.getProperty("reportProperty");
		String reviewReportProperty=properties.getProperty("review.reportProperty");
		String articleReportProperty=properties.getProperty("article.reportProperty");
		String dayReportProperty=properties.getProperty("day.reportProperty");
		model.addAttribute("reportProperty",reportProperty);
		model.addAttribute("reviewReportProperty",reviewReportProperty);
		model.addAttribute("articleReportProperty",articleReportProperty);
		model.addAttribute("dayReportProperty",dayReportProperty);
		
		return "/report/reportPropertyController";
	}

	@RequestMapping(value="/article_report/post",method = RequestMethod.POST)   
	@ResponseBody
	@Transactional
	public String articlereport (
	@RequestParam long articleId,@RequestParam long memberId,@RequestParam String reportContent,
	 @RequestParam String report_title){
		long article_athorId=articleService.getById(articleId).getMemberId();
		java.util.Date now = new java.util.Date();
		String report_date= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(now);				
		
		String result=article_reportService.insertReport(articleId,memberId, reportContent, report_date, article_athorId, report_title);		
		return result;
	}	
	
	
	@RequestMapping(value="/article_report/findByAthorId",method = RequestMethod.POST)   
	@ResponseBody
	@Transactional
	public List<Object[]> findByArticle_athorId(@RequestParam long article_athorId){
		List<Object[]>  result=article_reportService.findByMemberId(article_athorId);
		return result;		
	}
	
	@RequestMapping(value="/review_report/post",method = RequestMethod.POST)   
	@ResponseBody
	public String reviewReport(
	@RequestParam long reviewId,@RequestParam long memberId,
	@RequestParam String reportContent,
	@RequestParam String report_title){
		Properties properties = new Properties();
		String configFile = "src/main/resources/report.properties";
		try {
			properties.load(new FileInputStream(configFile));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("test"+properties.getProperty("review.reportProperty"));
		
		java.util.Date now = new java.util.Date();
		String report_date= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(now);				
		String result="檢舉已送出";
		java.sql.Date reportSqlDate=new java.sql.Date(now.getTime());
		Member member=memberService.getById(memberId);
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
	
	@RequestMapping(value="/review_report/findByAthorId",method = RequestMethod.POST)   
	@ResponseBody
	@Transactional
	public List<Object[]> findByReview_athor(@RequestParam long review_athor){	
		return review_reportService.findBymenberId(review_athor);	
	}
	
	@RequestMapping(value="/report/ReportPropertys",method = RequestMethod.POST)
	@ResponseBody
	public String setArticleReportPropertys(String articleReportPropertys,
			String reviewReportPropertys,
			String reportPropertys,
			String dayReportProperty){
		
		
		Properties properties = new Properties();
		String configFile = "src/main/resources/report.properties";
		String result="更改成功";
		
		try {
			properties.load(new FileInputStream(configFile));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		if(articleReportPropertys!=null&&articleReportPropertys!=""){
		properties.setProperty("article.reportProperty",articleReportPropertys );
		}else if(reviewReportPropertys!=null&&reviewReportPropertys!=""){
			properties.setProperty("review.reportProperty",reviewReportPropertys );
		}else if(reportPropertys!=null&&reportPropertys!=""){
			properties.setProperty("reportProperty",reportPropertys );
		}else if(dayReportProperty!=null&&dayReportProperty!=""){
			properties.setProperty("day.reportProperty",dayReportProperty );
		}
		else{
			result="輸入錯誤";
		}
		
		FileOutputStream fos=null;
			try {
				fos = new FileOutputStream("src/main/resources/report.properties");
				properties.store(fos, "by Parker");   
				fos.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		return result;
	}
	
	
	
}
