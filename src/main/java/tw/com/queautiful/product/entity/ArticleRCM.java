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
@Table(name = "ARTICLERCM")
public class ArticleRCM {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ARTICLERCMID")
	private Long arcmId;

	@Column(name = "ARTICLERCMMSG", columnDefinition = "nvarchar(200)")
	private String arcmMsg;

	@Column(name = "ARTICLERCMTIME")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Taipei")
	private java.sql.Timestamp arcmTime;

	@Column(name = "ARTICLERCMSHOW")
	private Boolean arcmShow;

	@Column(name = "ARTICLERCMREPORT") // 被檢舉次數
	private Integer arcmReport;

	@ManyToOne
	@JoinColumn(name = "ARTICLEREPLYID") // 留言對應文章
	@JsonIgnore
	private ArticleReply articleReply;

	@Transient
	private Long arId;

	@ManyToOne
	@JoinColumn(name = "MEMBERID") // 留言撰寫作者
	@JsonIgnore
	private Member member;

	@Transient
	private Long memberId;

	@Transient
	private String nickname;
	
	public Long getArcmId() {
		return arcmId;
	}

	public void setArcmId(Long arcmId) {
		this.arcmId = arcmId;
	}

	public String getArcmMsg() {
		return arcmMsg;
	}

	public void setArcmMsg(String arcmMsg) {
		this.arcmMsg = arcmMsg;
	}

	public java.sql.Timestamp getArcmTime() {
		return arcmTime;
	}

	public void setArcmTime(java.sql.Timestamp arcmTime) {
		this.arcmTime = arcmTime;
	}

	public Boolean getArcmShow() {
		return arcmShow;
	}

	public void setArcmShow(Boolean arcmShow) {
		this.arcmShow = arcmShow;
	}

	public Integer getArcmReport() {
		return arcmReport;
	}

	public void setArcmReport(Integer arcmReport) {
		this.arcmReport = arcmReport;
	}

	public ArticleReply getArticleReply() {
		return articleReply;
	}

	public void setArticleReply(ArticleReply articleReply) {
		this.articleReply = articleReply;
		if(!articleReply.getArcms().contains(this)){
			articleReply.getArcms().add(this);
		}
	}

	public Long getArId() {
		if(arId == null && articleReply != null){
			return this.getArticleReply().getArId();
		} else {
			return arId;
		}
	}

	public void setArId(Long arId) {
		this.arId = arId;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
		if (!member.getArcmsWroteByAuthor().contains(this)) {
			member.getArcmsWroteByAuthor().add(this);
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

}
