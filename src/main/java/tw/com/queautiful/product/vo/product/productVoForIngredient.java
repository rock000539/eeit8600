package tw.com.queautiful.product.vo.product;

import java.sql.Date;

public class productVoForIngredient {
	
	private Long prodId;
	
	private String prodName;
	
	private Long brandId;
	
	private String brandName;
	
	private Long CategoryId;
	
	private String categoryName;

	private Double score;

	private Date launchDate;

	private String prodDesc;

	private Integer mainIgdt;

	private String prodImg;

	public Long getProdId() {
		return prodId;
	}

	public void setProdId(Long prodId) {
		this.prodId = prodId;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public Long getBrandId() {
		return brandId;
	}

	public void setBrandId(Long brandId) {
		this.brandId = brandId;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public Long getCategoryId() {
		return CategoryId;
	}

	public void setCategoryId(Long categoryId) {
		CategoryId = categoryId;
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

	@Override
	public String toString() {
		return "productVoForIngredient [prodId=" + prodId + ", prodName=" + prodName + ", brandId=" + brandId
				+ ", brandName=" + brandName + ", CategoryId=" + CategoryId + ", categoryName=" + categoryName
				+ ", score=" + score + ", launchDate=" + launchDate + ", prodDesc=" + prodDesc + ", mainIgdt="
				+ mainIgdt + ", prodImg=" + prodImg + "]";
	}
	
	
}
