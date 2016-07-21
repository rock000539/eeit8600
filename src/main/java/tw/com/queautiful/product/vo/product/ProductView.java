package tw.com.queautiful.product.vo.product;

import java.sql.Date;
import java.util.List;
import tw.com.queautiful.product.entity.Review;

public class ProductView {
	
	private String prodName;

	private String brandName;
	
	private String categoryName;

	private Double score;

	private Date launchDate;

	private String prodDesc;

	private Integer mainIgdt;

	private String prodImg;
	
	private List<Review> reviews;

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public Date getLaunchDate() {
		return launchDate;
	}

	public void setLaunchDate(Date launchDate) {
		this.launchDate = launchDate;
	}

	public String getProdDesc() {
		return prodDesc;
	}

	public void setProdDesc(String prodDesc) {
		this.prodDesc = prodDesc;
	}

	public Integer getMainIgdt() {
		return mainIgdt;
	}

	public void setMainIgdt(Integer mainIgdt) {
		this.mainIgdt = mainIgdt;
	}

	public String getProdImg() {
		return prodImg;
	}

	public void setProdImg(String prodImg) {
		this.prodImg = prodImg;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	@Override
	public String toString() {
		
		String result = "ProductView [prodName=" + prodName + ", brandName=" + brandName + ", categoryName=" + categoryName
				+ ", score=" + score + ", launchDate=" + launchDate + ", prodDesc=" + prodDesc + ", mainIgdt="
				+ mainIgdt + ", prodImg=" + prodImg + "]";
		
		if (reviews != null) {
			for (Review review : reviews) {
				result += String.format("\nReview[id=%d, title='%s']", review.getReviewId(), review.getReviewTitle());
			}
		} else {
			result += " Reviews is null";
		}
		
		return result;
	}

	
	
}
