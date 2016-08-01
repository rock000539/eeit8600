package tw.com.queautiful.product.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

@Service
public class Article_reportService {
	
	@PersistenceContext
	private EntityManager manager;
	
	public String insertReport (long articleId,long memberId,String report_content,
		String report_date,long article_athorId,String report_title){
		
		String result="新增檢舉事件成功";
		String insertReport=
" insert into [article_report](articleId, memberId, [report_content] , report_date , [article_athor_id] , report_title) values"
+"("+articleId+","+memberId+",'"+report_content+"','"+report_date+"',"+article_athorId+",'"+report_title+"')";
		
		try {
			manager.createNativeQuery(insertReport).executeUpdate();
		} catch (Exception e) {
			result="檢舉已經受理，請勿重複檢舉";
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return result;
		}
		return result;
	
	}
	
	public List<Object[]> findByMemberId(long article_athorId){
		String findByMemberId=
		"Select ar.articleid,ar.memberid,ar.report_content,ar.report_date,ar.[article_athor_id],ar.report_title from article_report ar where [article_athor_id]="+article_athorId;
		List<Object[]> resultList =manager.createNativeQuery(findByMemberId).getResultList();		
		return resultList;
	}
	
}
