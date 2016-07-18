package tw.com.queautiful.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.ReviewDao;
import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.entity.Review;

@Service
public class ReviewService {

	@Autowired
	private ReviewDao reviewDAO;

	public Review getById(Long reviewId){
		return reviewDAO.findOne(reviewId);
	}
	
	public List<Review> getAll(){
		return reviewDAO.findAll();
	}
	
	public Page<Review> getAll(Pageable pageable) {
		return reviewDAO.findAll(pageable);
	}
	
	public void insert(Review review){
		reviewDAO.save(review);
	}
	
	public void update(Review review){
		reviewDAO.save(review);
	}
	
	public void delete(Long reviewId){
		reviewDAO.delete(reviewId);
	}
	
	public List<Review> findByOrderByReviewTimeDesc() {
		return reviewDAO.findByOrderByReviewTimeDesc();
	}
	
} 
