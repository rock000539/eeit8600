package tw.com.queautiful.product.vo.product;

import java.sql.Date;

public class ProductInventory {
	
	private Long prodId;

	private String prodName;

	private String brandName;

	private Date launchDate;

	private String prodDesc;

	private String prodImg;
	
	private Integer rSize;

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

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
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

	public String getProdImg() {
		return prodImg;
	}

	public void setProdImg(String prodImg) {
		this.prodImg = prodImg;
	}

	public Integer getrSize() {
		return rSize;
	}

	public void setrSize(Integer rSize) {
		this.rSize = rSize;
	}
	
}
