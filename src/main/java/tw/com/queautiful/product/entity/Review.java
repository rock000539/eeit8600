package tw.com.queautiful.product.entity;

import java.sql.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
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
	
	//心得留言
	@OneToMany(mappedBy="review",fetch=FetchType.LAZY)
	@OrderBy("REVIEWCMTIME ASC")
	private List<ReviewCM> reviewCMs;
	
	@Transient
	private Long rcmId;
	
	@Transient
	private Integer rcmNum;
	
	@ManyToMany(mappedBy="reviewsSavedByMember")
	@JsonIgnore
	private Set<Member> memberSave;
	
	//心得標題
	@Column(name="REVIEWTITLE",length=200)
	private String reviewTitle;
	
	//心得內容
//	@Column(name="REVIEW",length=2000)
	@Column(name="REVIEW",columnDefinition="nvarchar(2000)")
	private String review;
	
	//心得評分
	@Column(name="REVIEWRATING")
	private Integer reviewRating;
	
	//心得圖片
	@Column(name="REVIEWIMG",length=200)
	private String reviewImg;
	
	//心得發布時間
	@Column(name="REVIEWTIME")
	private Date reviewTime;
	
	//心得收藏數
	@Column(name="REWCOLLECT")
	private Integer rewCollect;
	
	//心得顯示或隱藏
	@Column(name="REVIEWSHOW")
	private Boolean reviewShow;
		
	//心得檢舉次數
	@Column(name = "REVIEWREPORT") 
	private Integer reviewReport;
	
	@OneToMany(mappedBy="review",fetch=FetchType.LAZY)
	private Set<Review_Report> Review_Reports;
	
	@Override
	public String toString() {
		return "Review [reviewId=" + reviewId + ", member=" + member
				+ ", memberId=" + memberId + ", product=" + product
				+ ", prodId=" + prodId + ", reviewTitle=" + reviewTitle
				+ ", review=" + review + ", reviewRating=" + reviewRating
				+ ", reviewImg=" + reviewImg + ", reviewTime=" + reviewTime
				+ ", rewCollect=" + rewCollect + ", reviewShow=" + reviewShow
				+ ", reviewReport=" + reviewReport + ", reviewImgFile="
				+ reviewImgFile + "]";
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
		if(!member.getReviewsWorteByAuthor().contains(this)){
			member.getReviewsWorteByAuthor().add(this);
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
	
	public Set<Member> getMemberSave() {
		return memberSave;
	}

	public void setMemberSave(Set<Member> memberSave) {
		this.memberSave = memberSave;
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

	public List<ReviewCM> getReviewCMs() {
		return reviewCMs;
	}
	
	public void setReviewCMs(List<ReviewCM> reviewCMs) {
		this.reviewCMs = reviewCMs;
	}
	
	public void addReviewCMs(ReviewCM reviewCMs){
		this.reviewCMs.add(reviewCMs);
		if(reviewCMs.getReview()!=this){
			reviewCMs.setReview(this);
		}
	}
	
	public Long getRcmId() {
		return rcmId;
	}

	public void setRcmId(Long rcmId) {
		this.rcmId = rcmId;
	}

	public Integer getRcmNum() {
		if(reviewCMs != null){
			rcmNum = reviewCMs.size();
		}else{
			rcmNum = 0;
		}
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

	public void setReviewTime(Date date) {
		this.reviewTime = date;
	}

	public Integer getRewCollect() {
		if(memberSave!=null){
			rewCollect = memberSave.size();
		}else{
			rewCollect = 0;
		}
		return rewCollect;
	}

	public void setRewCollect(Integer rewCollect) {
		if(memberSave!=null){
			rewCollect = memberSave.size();
		}else{
			rewCollect = 0;
		}
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
	
	public Integer getReviewReport() {
		return reviewReport;
	}
	
	public void setReviewReport(Integer reviewReport) {
		this.reviewReport = reviewReport;
	}

	public Set<Review_Report> getReview_Reports() {
		return Review_Reports;
	}

	public void setReview_Reports(Set<Review_Report> review_Reports) {
		Review_Reports = review_Reports;
	}
	
}
