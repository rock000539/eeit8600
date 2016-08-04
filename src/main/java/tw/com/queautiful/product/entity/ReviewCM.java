package tw.com.queautiful.product.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="REVIEWCM")
public class ReviewCM {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="REVIEWCMID")
	private Long rcmId;
	
	@ManyToOne
	@JoinColumn(name="REVIEWID")
	@JsonIgnore
	private Review review;

	@Transient
	private Long reviewId;
	
	@ManyToOne
	@JoinColumn(name="MEMBERID")
	@JsonIgnore
	private Member member;

	@Transient
	private Long memberId;
	
	@Transient
	private String nickname;

	//心得留言內容
	@Column(name = "REVIEWCMMSG", columnDefinition = "nvarchar(max)")
	private String rcmMsg;
	
	//心得留言時間
	@Column(name="REVIEWCMTIME")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Taipei")
	private java.sql.Timestamp rcmTime;
	
	//心得留言顯示或隱藏
	@Column(name="REVIEWCMSHOW")
	private Boolean rcmShow;
	
	//心得留言檢舉次數
	@Column(name="REVIEWCMREPORT")
	private Integer rcmReport;

	public Long getRcmId() {
		return rcmId;
	}

	public void setRcmId(Long rcmId) {
		this.rcmId = rcmId;
	}

	public String getRcmMsg() {
		return rcmMsg;
	}

	public void setRcmMsg(String rcmMsg) {
		this.rcmMsg = rcmMsg;
	}

	public java.sql.Timestamp getRcmTime() {
		return rcmTime;
	}

	public void setRcmTime(java.sql.Timestamp rcmTime) {
		this.rcmTime = rcmTime;
	}
	
	public Boolean getRcmShow() {
		return rcmShow;
	}

	public void setRcmShow(Boolean rcmShow) {
		this.rcmShow = rcmShow;
	}

	public Integer getRcmReport() {
		return rcmReport;
	}

	public void setRcmReport(Integer rcmReport) {
		this.rcmReport = rcmReport;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
//		if(!review.getRcms().contains(this)){
//			review.getRcms().add(this);
//		}
	}

	public Long getReviewId() {
		if(this.reviewId==null && review!=null){
			return this.getReview().getReviewId();
		}else{
			return reviewId;
		}
	}

	public void setReviewId(Long reviewId) {
		this.reviewId = reviewId;
	}
	
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
		if(!member.getRcmsWroteByAuthor().contains(this)){
			member.getRcmsWroteByAuthor().add(this);
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


	public String getNickname() {
		return this.getMember().getNickname();
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	
	@Override
	public String toString() {
		return "ReviewCM [rcmId=" + rcmId + ", review=" + review
				+ ", reviewId=" + reviewId + ", member=" + member
				+ ", memberId=" + memberId + ", rcmMsg=" + rcmMsg
				+ ", reviewCMTime=" + rcmTime + ", rcmShow=" + rcmShow
				+ ", rcmReport=" + rcmReport + "]";
	}
	
	
}


