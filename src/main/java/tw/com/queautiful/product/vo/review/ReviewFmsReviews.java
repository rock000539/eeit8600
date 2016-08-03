package tw.com.queautiful.product.vo.review;

import java.sql.Date;
import java.util.List;

import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.entity.ReviewCM;

public class ReviewFmsReviews {

	private Long reviewId;
	private Member member;
	private Long memberId;
	private Product product;  
	private Long prodId;
	private List<ReviewCM> reviewCMs;
	private String reviewTitle;
	private String review;
	private Integer reviewRating;
	private Date reviewTime;
	
	public Long getReviewId() {
		return reviewId;
	}
	public void setReviewId(Long reviewId) {
		this.reviewId = reviewId;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public Long getMemberId() {
		return memberId;
	}
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Long getProdId() {
		return prodId;
	}
	public void setProdId(Long prodId) {
		this.prodId = prodId;
	}
	public List<ReviewCM> getReviewCMs() {
		return reviewCMs;
	}
	public void setReviewCMs(List<ReviewCM> reviewCMs) {
		this.reviewCMs = reviewCMs;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public Integer getReviewRating() {
		return reviewRating;
	}
	public void setReviewRating(Integer reviewRating) {
		this.reviewRating = reviewRating;
	}
	public Date getReviewTime() {
		return reviewTime;
	}
	public void setReviewTime(Date reviewTime) {
		this.reviewTime = reviewTime;
	}
	
	@Override
	public String toString() {
		String result="ReviewFmsReviews [reviewId=" + reviewId  
					  +", memberId=" + memberId + ", prodId=" + prodId 
					  +", reviewTitle=" + reviewTitle + ", review=" + review
					  + ", reviewRating=" + reviewRating + ", reviewTime="
					  + reviewTime + "]";
		
			if(member!=null){
				result=result+member.getMemberId()+member.getNickname();
			}else{
				result=result+"Member is null";
			}
			
			if(product!=null){
				result+=product.getProdId()+product.getProdName();
			}else{
				result="Product is null";
			}
			
			if(reviewCMs!=null){
				for(ReviewCM reviewCM:reviewCMs){
					result += String.format("\nReviewCMs[id=%d, title='%s']",reviewCM.getRcmId(),reviewCM.getRcmMsg());
				}
			}else{
				result+="ReviewCMs is null";
			}
		
		
		return result;
	}
	

	
}
