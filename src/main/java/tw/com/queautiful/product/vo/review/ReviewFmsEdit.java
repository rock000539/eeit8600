package tw.com.queautiful.product.vo.review;

import tw.com.queautiful.product.entity.Product;

public class ReviewFmsEdit {

	private Long reviewId;
	private Product product; 
	private Long prodId;
	private String reviewTitle;
	private String review;
	private Integer reviewRating;
	private String reviewImg;
	private Integer rewCollect;
	private Boolean reviewShow;
	private Integer reviewReport;
	
	
	
	
	public Long getReviewId() {
		return reviewId;
	}
	public void setReviewId(Long reviewId) {
		this.reviewId = reviewId;
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
	public String getReviewImg() {
		return reviewImg;
	}
	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}
	
	public Integer getRewCollect() {
		return rewCollect;
	}
	public void setRewCollect(Integer rewCollect) {
		this.rewCollect = rewCollect;
	}
	public Boolean getReviewShow() {
		return reviewShow;
	}
	public void setReviewShow(Boolean reviewShow) {
		this.reviewShow = reviewShow;
	}
	public Integer getReviewReport() {
		return reviewReport;
	}
	public void setReviewReport(Integer reviewReport) {
		this.reviewReport = reviewReport;
	}
	@Override
	public String toString() {
		String result= "ReviewFmsEdit [reviewId=" + reviewId + ", prodId=" + prodId
									  + ", reviewTitle=" + reviewTitle + ", review=" + review
									  + ", reviewRating=" + reviewRating+ ", reviewImg=" + reviewImg
									  + ", rewCollect=" + rewCollect+ ", reviewShow=" + reviewShow
									  + ", reviewReport=" + reviewReport + "]";
	
			if(product!=null){
				result+=product.getProdId()+product.getProdName();
			}else{
				result+="Product id null";
			}
		
		return result;
	
	}

	
}
