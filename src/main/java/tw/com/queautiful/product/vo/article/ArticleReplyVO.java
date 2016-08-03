package tw.com.queautiful.product.vo.article;

import java.util.Set;

import javax.persistence.OrderBy;

import com.fasterxml.jackson.annotation.JsonFormat;

import tw.com.queautiful.product.entity.ArticleCM;
import tw.com.queautiful.product.entity.ArticleRCM;
import tw.com.queautiful.product.entity.Member;

public class ArticleReplyVO {

	private Long arId;

	private String arTitle;

	private String arContent;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Taipei")
	private java.sql.Timestamp arTime;

	private Long articleId;

	private Long memberId;

	private String nickname;
	
	private java.sql.Date memberRegiDate;
	
	//回覆留言
	@OrderBy("ARTICLERCMTIME ASC")
	private Set<ArticleRCM> arcms;
	
	//回覆留言數
	private Integer arcmsSize;
	
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public java.sql.Date getMemberRegiDate() {
		return memberRegiDate;
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
		return arcmsSize;
	}

	public void setArcmsSize(Integer arcmsSize) {
		this.arcmsSize = arcmsSize;
	}

}
