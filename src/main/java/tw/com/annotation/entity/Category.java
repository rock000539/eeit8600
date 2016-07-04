package tw.com.annotation.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "CATEGORY")
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CATEGORYID")
	private Integer categoryId;

	@Column(name = "NAME")
	private String name;

	@OneToMany(mappedBy = "category", fetch = FetchType.EAGER)
	@JsonIgnore
	private Set<Book> books;

	public Category() {

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

	public void addBook(Book book) {
		this.books.add(book);
		if (book.getCategory() != this) {
			book.setCategory(this);
		}
	}

	@Override
	public String toString() {
		String result = String.format("Category[id=%d, name='%s']", categoryId, name);
		if (books != null) {
			for (Book book : books) {
				result += String.format(" Book[id=%d, name='%s']", book.getBookId(), book.getName());
			}
		} else {
			result += " Books is null";
		}

		return result;
	}

}
