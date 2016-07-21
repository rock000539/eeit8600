package tw.com.queautiful.product.vo.category;

import tw.com.queautiful.commons.enumeration.CategoryTitle;

public class CategorySearch {
	
	private Long categoryId;

	private String categoryName;

	private String categoryImg;
	
	private CategoryTitle categoryTitle;

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

	@Override
	public String toString() {
		return "CategorySearch [categoryId=" + categoryId + ", categoryName=" + categoryName + ", categoryImg="
				+ categoryImg + ", categoryTitle=" + categoryTitle + "]";
	}

}
