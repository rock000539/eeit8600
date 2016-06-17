package tw.com.queautiful.product.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

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

	@Transient
	private MultipartFile categoryImgFile;
	
	public MultipartFile category() {
		return categoryImgFile;
	}

	public void setBrandImgFile(MultipartFile categoryImgFile) {
		this.categoryImgFile = categoryImgFile;
	}

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

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryName="
				+ categoryName + ", categoryImg=" + categoryImg + "]";
	}
	


}
