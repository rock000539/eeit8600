package tw.com.queautiful.product.entity;

import java.io.Serializable;

public class Review_TagListId implements Serializable {
	protected Long reviewId;
    protected Long reviewTagId;

    public Review_TagListId() {}

    public Review_TagListId(Long reviewId,Long reviewTagId) {
        this.reviewId = reviewId;
        this.reviewTagId = reviewTagId;
    }
}
