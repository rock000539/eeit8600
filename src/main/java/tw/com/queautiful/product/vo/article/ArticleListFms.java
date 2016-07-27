package tw.com.queautiful.product.vo.article;

import javax.persistence.Column;

import com.fasterxml.jackson.annotation.JsonFormat;

import tw.com.queautiful.commons.enums.ArticleType;
import tw.com.queautiful.product.entity.ArticleReply;

public class ArticleListFms {

	private Long articleId;
	
	private ArticleType articleType;
	
	private String articleTitle;
	
	private String articleContent;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Taipei")
	private java.sql.Timestamp articleTime;

	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Taipei")
	private java.sql.Timestamp aEditTime;
	
	//文章觀看次數
	private Integer articleView;
	
	private Long memberId;
	
	private String nickname;
	
//	private java.sql.Date memberRegiDate;
	
	//回覆數
	private Integer arSize;
	
	//最新回覆
	private ArticleReply lastPost;

	//留言數
	private Integer acmsSize;

	@Override
	public String toString() {
		return "ArticleListFms [articleId=" + articleId + ", articleType=" + articleType + ", articleTitle="
				+ articleTitle + ", articleContent=" + articleContent + ", articleTime=" + articleTime
				+ ", articleView=" + articleView + ", memberId=" + memberId + ", nickname=" + nickname + "]";
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
	
//	public java.sql.Date getMemberRegiDate() {
//		return memberRegiDate;
//	}
//
//	public void setMemberRegiDate(java.sql.Date memberRegiDate) {
//		this.memberRegiDate = memberRegiDate;
//	}

	public Integer getArSize() {
		return arSize;
	}

	public void setArSize(Integer arSize) {
		this.arSize = arSize;
	}
	
	public ArticleReply getLastPost() {
		return lastPost;
	}

	public void setLastPost(ArticleReply lastPost) {
		this.lastPost = lastPost;
	}

	public Integer getAcmsSize() {
		return acmsSize;
	}

	public void setAcmsSize(Integer acmsSize) {
		this.acmsSize = acmsSize;
	}
	
	
}
