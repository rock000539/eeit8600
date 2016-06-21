package tw.com.queautiful.product.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ARTICLECM")
public class ArticleCM {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ARTICLECMID")
	private Long acmId;
	
	@Column(name="ARTICLEID")
	private Long articleId;
	
	@Column(name="ARTICLECMMSG",length=200)
	private String acmMsg;
	
	@Column(name="MEMBERID")
	private Long memberId;
	
	@Column(name="ARTICLECMSHOW")
	private Boolean acmShow;
	
	@Column(name="ARTICLECMREPORT")
	private Integer acmReport;
	
	@Override
	public String toString() {
		return "ArticleCM [acmId=" + acmId + ", articleId=" + articleId
				+ ", acmMsg=" + acmMsg + ", memberId=" + memberId + ", acmShow="
				+ acmShow + ", acmReport=" + acmReport + "]";
	}
	
	public Long getAcmId() {
		return acmId;
	}
	
	public void setAcmId(Long acmId) {
		this.acmId = acmId;
	}
	
	public Long getArticleId() {
		return articleId;
	}
	
	public void setArticleId(Long articleId) {
		this.articleId = articleId;
	}
	
	public String getAcmMsg() {
		return acmMsg;
	}
	
	public void setAcmMsg(String acmMsg) {
		this.acmMsg = acmMsg;
	}
	
	public Long getMemberId() {
		return memberId;
	}
	
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	
	public Boolean getAcmShow() {
		return acmShow;
	}
	
	public void setAcmShow(Boolean acmShow) {
		this.acmShow = acmShow;
	}
	
	public Integer getAcmReport() {
		return acmReport;
	}
	
	public void setAcmReport(Integer acmReport) {
		this.acmReport = acmReport;
	}
}
