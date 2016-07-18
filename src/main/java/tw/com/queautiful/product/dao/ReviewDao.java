package tw.com.queautiful.product.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.queautiful.product.entity.Review;

public interface ReviewDao extends JpaRepository<Review, Long>{
	
	List<Review> findByOrderByReviewTimeDesc();

}
