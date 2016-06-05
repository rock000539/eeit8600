package tw.com.softleader.eeit8600.product.entity;

import java.sql.Date;
import java.util.Arrays;

public class Product {
	private Long proId;
	private String prodName;
	private Long brandId;
	private Long categoryId;
	private Integer weight;
	private Integer score;
	private Integer price;
	private Integer capacity;
	private Date launchDate;
	private String prodDesc;
	private String mainIgdt;
	private Integer concentration;
	private byte[] prodImg;

	public Long getProId() {
		return proId;
	}

	public void setProId(Long proId) {
		this.proId = proId;
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

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getCapacity() {
		return capacity;
	}

	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
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

	public String getMainIgdt() {
		return mainIgdt;
	}

	public void setMainIgdt(String mainIgdt) {
		this.mainIgdt = mainIgdt;
	}

	public Integer getConcentration() {
		return concentration;
	}

	public void setConcentration(Integer concentration) {
		this.concentration = concentration;
	}

	public byte[] getProdImg() {
		return prodImg;
	}

	public void setProdImg(byte[] prodImg) {
		this.prodImg = prodImg;
	}

	@Override
	public String toString() {
		return "Product [proId=" + proId + ", prodName=" + prodName + ", brandId=" + brandId + ", categoryId="
				+ categoryId + ", weight=" + weight + ", score=" + score + ", price=" + price + ", capacity=" + capacity
				+ ", launchDate=" + launchDate + ", prodDesc=" + prodDesc + ", mainIgdt=" + mainIgdt
				+ ", concentration=" + concentration + ", prodImg=" + Arrays.toString(prodImg) + "]";
	}

}
