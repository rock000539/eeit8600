package tw.com.queautiful.product.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "ARTICLEREPLY")
public class ArticleReply {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ARTICLEREPLYID")
	private Long arId;

	@Column(name = "ARTICLEREPLYTITLE", columnDefinition = "nvarchar(30)")
	private String arTitle;

	@Column(name = "ARTICLEREPLYCONTENT", columnDefinition = "nvarchar(200)")
	private String arContent;

	@Column(name = "ARTICLEREPLYTIME")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Taipei")
	private java.sql.Timestamp arTime;

	@Column(name = "ARTICLEREPLYSHOW")
	private Boolean arShow;

	@Column(name = "ARTICLEREPLYREPORT") // 被檢舉次數
	private Integer arReport;

	@ManyToOne
	@JoinColumn(name = "ARTICLEID") // 留言對應文章
	@JsonIgnore
	private Article article;

	@Transient
	private Long articleId;

	@ManyToOne
	@JoinColumn(name = "MEMBERID") // 留言撰寫作者
	@JsonIgnore
	private Member member;

	@Transient
	private Long memberId;

	@Transient
	private String nickname;
	
	@Transient
	private java.sql.Date memberRegiDate;
	
	//回覆留言
	@OneToMany(mappedBy="articleReply" , fetch = FetchType.LAZY) 
	@OrderBy("ARTICLERCMTIME ASC")
	private Set<ArticleRCM> arcms;
	
	//回覆留言數
	@Transient
	private Integer arcmsSize;
	
	@Override
	public String toString() {
		return "ArticleReply [arId=" + arId + ", arTitle=" + arTitle + ", arContent=" + arContent + ", arTime=" + arTime
				+ ", arShow=" + arShow + ", arReport=" + arReport + ", articleId=" + articleId + ", memberId="
				+ memberId + ", nickname=" + nickname + ", memberRegiDate=" + memberRegiDate + "]";
	}

	public Long getArId() {
		return arId;
	}

	public void setArId(Long arId) {
		this.arId = arId;
	}

	public String getArTitle() {
		return arTitle;
	}

	public void setArTitle(String arTitle) {
		this.arTitle = arTitle;
	}

	public String getArContent() {
		return arContent;
	}

	public void setArContent(String arContent) {
		this.arContent = arContent;
	}

	public java.sql.Timestamp getArTime() {
		return arTime;
	}

	public void setArTime(java.sql.Timestamp arTime) {
		this.arTime = arTime;
	}

	public Boolean getArShow() {
		return arShow;
	}

	public void setArShow(Boolean arShow) {
		this.arShow = arShow;
	}

	public Integer getArReport() {
		return arReport;
	}

	public void setArReport(Integer arReport) {
		this.arReport = arReport;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
//		if(!article.getAreplies().contains(this)){
//			article.getAreplies().add(this);
//		}
	}

	public Long getArticleId() {
		if (articleId == null && article != null) {
			return this.getArticle().getArticleId();
		} else {
			return this.articleId;
		}
	}

	public void setArticleId(Long articleId) {
		this.articleId = articleId;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
		if (!member.getArepliesWroteByAuthor().contains(this)) {
			member.getArepliesWroteByAuthor().add(this);
		}
	}

	public Long getMemberId() {
		if (this.memberId == null && member != null) {
			return this.getMember().getMemberId();
		} else {
			return this.memberId;
		}
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public String getNickname() {
		if(this.nickname == null && this.member!=null){
			return this.getMember().getNickname();
		}else{
			return this.nickname;
		}
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public java.sql.Date getMemberRegiDate() {
		if(this.memberRegiDate == null && this.member!=null){
			return this.getMember().getMemberRegiDate();
		}else{
			return memberRegiDate;
		}
	}

	public void setMemberRegiDate(java.sql.Date memberRegiDate) {
		this.memberRegiDate = memberRegiDate;
	}

	public Set<ArticleRCM> getArcms() {
		return arcms;
	}

	public void setArcms(Set<ArticleRCM> arcms) {
		this.arcms = arcms;
	}

	public Integer getArcmsSize() {
		if(this.getArcms()!=null){
			return this.getArcms().size();
		} else {
			return 0 ;
		}
	}

	public void setArcmsSize(Integer arcmsSize) {
		this.arcmsSize = arcmsSize;
	}

}
