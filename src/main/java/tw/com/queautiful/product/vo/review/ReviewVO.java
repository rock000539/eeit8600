package tw.com.queautiful.product.vo.review;

import java.sql.Date;

import tw.com.queautiful.commons.enums.CategoryTitle;

public class ReviewVO {
	
	private Long reviewId;
	private Integer rcmNum;
	private String reviewTitle;
	private String review;
	private Integer reviewRating;
	private String reviewImg;
	private Date reviewTime;
	private Integer rewCollect;
	private Boolean reviewShow;
	private Long prodId;
	private String prodName;
	private String prodImg;
	private String brandName;
	private Long categoryId;
	private String categoryName;
	private CategoryTitle categoryTitle;
	public Long getReviewId() {
		return reviewId;
	}
	public void setReviewId(Long reviewId) {
		this.reviewId = reviewId;
	}
	public Integer getRcmNum() {
		return rcmNum;
	}
	public void setRcmNum(Integer rcmNum) {
		this.rcmNum = rcmNum;
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
	public Date getReviewTime() {
		return reviewTime;
	}
	public void setReviewTime(Date reviewTime) {
		this.reviewTime = reviewTime;
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
	public Long getProdId() {
		return prodId;
	}
	public void setProdId(Long prodId) {
		this.prodId = prodId;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	
	public String getProdImg() {
		return prodImg;
	}
	public void setProdImg(String prodImg) {
		this.prodImg = prodImg;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public CategoryTitle getCategoryTitle() {
		return categoryTitle;
	}
	public void setCategoryTitle(CategoryTitle categoryTitle) {
		this.categoryTitle = categoryTitle;
	}
	
	
	

}
