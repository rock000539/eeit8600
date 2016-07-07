package tw.com.annotation.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Entity
@Table(name = "BOOK")
public class Book {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "BOOKID")
	private Long bookId;

	@Column(name = "NAME", length = 50)
	private String name;

	@OneToOne
	@JoinColumn(name = "DETAILID")
	private Detail detail;

	@ManyToOne
	@JoinColumn(name = "CATEGORYID")
	private BookCategory category;

	@Transient
	private Integer categoryId;

	@ManyToMany
	@JoinTable(name = "book_publisher", joinColumns = @JoinColumn(name = "BOOKID", referencedColumnName = "BOOKID"), inverseJoinColumns = @JoinColumn(name = "PUBID", referencedColumnName = "PUBID"))
	private List<Publisher> publishers;
	
	public Book() {

	}

	public Book(String name) {
		this.name = name;
	}

	public Book(String name, Detail detail) {
		this.name = name;
		this.detail = detail;
	}

	public Book(String name, BookCategory category) {
		this.name = name;
		this.category = category;
	}

	public Book(String name, List<Publisher> publishers) {
		this.name = name;
		this.publishers = publishers;
	}

	public Integer getCategoryId() {
		return this.category.getCategoryId();
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Long getBookId() {
		return bookId;
	}

	public void setBookId(Long bookId) {
		this.bookId = bookId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Detail getDetail() {
		return detail;
	}

	public void setDetail(Detail detail) {
		this.detail = detail;
		if (detail.getBook() != this) {
			detail.setBook(this);
		}
	}

	public BookCategory getCategory() {
		return category;
	}

	public void setCategory(BookCategory category) {
		this.category = category;
		if (!category.getBooks().contains(this)) {
			category.getBooks().add(this);
		}
	}

	public List<Publisher> getPublishers() {
		return publishers;
	}

	public void setPublishers(List<Publisher> publishers) {
		this.publishers = publishers;
		Logger log = LoggerFactory.getLogger(this.getClass());
		for(Publisher publisher : publishers) {
			if(!publisher.getBooks().contains(this)) {
				publisher.getBooks().add(this);
			}
			log.info("{}", publisher);
		}
	}

	@Override
	public String toString() {
		return "Book [bookId=" + bookId + "]";
	}
	
}
