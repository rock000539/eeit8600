package tw.com.softleader.eeit8600.product.entity;

import java.sql.Blob;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "BRAND")
public class Brand {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "BRANDID")
	private Long brandId;

	@Column(name = "BRANDNAME", length = 50)
	private String brandName;

	@Column(name = "BRANDIMG", length = 200)
	private String brandImg;

	@Column(name = "WEBSITE", length = 200)
	private String website;

	@Column(name = "BCFUNC", length = 20)
	private String bcFunc;

	@Column(name = "BRANDSHOW")
	private boolean brandShow;

//	@OneToMany
//	private List<Product> products;
	
	@Transient
	private MultipartFile brandImgFile;
	
	
	
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

	public String getBrandImg() {
		return brandImg;
	}

	public void setBrandImg(String brandImg) {
		this.brandImg = brandImg;
	}

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

	public boolean isBrandShow() {
		return brandShow;
	}

	public void setBrandShow(boolean brandShow) {
		this.brandShow = brandShow;
	}

	public MultipartFile getBrandImgFile() {
		return brandImgFile;
	}

	public void setBrandImgFile(MultipartFile brandImgFile) {
		this.brandImgFile = brandImgFile;
	}

}
