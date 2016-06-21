package tw.com.queautiful.product.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ARTICLE")
public class Article {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ARTICLEID")
	private Long articleId;
	
	@Column(name = "MEMBERID")
	private Long memberId;
	
	@Column(name = "ARTICLETYPE" ,length=10)
	private String articleType;
	
	@Column(name = "ARTICLETITLE" ,length=50)
	private String articleTitle;
	
	@Column(name = "ARTICLE" ,length=1000)
	private String article;
	
	@Column(name = "ARTICLETIME")
	private java.sql.Date articleTime;
	
	@Column(name = "ARTICLECOLLECT")
	private Integer	articleCollect;
	
	@Column(name = "ARTICLESHOW")
	private Boolean articleShow;
	
	@Column(name = "ARTICLEREPORT")
	private Integer articleReport;

	@Override
	public String toString() {
		return "Article [articleId=" + articleId + ", memberId=" + memberId + 
				", articleType=" + articleType + ", articleTitle=" + articleTitle + 
				", article=" + article + ", articleTime=" + articleTime + 
				", articleCollect=" + articleCollect + ", articleShow=" + articleShow + 
				", articleReport=" + articleReport + "]";
	}

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

	public String getArticleType() {
		return articleType;
	}

	public void setArticleType(String articleType) {
		this.articleType = articleType;
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public String getArticle() {
		return article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

	public java.sql.Date getArticleTime() {
		return articleTime;
	}

	public void setArticleTime(java.sql.Date articleTime) {
		this.articleTime = articleTime;
	}

	public Integer getArticleCollect() {
		return articleCollect;
	}

	public void setArticleCollect(Integer articleCollect) {
		this.articleCollect = articleCollect;
	}

	public Boolean getArticleShow() {
		return articleShow;
	}

	public void setArticleShow(Boolean articleShow) {
		this.articleShow = articleShow;
	}

	public Integer getArticleReport() {
		return articleReport;
	}

	public void setArticleReport(Integer articleReport) {
		this.articleReport = articleReport;
	}
	
	
}
