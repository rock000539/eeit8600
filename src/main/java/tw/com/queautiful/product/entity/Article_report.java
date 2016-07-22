package tw.com.queautiful.product.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@IdClass(Article_reportId.class)
@Table(name="ARTICLE_REPORT")
public class Article_report implements Serializable{
	@Id
	@Column(name ="ARTICLEID")
	private Long articleId;
	@Id
	@Column(name ="MEMBERID")
	private Long memberId;
	
	private Long article_athorId;
	
	private String reportTitle;
	
	private String reportContent;
	
	private java.sql.Date reportDate;

	public Long getArticleId() {
		return articleId;
	}

	public void setArticleId(Long articleId) {
		this.articleId = articleId;
	}

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
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

	public Long getArticleId_athorId() {
		return article_athorId;
	}

	public void setArticleId_athorId(Long articleId_athorId) {
		this.article_athorId = articleId_athorId;
	}

	@Override
	public String toString() {
		return "Article_report [articleId=" + articleId + ", memberId=" + memberId + ", articleId_athorId="
				+ article_athorId + ", reportTitle=" + reportTitle + ", reportContent=" + reportContent
				+ ", reportDate=" + reportDate + "]";
	}


	
}
