package tw.com.queautiful.product.web;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.product.entity.WebMail;
import tw.com.queautiful.product.service.ArticleService;
import tw.com.queautiful.product.service.Article_reportService;
import tw.com.queautiful.product.service.ReportService;
import tw.com.queautiful.product.service.WebMailService;

@Controller
@RequestMapping("/article_report")
public class Article_reportController {

	@Autowired
	private Article_reportService article_reportService;
	@Autowired
	private ArticleService articleService;

	@RequestMapping(value="/post",method = RequestMethod.POST)   
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
	
	
	@RequestMapping(value="/findByAthorId",method = RequestMethod.POST)   
	@ResponseBody
	@Transactional
	public List<Object[]> findBymenberId(@RequestParam long article_athorId){
		List<Object[]>  result=article_reportService.findByMemberId(article_athorId);
		return result;		
	}
	

}
