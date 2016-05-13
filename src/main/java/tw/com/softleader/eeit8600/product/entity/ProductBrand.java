package tw.com.softleader.eeit8600.product.entity;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "BRAND")
public class ProductBrand {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "BRANDID")
	private Long brandId;

	@Column(name = "BRANDNAME", length = 50)
	private String brandName;

	@Column(name = "BRANDIMG")
	private Blob brandImg;

	public ProductBrand() {
	}

	public ProductBrand(String brandName, Blob brandImg) {
		this.brandName = brandName;
		this.brandImg = brandImg;
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

	public Blob getBrandImg() {
		return brandImg;
	}

	public void setBrandImg(Blob brandImg) {
		this.brandImg = brandImg;
	}

}
