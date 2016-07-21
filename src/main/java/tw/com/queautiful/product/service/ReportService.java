package tw.com.queautiful.product.service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.entity.Article;
import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.entity.WebMail;
import tw.com.queautiful.product.web.Review_ReportController;

@Service
public class ReportService {
	@Autowired
	private Article_reportService article_reportService;

	@Autowired
	private ArticleService articleService;
	@Autowired
	private ReviewService reviewService;
	
	@PersistenceContext
	private EntityManager manager;
	
	public void postReport(WebMail webMail){
		String report_date= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(webMail.getMailSendDate());
		
		if(webMail.getArticleid()!=null){
		System.out.println(webMail.getArticleid());
		Article	article=articleService.getById(webMail.getArticleid());
		Member member=article.getMember();
		System.out.println(member);
		long article_athorId=member.getMemberId();
			
			
		
		article_reportService.insertReport(webMail.getArticleid(),
					webMail.getWebMailSender(),webMail.getMailContent(),
					report_date,article_athorId,webMail.getMailTitle());
		}
		else if(webMail.getReviewId()!=null){
			
			long review_author=reviewService.getById(webMail.getReviewId()).getMemberId();
			
			String insertReport=
" insert into [review_report] ([reviewid], memberid, [report_content] , report_date , [review_author] , report_title) values"
+"("+webMail.getReviewId()+","+webMail.getWebMailSender()+",'"+webMail.getMailContent()+"','"+report_date+"',"+review_author+",'"+webMail.getMailTitle()+"')";
							
			manager.createNativeQuery(insertReport).executeUpdate();
		
		}else{}
		
	}
	
}
