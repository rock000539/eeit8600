package tw.com.queautiful.product.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "ARTICLE")
public class Article {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ARTICLEID")
	private Long articleId;
	
	@Column(name = "MEMBER_ID")	//與many to one重覆
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
	
	@ManyToMany(mappedBy = "articles_save") //文章收藏
	@JsonIgnore
	private List<Member> members;
	
	@ManyToOne
	@JoinColumn(name="MEMBERID")	//文章撰寫作者
	private Member member;

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

	public List<Member> getMembers() {
		return members;
	}

	public void setMembers(List<Member> members) {
		this.members = members;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
	
}
