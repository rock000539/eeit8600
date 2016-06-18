package tw.com.queautiful.product.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="PRODUCT")
public class Product {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="PRODID")
	private Long prodId;
	
	@Column(name="PRODNAME", length=30)
	private String prodName;
	
	@Column(name="BRANDID")
	private Long brandId;
	
	@Column(name="CATEGORYID")
	private Long categoryId;
	
	@Column(name="WEIGHT")
	private Double weight;
	
	@Column(name="SCORE")
	private Double score;
	
	@Column(name="PRICE")
	private Integer price;
	
	@Column(name="CAPACITY")
	private Integer capacity;
	
	@Column(name="LAUNCHDATE")
	private Date launchDate;
	
	@Column(name="PRODDESC", length=100)
	private String prodDesc;
	
	@Column(name="MAINIGDT")
	private Integer mainIgdt;
	
	@Column(name="CONCENTRATION")
	private Double concentration;
	
	@Column(name="PRODIMG", length=100)
	private String prodImg;
	
	@Transient
	private MultipartFile prodImgFile;

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

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
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
	
	public MultipartFile getProdImgFile() {
		return prodImgFile;
	}
	
	public void setProdImgFile(MultipartFile prodImgFile) {
		this.prodImgFile = prodImgFile;
	}
}
