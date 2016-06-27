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

@Entity
@Table(name = "CATEGORYTITLE")
public class CategoryTitle {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "TITLEID")
	private Long titleId;
	
	@Column(name="TITLENAME")
	private String titleName;

	@OneToMany(mappedBy = "title", fetch = FetchType.EAGER)
	private List<Category> categories;

	public Long getTitleId() {
		return titleId;
	}

	public void setTitleId(Long titleId) {
		this.titleId = titleId;
	}

	public String getTitleName() {
		return titleName;
	}

	public void setTitleName(String titleName) {
		this.titleName = titleName;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}
	
	public void addCategory(Category category) {
		this.categories.add(category);
		if(category.getTitle() != this) {
			category.setTitle(this);
		}
	}
	
	@Override
	public String toString() {
		
		String result = String.format("CategoryTitle[id=%d, name='%s']", titleId, titleName);
		if (categories != null) {
			for (Category category : categories) {
				result += String.format(" Category[id=%d, name='%s']", category.getCategoryId(), category.getCategoryName());
			}
		} else {
			result += " Category is null";
		}

		return result;
	}
}
