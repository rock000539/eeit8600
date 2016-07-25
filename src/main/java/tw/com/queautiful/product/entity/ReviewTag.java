package tw.com.queautiful.product.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "REVIEWTAG")
public class ReviewTag {
	@Id
	private Long reviewTagId;
	
	private String reviewTagName;
	
	
	@Override
	public String toString() {
		return "reviewTag [reviewTagId=" + reviewTagId + ", reviewTagName=" + reviewTagName + "]";
	}
	public Long getReviewTagId() {
		return reviewTagId;
	}
	public void setReviewTagId(Long reviewTagId) {
		this.reviewTagId = reviewTagId;
	}
	public String getReviewTagName() {
		return reviewTagName;
	}
	public void setReviewTagName(String reviewTagName) {
		this.reviewTagName = reviewTagName;
	}
	
	
}
