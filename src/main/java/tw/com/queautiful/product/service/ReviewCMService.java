package tw.com.queautiful.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.ReviewCMDao;
import tw.com.queautiful.product.entity.ReviewCM;



@Service
public class ReviewCMService {

	@Autowired
	private ReviewCMDao reviewCMDao;
	
	public ReviewCM getById(Long rcmId){
		return reviewCMDao.findOne(rcmId);
	}
	
	public List<ReviewCM> getAll(){
		return reviewCMDao.findAll();
	}
	
	public void insert(ReviewCM reviewCM){
		reviewCMDao.save(reviewCM);
	}
	
	public void update(ReviewCM reviewCM){
		reviewCMDao.save(reviewCM);
	}
	
	public void delete(Long rcmId){
		reviewCMDao.delete(rcmId);
	}
}
