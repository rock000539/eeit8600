package tw.com.queautiful.product.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="ARTICLECM")
public class ArticleCM {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ARTICLECMID")
	private Long acmId;
	
	@Column(name="ARTICLECMMSG",length=200)
	private String acmMsg;

	@Column(name="ARTICLECMTIME")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Taipei")
	private java.sql.Timestamp acmTime;
	
	@Column(name="ARTICLECMSHOW")
	private Boolean acmShow;
	
	@Column(name="ARTICLECMREPORT") //被檢舉次數
	private Integer acmReport;
	
	@ManyToOne
	@JoinColumn(name="ARTICLEID") //留言對應文章
	@JsonIgnore
	private Article article;
	
	@Transient
	private Long articleId;
	
	@ManyToOne
	@JoinColumn(name="MEMBERID") //留言撰寫作者
	@JsonIgnore
	private Member member;
	
	@Transient
	private Long memberId;

	public Long getAcmId() {
		return acmId;
	}
	
	public void setAcmId(Long acmId) {
		this.acmId = acmId;
	}

	public String getAcmMsg() {
		return acmMsg;
	}
	
	public void setAcmMsg(String acmMsg) {
		this.acmMsg = acmMsg;
	}
	
	public java.sql.Timestamp getAcmTime() {
		return acmTime;
	}

	public void setAcmTime(java.sql.Timestamp acmTime) {
		this.acmTime = acmTime;
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

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
		if(!article.getAcms().contains(this)){
			article.getAcms().add(this);
		}
	}

	public Long getArticleId() {
		return this.article.getArticleId();
	}

	public void setArticleId(Long articleId) {
		this.articleId = articleId;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
		if(!member.getAcmsWroteByAuthor().contains(this)){
			member.getAcmsWroteByAuthor().add(this);
		}
	}

	public Long getMemberId() {
		return this.member.getMemberId();
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	
}
