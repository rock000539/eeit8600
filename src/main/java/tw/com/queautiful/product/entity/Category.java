package tw.com.queautiful.product.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="CATEGORY")
public class Category {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="CATEGORYID")
	private Long categoryId;
	
	@Column(name="CATEGORYNAME",length=50)
	private String categoryName;
	
	@Column(name="CATEGORYIMG",length=200)
	private String categoryImg;
	
	@ManyToOne
	@JoinColumn(name="TITLEID")
	@JsonBackReference
	private CategoryTitle title;

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

	public CategoryTitle getTitle() {
		return title;
	}

	public void setTitle(CategoryTitle title) {
		this.title = title;
		if(!title.getCategories().contains(this)) {
			title.getCategories().add(this);
		}
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryName=" + categoryName + ", categoryImg=" + categoryImg
				+ ", title=" + title + "]";
	}
	
}
