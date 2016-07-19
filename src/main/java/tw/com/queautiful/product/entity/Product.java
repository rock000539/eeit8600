package tw.com.queautiful.product.entity;

import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "PRODUCT")
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PRODID")
	private Long prodId;

	@Column(name = "PRODNAME", length = 30)
	private String prodName;

	@ManyToOne
	@JoinColumn(name = "BRANDID")
	@JsonIgnore
	private Brand brand;

	@Transient
	private Long brandId;
	
	@Transient
	private String brandName;

	@ManyToOne
	@JoinColumn(name = "CATEGORYID")
	@JsonIgnore
	private Category category;

	@Transient
	private Long categoryId;

	//雙向(對應Review Entity的@ManyToOne 設的變數名)
	//difference-between-fetchtype-lazy-and-eager
	@OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
	@OrderBy("REVIEWTIME DESC")
	private List<Review> reviews;

	@Column(name = "WEIGHT")
	private Double weight;

	@Column(name = "SCORE")
	private Double score;

	@Column(name = "PRICE")
	private Integer price;

	@Column(name = "CAPACITY")
	private Integer capacity;

	@Column(name = "LAUNCHDATE")
	private Date launchDate;

	@Column(name = "PRODDESC", length = 100)
	private String prodDesc;

	@Column(name = "MAINIGDT")
	private Integer mainIgdt;

	@Column(name = "CONCENTRATION")
	private Double concentration;

	@Column(name = "PRODIMG", length = 100)
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

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
		if (!brand.getProducts().contains(this)) {
			brand.getProducts().add(this);
		}
	}

	public Long getBrandId() {
		if (this.brandId == null && brand != null) { // select
			return this.getBrand().getBrandId();
		} else { // insert&update
			return this.brandId;
		}
	}
	
	public void setBrandId(Long brandId) {
		this.brandId = brandId;
	}
	
	public String getBrandName() {
		return this.getBrand().getBrandName();
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
		if (!category.getProducts().contains(this)) {
			category.getProducts().add(this);
		}
	}

	public Long getCategoryId() {
		if (this.categoryId == null && category != null) { // select
			return this.getCategory().getCategoryId();
		} else { // insert&update
			return this.categoryId;
		}
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public void addReviews(Review review) {  //自己設的method,可以新增review對應的product
		this.reviews.add(review); //改變product的review list
		if (review.getProduct() != this) { //review對應的product不是對應到review的list的product就重設product
			review.setProduct(this);
		}
	}

	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
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

	public Integer getMainIgdt() {
		return mainIgdt;
	}

	public void setMainIgdt(Integer mainIgdt) {
		this.mainIgdt = mainIgdt;
	}

	public Double getConcentration() {
		return concentration;
	}

	public void setConcentration(Double concentration) {
		this.concentration = concentration;
	}

	public String getProdImg() {
		return prodImg;
	}

	public void setProdImg(String prodImg) {
		this.prodImg = prodImg;
	}

	@Override
	public String toString() {
		return "Product [prodName=" + prodName + "]";
	}

//	@Override
//	public String toString() {
//		return "Product [prodId=" + prodId + ", prodName=" + prodName + ", brand=" + brand + ", brandId=" + brandId
//				+ ", category=" + category + ", categoryId=" + categoryId + ", reviews=" + reviews + ", weight="
//				+ weight + ", score=" + score + ", price=" + price + ", capacity=" + capacity + ", launchDate="
//				+ launchDate + ", prodDesc=" + prodDesc + ", mainIgdt=" + mainIgdt + ", concentration=" + concentration
//				+ ", prodImg=" + prodImg + "]";
//	}

}
