package tw.com.example.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "BOOKCATEGORY")
public class Category {

	@Column(name = "CATEGORYID")
	private Integer categoryId;

	@Column(name = "NAME")
	private String name;

	@OneToMany(mappedBy = "category")
	private Set<Book> books;
	
	public Category(){

    }

    public Category(String name) {
        this.name = name;
    }

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Book> getBooks() {
		return books;
	}

	public void setBooks(Set<Book> books) {
		this.books = books;
	}

	@Override
	public String toString() {
		return "BOOKCATEGORY [categoryId=" + categoryId + ", name=" + name + ", books=" + books + "]";
	}

}
