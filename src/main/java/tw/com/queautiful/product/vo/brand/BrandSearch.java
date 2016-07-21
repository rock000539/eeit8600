package tw.com.queautiful.product.vo.brand;

public class BrandSearch {
	
	private Long brandId;

	private String brandName;

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

	@Override
	public String toString() {
		return "brandSearch [brandId=" + brandId + ", brandName=" + brandName + "]";
	}
	
}
