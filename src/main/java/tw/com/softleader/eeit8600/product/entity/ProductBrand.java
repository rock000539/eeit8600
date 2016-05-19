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

//	@Column(name = "BRANDIMG")
//	private Blob brandImg;
	
	@Column(name = "WEBSITE", length = 200)
	private String website;
	
	@Column(name = "BCFUNC" , length = 20)
	private String bcFunc;

	public ProductBrand() {
	}

	public ProductBrand(String brandName, 
			//Blob brandImg, 
			String website, String bcFunc) {
		this.brandName = brandName;
		//this.brandImg = brandImg;
		this.website = website;
		this.bcFunc = bcFunc;
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

//	public Blob getBrandImg() {
//		return brandImg;
//	}
//
//	public void setBrandImg(Blob brandImg) {
//		this.brandImg = brandImg;
//	}
	
	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getBcFunc() {
		return bcFunc;
	}

	public void setBcFunc(String bcFunc) {
		this.bcFunc = bcFunc;
	}

}
