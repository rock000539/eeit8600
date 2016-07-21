package tw.com.queautiful.product.vo.product;

public class ProductSearch {
	
	private Long prodId;

	private String prodName;

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

	@Override
	public String toString() {
		return "ProductSearch [prodId=" + prodId + ", prodName=" + prodName + "]";
	}
	
}
