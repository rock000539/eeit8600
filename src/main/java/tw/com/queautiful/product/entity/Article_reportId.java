package tw.com.queautiful.product.entity;

import java.io.Serializable;

public class Article_reportId implements Serializable{

	protected Long articleId;
    protected Long memberId;

    public Article_reportId() {}

    public Article_reportId(Long articleId,Long memberId) {
        this.articleId = articleId;
        this.memberId = memberId;
    }
}
