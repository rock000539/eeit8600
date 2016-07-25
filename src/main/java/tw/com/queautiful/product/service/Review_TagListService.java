package tw.com.queautiful.product.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import tw.com.queautiful.product.dao.ReviewTagDao;

@Service
public class Review_TagListService {
	@PersistenceContext
	private EntityManager manager;
	@Autowired
	private ReviewTagDao reviewTagDao;
	
	
	public String insertReview_TagList(Long reviewid,Long reviewtagid){
		
	String insertReview_tag =
	"insert into [review_taglist] ([reviewid],[reviewtagid]) values ("+reviewid+","+reviewtagid+")";
	
	try{
	manager.createNativeQuery(insertReview_tag).executeUpdate();
	
	return "新增成功";
	}catch(Exception e){
		String result="不可重複";
		TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		return result;
	}	
	}
	
	public String deleteReview_TagList(Long reviewid,Long reviewtagid){
		
		if(reviewid!=null&&reviewtagid==null){
			String deleteReview_tagByReviewId="Delete from review_taglist where [reviewid]="+reviewid;
			manager.createNativeQuery(deleteReview_tagByReviewId).executeUpdate();
			return "Success";
		}else if(reviewtagid!=null&&reviewid==null){
			String deleteReview_tagByreviewtagid="Delete from review_taglist where [reviewtagid]="+reviewtagid;
			manager.createNativeQuery(deleteReview_tagByreviewtagid).executeUpdate();
			return "Success";
		}else if(reviewtagid!=null&&reviewid!=null){
			String 	deleteReview_tag="Delete from review_taglist where [reviewtagid]="+reviewtagid+" And [reviewid]="+reviewid;
			manager.createNativeQuery(deleteReview_tag).executeUpdate();
			return "Success";
		}else{
			return "Fail";
		}
	
	}

	public List findTags(Long reviewid){
		String findTags="Select rt.[reviewid],rt.[reviewtagid] from [review_taglist] rt where [reviewid]="+reviewid;
		List<Object[]> resultList =manager.createNativeQuery(findTags).getResultList();
		List<String> reuslt=new ArrayList();
		for(int i=0;i<resultList.size();i++){
			Object[] object=resultList.get(i);
			String TagName=reviewTagDao.findOne((Long) object[1]).getReviewTagName();
			reuslt.add(TagName);
		}
		
		return reuslt;
	}
	
}
