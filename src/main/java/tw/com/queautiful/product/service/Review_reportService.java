package tw.com.queautiful.product.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

@Service
public class Review_reportService {

	@PersistenceContext
	private EntityManager manager;
	
	public List<Object[]> findBymenberId(@RequestParam long review_athor){
	String findByAthorId=
	"Select rv.[reviewid],rv.memberid,rv.[report_content],rv.[report_date],rv.[review_author],rv.[report_title] from [review_report] rv where [review_author]="+review_athor;
	List<Object[]> resultList =manager.createNativeQuery(findByAthorId).getResultList();		
		return resultList;		
	}
	
}
