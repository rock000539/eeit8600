package tw.com.queautiful.product.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="REVIEW")
public class Review {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="REVIEWID")
	private Long reviewId;
	
	@ManyToOne
	@JoinColumn(name="MEMBERID")
	@JsonIgnore
	private Member member;

	@Transient
	private Long memberId;
	
	@ManyToOne
	@JoinColumn(name="PRODID")//對應PRODUCT table的欄位PRODID
	@JsonIgnore  //停止再返查回去product
	private Product product;  

	@Transient
	private Long prodId;

	@Column(name="REVIEWTITLE",length=200)
	private String reviewTitle;
	
	@Column(name="REVIEW",length=2000)
	private String review;
	
	@Column(name="REVIEWRATING")
	private Integer reviewRating;
	
	@Column(name="REVIEWIMG",length=200)
	private String reviewImg;
	
	@Column(name="REVIEWTIME")
	private Date reviewTime;
	
	@Column(name="REWCOLLECT")
	private Integer rewCollect;
	
	@Column(name="REVIEWSHOW")
	private Boolean reviewShow;
	
	@Override
	public String toString() {
		return "Review [reviewId=" + reviewId + ", memberId=" + memberId
				+ ", prodId=" + prodId + ", reviewTitle=" + reviewTitle
				+ ", review=" + review + ", reviewRating=" + reviewRating
				+ ", reviewImg=" + reviewImg + ", reviewTime=" + reviewTime
				+ ", RewCollect=" + rewCollect + ", reviewShow=" + reviewShow
				+ ", reviewImgFile=" + reviewImgFile + "]";
	}

	@Transient
	private MultipartFile reviewImgFile;

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
		if(!member.getReviews().contains(this)){
			member.getReviews().add(this);
		}
	}
	
	public Long getMemberId() {
		if(this.memberId==null && member!=null){
			return this.getMember().getMemberId();
		}else{
			return memberId;
		}
	}
	
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
		if(!product.getReviews().contains(this)){  //如果this product裡不包含Review，就手動加進去
			product.getReviews().add(this);
		}
	}	
	
	public Long getProdId() {
		if(this.prodId == null && product !=null){// select
			return this.getProduct().getProdId();
		}else{ // insert&update
			return this.prodId;			
		}
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

	public MultipartFile getReviewImgFile() {
		return reviewImgFile;
	}

	public void setReviewImgFile(MultipartFile reviewImgFile) {
		this.reviewImgFile = reviewImgFile;
	}
}
