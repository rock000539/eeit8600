package tw.com.softleader.eeit8600.product.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CATEGORY")
public class ProductCategory {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="CATEGORYID")
	private Long categoryId;
	
	@Column(name="CATEGORYKIND",length=20)
	private String categoryKind;
	
	@Column(name="CATEGORYLEVEL")
	private Double categoryLevel;
	
	public ProductCategory(String categoryKind,Double categoryLevel){
		this.categoryKind=categoryKind;
		this.categoryLevel=categoryLevel;
	}
	
	
	public Long getId() {
		return categoryId;
	}
	public void setId(Long id) {
		this.categoryId = id;
	}
	public String getKind() {
		return categoryKind;
	}
	public void setKind(String kind) {
		this.categoryKind = kind;
	}
	public Double getLevel() {
		return categoryLevel;
	}
	public void setLevel(Double level) {
		this.categoryLevel = level;
	}

	@Override
	public String toString() {
		return "Category [id=" + categoryId + ", kind=" + categoryKind + ", level=" + categoryLevel
				+ "]";
	}

}
