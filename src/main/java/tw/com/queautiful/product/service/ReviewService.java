package tw.com.queautiful.product.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.ReviewDao;
import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.entity.Review;
import tw.com.queautiful.product.vo.review.ReviewFmsReviews;
import tw.com.queautiful.product.vo.review.ReviewVOForReviewCM;

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
	
	public List<Review> getAll(Specification<Review> spec){
		return reviewDAO.findAll(spec);
	}
	
	public Page<Review> getAll(Pageable pageable) {
		return reviewDAO.findAll(pageable);
	}
	
	public Page<Review> getAll(Specification<Review> spec, Pageable pageable) {
		
		return reviewDAO.findAll(Specifications.where(spec).and(spec), pageable);
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
	
	public ReviewVOForReviewCM getByIdByVOReviewId(Long reviewId){
		
		ReviewVOForReviewCM review=new ReviewVOForReviewCM();
		BeanUtils.copyProperties(reviewDAO.findOne(reviewId),review);
		
		return review;
	}
	
//	public ReviewFmsReviews getAllByVoReviews(List<Review> list){
//		
//		
//	}
	
	public List<Review> findByOrderByReviewTimeDesc() {
		return reviewDAO.findByOrderByReviewTimeDesc();
	}
	
	public List<Review> findByOrderByReviewReportDesc(){
		return reviewDAO.findByOrderByReviewRatingDesc();
	}
	
} 
