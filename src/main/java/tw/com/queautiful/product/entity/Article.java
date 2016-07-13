package tw.com.queautiful.product.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

import tw.com.queautiful.commons.util.ArticleType;

@Entity
@Table(name = "ARTICLE")
public class Article {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ARTICLEID")
	private Long articleId;
	
	@Column(name = "ARTICLETYPE" ,length=10)
	@Enumerated(EnumType.STRING)
	private ArticleType articleType;
	
	@Column(name = "ARTICLETITLE" ,length=50)
	private String articleTitle;
	
	@Column(name = "ARTICLE" ,length=1000)
	private String article;
	
	@Column(name = "ARTICLETIME")
	private java.sql.Date articleTime;
	
	@Column(name = "ARTICLECOLLECT") //文章收藏數
	private Integer	articleCollect;
	
	@Column(name = "ARTICLESHOW")
	private Boolean articleShow;
	
	@Column(name = "ARTICLEREPORT") //文章檢舉次數
	private Integer articleReport;
	
	@ManyToMany(mappedBy = "articlesSavedByMember") //文章收藏者
	private Set<Member> members;
	
	@ManyToOne
	@JoinColumn(name="memberID_author")	//文章撰寫作者
	private Member member;
	
	@Transient
	private Long memberId;

	@Override
	public String toString() {
		return "Article [articleId=" + articleId + ", articleType=" + articleType + ", articleTitle=" + articleTitle
				+ ", article=" + article + ", articleTime=" + articleTime + ", articleCollect=" + articleCollect
				+ ", articleShow=" + articleShow + ", articleReport=" + articleReport + ", members=" + members
				+ ", member=" + member + ", memberId=" + memberId + "]";
	}

	public Long getArticleId() {
		return articleId;
	}
	
	public void setArticleId(Long articleId) {
		this.articleId = articleId;
	}

	public ArticleType getArticleType() {
		return articleType;
	}

	public void setArticleType(ArticleType articleType) {
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

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Set<Member> getMembers() {
		return members;
	}

	public void setMembers(Set<Member> members) {
		this.members = members;
	}

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	
	
}
