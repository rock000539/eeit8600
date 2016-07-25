package tw.com.queautiful.product.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@IdClass(Review_TagListId.class)
@Table(name = "REVIEW_TAGLIST")
public class Review_TagList implements Serializable {
	@Id
	@Column(name ="REVIEWID")
	private Long reviewId;
	@Id
	@Column(name ="REVIEWTAGID")
	private Long reviewTagId;
	
	
	
	@Override
	public String toString() {
		return "Review_TagList [reviewId=" + reviewId + ", reviewTagId=" + reviewTagId + "]";
	}
	public Long getReviewId() {
		return reviewId;
	}
	public void setReviewId(Long reviewId) {
		this.reviewId = reviewId;
	}
	public Long getReviewTagId() {
		return reviewTagId;
	}
	public void setReviewTagId(Long reviewTagId) {
		this.reviewTagId = reviewTagId;
	}
	
	
}
