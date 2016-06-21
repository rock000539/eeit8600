package tw.com.queautiful.product.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;

import javax.persistence.Id;

@Entity
@Table(name="REVIEWCM")
public class ReviewCM {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="REVIEWCMID")
	private Long rcmId;
	
	@Column(name="REVIEWID")
	private Long reviewId;
	
	@Column(name="REVIEWCMMSG",length=200)
	private String rcmMsg;
	
	@Column(name="MEMBERID")
	private Long memberId;
	
	@Column(name="REVIEWCMSHOW")
	private Boolean rcmShow;
	
	@Column(name="REVIEWCMREPORT")
	private Integer rcmReport;

	public Long getRcmId() {
		return rcmId;
	}

	public void setRcmId(Long rcmId) {
		this.rcmId = rcmId;
	}

	public Long getReviewId() {
		return reviewId;
	}

	public void setReviewId(Long reviewId) {
		this.reviewId = reviewId;
	}

	public String getRcmMsg() {
		return rcmMsg;
	}

	public void setRcmMsg(String rcmMsg) {
		this.rcmMsg = rcmMsg;
	}

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
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

	@Override
	public String toString() {
		return "ReviewCM [rcmId=" + rcmId + ", reviewId=" + reviewId
				+ ", rcmMsg=" + rcmMsg + ", memberId=" + memberId
				+ ", rcmShow=" + rcmShow + ", rcmReport=" + rcmReport + "]";
	}

}

