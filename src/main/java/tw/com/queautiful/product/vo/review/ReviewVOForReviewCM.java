package tw.com.queautiful.product.vo.review;

import java.util.List;

import tw.com.queautiful.product.entity.ReviewCM;

public class ReviewVOForReviewCM {

	private Long reviewId;

	private List<ReviewCM> rcms;


	public Long getReviewId() {
		return reviewId;
	}

	public void setReviewId(Long reviewId) {
		this.reviewId = reviewId;
	}
	
	
	public List<ReviewCM> getReviewCMs() {
		return rcms;
	}

	public void setReviewCMs(List<ReviewCM> rcms) {
		this.rcms = rcms;
	}

	@Override
	public String toString() {
		return "ReviewVOForReviewCM [reviewId=" + reviewId + ", reviewCMs="
				+ rcms + "]";
	}
	
	
}
