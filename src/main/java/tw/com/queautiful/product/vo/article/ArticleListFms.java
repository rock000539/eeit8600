package tw.com.queautiful.product.vo.article;

import tw.com.queautiful.commons.enumeration.ArticleType;

public class ArticleListFms {

	private Long articleId;
	
	private ArticleType articleType;
	
	private String articleTitle;
	
	private String articleContent;
	
	private java.sql.Timestamp articleTime;
	
	//文章觀看次數
	private Integer articleView;
	
	private Long memberId;
	
	private String nickname;
	
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

	public Integer getAcmsSize() {
		return acmsSize;
	}

	public void setAcmsSize(Integer acmsSize) {
		this.acmsSize = acmsSize;
	}
	
	
}
