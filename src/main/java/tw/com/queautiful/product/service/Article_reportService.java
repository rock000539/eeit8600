package tw.com.queautiful.product.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;

@Service
public class Article_reportService {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void insertReport(long articleid,long memberid,String report_content,
		String report_date,long article_athorId,String report_title){
		String insertReport=
" insert into [article_report](articleid, memberid, [report_content] , report_date , [article_athor_id] , report_title) values"
+"("+articleid+","+memberid+",'"+report_content+"','"+report_date+"',"+article_athorId+",'"+report_title+"')";
		
		manager.createNativeQuery(insertReport).executeUpdate();
		
	}
	
	public List<Object[]> findByMemberId(long article_athorId){
		String findByMemberId=
		"Select ar.articleid,ar.memberid,ar.report_content,ar.report_date,ar.[article_athor_id],ar.report_title from article_report ar where [article_athor_id]="+article_athorId;
		List<Object[]> resultList =manager.createNativeQuery(findByMemberId).getResultList();		
		return resultList;
	}
	
}
