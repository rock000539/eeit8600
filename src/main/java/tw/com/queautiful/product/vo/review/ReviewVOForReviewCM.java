package tw.com.queautiful.product.vo.review;

import java.util.List;

import tw.com.queautiful.product.entity.ReviewCM;

public class ReviewVOForReviewCM {

	private Long reviewId;

	private List<ReviewCM> reviewCMs;


	public Long getReviewId() {
		return reviewId;
	}

	public void setReviewId(Long reviewId) {
		this.reviewId = reviewId;
	}
	
	
	public List<ReviewCM> getReviewCMs() {
		return reviewCMs;
	}

	public void setReviewCMs(List<ReviewCM> reviewCMs) {
		this.reviewCMs = reviewCMs;
	}
}
