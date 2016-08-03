package tw.com.queautiful.product.entity;

import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
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

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import tw.com.queautiful.commons.enums.ArticleType;

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
	
	@Column(name = "ARTICLETITLE" ,columnDefinition="nvarchar(20)")
	private String articleTitle;
	
	@Column(name = "ARTICLECONTENT" ,columnDefinition="nvarchar(2000)")
	private String articleContent;
	
	@Column(name = "ARTICLETIME")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Taipei")
	private java.sql.Timestamp articleTime;
	
	@Column(name = "AEDITTIME")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Taipei")
	private java.sql.Timestamp aEditTime;
	
	//文章觀看次數
	@Column(name="ARTICLEVIEW") 
	private Integer articleView;
	
//	//文章收藏數
//	@Column(name = "ARTICLECOLLECT") 
//	private Integer	articleCollect;
	
	@Column(name = "ARTICLESHOW")
	private Boolean articleShow;
	
	//文章檢舉次數
	@Column(name = "ARTICLEREPORT") 
	private Integer articleReport;
	
	//回覆數
	@Transient
	private Integer arSize;

	//留言數
	@Transient
	private Integer acmsSize;

	//文章收藏者
	@ManyToMany(mappedBy = "articlesSavedByMember") 
	@JsonIgnore
	private Set<Member> memberSave;
	
	//文章撰寫作者
	@ManyToOne
	@JoinColumn(name="memberID_author")	
	@JsonIgnore
	private Member member;
	
	@Transient
	private Long memberId;
	
	@Transient
	private String nickname;
	
	@Transient
	private java.sql.Date memberRegiDate;
	
	//文章回覆
	@OneToMany(mappedBy="article" , fetch = FetchType.LAZY) 
	@OrderBy("ARTICLEREPLYTIME ASC")
	private List<ArticleReply> areplies;
	
	//文章留言
	@OneToMany(mappedBy="article" , fetch = FetchType.LAZY) 
	@OrderBy("ARTICLECMTIME ASC")
	private Set<ArticleCM> acms;
	
	@Override
	public String toString() {
		return "Article [articleId=" + articleId + ", articleType=" + articleType + ", articleTitle=" + articleTitle
				+ ", articleContent=" + articleContent + ", articleTime=" + articleTime + ", aEditTime=" + aEditTime
				+ ", articleView=" + articleView + ", articleShow=" + articleShow + ", articleReport=" + articleReport
				+ ", arSize=" + arSize + ", acmsSize=" + acmsSize + ", memberId=" + memberId + ", nickname=" + nickname
				+ ", memberRegiDate=" + memberRegiDate + "]";
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

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	public java.sql.Timestamp getArticleTime() {
		return articleTime;
	}

	public void setArticleTime(java.sql.Timestamp articleTime) {
		this.articleTime = articleTime;
	}
	
	public java.sql.Timestamp getaEditTime() {
		return aEditTime;
	}

	public void setaEditTime(java.sql.Timestamp aEditTime) {
		this.aEditTime = aEditTime;
	}

	public Integer getArticleView() {
		return articleView;
	}

	public void setArticleView(Integer articleView) {
		this.articleView = articleView;
	}

//	public Integer getArticleCollect() {
//		if(memberSave != null){
//			return articleCollect=memberSave.size();
//		}else{
//			return 0;
//		}
//	}
//
//	public void setArticleCollect(Integer articleCollect) {
//		this.articleCollect = articleCollect;
//	}

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

	public Integer getArSize() {
		if(this.getAreplies()!=null){
			return this.getAreplies().size();
		}else {
			return 0 ;
		}
	}

	public void setArSize(Integer arSize) {
		this.arSize = arSize;
	}

	public Integer getAcmsSize() {
		if(this.getAcms()!=null){			
			return this.getAcms().size();
		}else {
			return 0 ;
		}
	}

	public void setAcmsSize(Integer acmsSize) {
		this.acmsSize = acmsSize;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Set<Member> getMemberSave() {
		return memberSave;
	}

	public void setMemberSave(Set<Member> memberSave) {
		this.memberSave = memberSave;
	}

	public Long getMemberId() {
		if(this.memberId==null && this.member!=null){  //select
		return this.getMember().getMemberId();
		}else{ //update&insert
			return this.memberId;
		}
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public String getNickname() {
		if(this.nickname==null && this.member!=null){
			return this.getMember().getNickname();
		}else{
			return nickname;
		}
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public java.sql.Date getMemberRegiDate() {
		if(this.nickname==null && this.member!=null){
			return this.getMember().getMemberRegiDate();
		}else{
			return memberRegiDate;
		}
	}

	public void setMemberRegiDate(java.sql.Date memberRegiDate) {
		this.memberRegiDate = memberRegiDate;
	}

	public List<ArticleReply> getAreplies() {
		return areplies;
	}

	public void setAreplies(List<ArticleReply> areplies) {
		this.areplies = areplies;
	}

	public Set<ArticleCM> getAcms() {
		return acms;
	}

	public void setAcms(Set<ArticleCM> acms) {
		this.acms = acms;
	}

	
}
