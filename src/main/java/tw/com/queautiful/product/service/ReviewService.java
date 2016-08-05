package tw.com.queautiful.product.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.util.BeanUtil;

import tw.com.queautiful.product.dao.ProductDao;
import tw.com.queautiful.product.dao.ReviewDao;
import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.entity.Review;
import tw.com.queautiful.product.vo.review.ReviewFmsEdit;
import tw.com.queautiful.product.vo.review.ReviewFmsReviews;
import tw.com.queautiful.product.vo.review.ReviewVOForReviewCM;

@Service
public class ReviewService {

	@Autowired
	private ReviewDao reviewDAO;
	
	@Autowired
	private ProductDao prodDao;
	
	private Logger log = LoggerFactory.getLogger(this.getClass());

	public Review getById(Long reviewId){
		return reviewDAO.findOne(reviewId);
	}
	
	public List<Review> getAll(){
		return reviewDAO.findAll();
	}
	
	public Page<Review> getAll(Pageable pageable) {
		return reviewDAO.findAll(pageable);
	}
	
	public List<Review> getAll(Specification<Review> spec){
		return reviewDAO.findAll(spec);
	}
	
	public Page<Review> getAll(Specification<Review> spec, Pageable pageable){
		return reviewDAO.findAll(spec, pageable);
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
	
	public ReviewFmsEdit getByIdByVOFmsEdit(Long reviewId){
		
		ReviewFmsEdit review=new ReviewFmsEdit();
		BeanUtils.copyProperties(reviewDAO.findOne(reviewId), review);
		return review;
	}
	
		public List<ReviewFmsReviews> getAllByVoReviews(){
//		List<Review> r_list = list != null ? list : reviewDAO.findAll();  
	    List<Review> r_list=reviewDAO.findAll();
		
		List<ReviewFmsReviews> reviews=new ArrayList<>(); //ArrayList<>泛型省略(JDK1.7之後可以省)
		ReviewFmsReviews review=null;
		for(Review temp:r_list){
			review=new ReviewFmsReviews();
			BeanUtils.copyProperties(temp, review);//從原本的Entity放入VO,VO沒有Entity的欄位自動忽略
			reviews.add(review);
		}
		return reviews;
	}
		
	public void updateScore(Long prodId) {
		
		Product product = prodDao.findOne(prodId);
		List<Review> reviews = product.getReviews();
		
		if(!reviews.isEmpty()) {
			
			double score = 0.0;
			for(Review review : reviews) {
				score += review.getReviewRating();
			}
			
			BigDecimal result = new BigDecimal(score/reviews.size()).setScale(1, RoundingMode.UP);
			
			product.setScore(result.doubleValue());
			prodDao.save(product);
		}
	}
	
	public List<Review> findByOrderByReviewTimeDesc() {
		return reviewDAO.findByOrderByReviewTimeDesc();
	}
	
	public List<Review> findByOrderByReviewReportDesc(){
		return reviewDAO.findByOrderByReviewRatingDesc();
	}
	
} 
