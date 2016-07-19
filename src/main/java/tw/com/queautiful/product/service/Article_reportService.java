package tw.com.queautiful.product.service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;

@Service
public class Article_reportService {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void insertReport(long articleid,long memberid,String report_content,
		String report_date,long report_member_id,String report_title){
		String insertReport=
" insert into [article_report](articleid, memberid, [report_content] , report_date , report_member_id , report_title) values"
+"("+articleid+","+memberid+",'"+report_content+"','"+report_date+"',"+report_member_id+",'"+report_title+"')";
		
		manager.createNativeQuery(insertReport).executeUpdate();
		
	}
	
}
