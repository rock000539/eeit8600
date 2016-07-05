package tw.com.queautiful.product.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import tw.com.queautiful.commons.util.CategoryTitle;

@Entity
@Table(name = "CATEGORY")
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CATEGORYID")
	private Long categoryId;

	@Column(name = "CATEGORYNAME", length = 50)
	private String categoryName;

	@Column(name = "CATEGORYIMG", length = 200)
	private String categoryImg;
	
	@Column(name="CATEGORYTITLE", length = 20)
	@Enumerated(EnumType.STRING)
	private CategoryTitle categoryTitle;

	@OneToMany(mappedBy = "category", fetch = FetchType.EAGER)
	private List<Product> products;

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryImg() {
		return categoryImg;
	}

	public void setCategoryImg(String categoryImg) {
		this.categoryImg = categoryImg;
	}
	
	public CategoryTitle getCategoryTitle() {
		return categoryTitle;
	}

	public void setCategoryTitle(CategoryTitle categoryTitle) {
		this.categoryTitle = categoryTitle;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public void addProducts(Product product) {
		this.products.add(product);
		if (product.getCategory() != this) {
			product.setCategory(this);
		}
	}

}
