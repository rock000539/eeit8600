package tw.com.softleader.eeit8600.product.entity;

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
	private Byte[] brandImg;

	public ProductBrand() {
	}

	public ProductBrand(Long brandId, String brandName, Byte[] brandImg) {
		this.brandId = brandId;
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

	public Byte[] getBrandImg() {
		return brandImg;
	}

	public void setBrandImg(Byte[] brandImg) {
		this.brandImg = brandImg;
	}

}
