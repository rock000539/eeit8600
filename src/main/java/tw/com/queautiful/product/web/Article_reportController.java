package tw.com.queautiful.product.web;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.product.service.Article_reportService;

@Controller
@RequestMapping("/article_report")
public class Article_reportController {
	
	@Autowired
	private Article_reportService article_reportService;
	
	@RequestMapping(value="/post",method = RequestMethod.POST)   
	@ResponseBody
	@Transactional
	public String articlereport(
	@RequestParam long articleid,@RequestParam long memberid,@RequestParam String reportContent,
	@RequestParam long report_member_id,@RequestParam String report_title){
		
		java.util.Date now = new java.util.Date();
		String report_date= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(now);
		
		
	
		String result="檢舉已送出";
		article_reportService.insertReport(articleid,memberid, reportContent, report_date, report_member_id, report_title);
		
		
		return result;
		
	}
}
