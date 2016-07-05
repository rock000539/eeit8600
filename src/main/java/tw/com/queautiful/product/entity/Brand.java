package tw.com.queautiful.product.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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

	@Column(name = "BRANDCNAME", length =20)
	private String brandCName;
	
	@Column(name = "BRANDIMG", length = 200)
	private String brandImg;

	@Column(name = "WEBSITE", length = 200)
	private String website;

	@Column(name = "BCFUNC", length = 20)
	private String bcFunc;

	@Column(name = "BRANDSHOW")
	private Boolean brandShow;

	@OneToMany(mappedBy = "brand", fetch = FetchType.EAGER)
	private List<Product> products;
	
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

	public String getBrandCName() {
		return brandCName;
	}

	public void setBrandCName(String brandCName) {
		this.brandCName = brandCName;
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

	public Boolean getBrandShow() {
		return brandShow;
	}

	public void setBrandShow(Boolean brandShow) {
		this.brandShow = brandShow;
	}

	public MultipartFile getBrandImgFile() {
		return brandImgFile;
	}

	public void setBrandImgFile(MultipartFile brandImgFile) {
		this.brandImgFile = brandImgFile;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
	public void addProducts(Product product) {
		this.products.add(product);
		if(product.getBrand()!=this) {
			product.setBrand(this);
		}
	}
}
