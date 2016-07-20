package tw.com.queautiful.product.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name="REVIEW_REPORT")
public class Review_Report implements Serializable{
	@Id
	private long id;
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name ="REVIEWID")
	private Review review;

	@ManyToOne
	@JoinColumn(name="MEMBERID")
	@JsonIgnore
	private Member member;
	
	private Long reportMemberId;
	
	private String reportTitle;
	
	private String reportContent;
	
	private java.sql.Date reportDate;

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Long getReportMemberId() {
		return reportMemberId;
	}

	public void setReportMemberId(Long reportMemberId) {
		this.reportMemberId = reportMemberId;
	}

	public String getReportTitle() {
		return reportTitle;
	}

	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public java.sql.Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(java.sql.Date reportDate) {
		this.reportDate = reportDate;
	}


}
