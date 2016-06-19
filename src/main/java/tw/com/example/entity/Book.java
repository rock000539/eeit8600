package tw.com.example.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "BOOK")
public class Book {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "BOOKID")
	private Long bookId;

	@Column(name = "NAME", length = 50)
	private String name;

	@ManyToMany
	@JoinTable(name = "book_publisher", joinColumns = @JoinColumn(name = "BOOKID", referencedColumnName = "BOOKID"), inverseJoinColumns = @JoinColumn(name = "PUBID", referencedColumnName = "PUBID"))
	private Set<Publisher> publishers;

	public Book() {

	}

	public Book(String name) {
		this.name = name;
	}

	public Book(String name, Set<Publisher> publishers) {
		this.name = name;
		this.publishers = publishers;
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

	public Set<Publisher> getPublishers() {
		return publishers;
	}

	public void setPublishers(Set<Publisher> publishers) {
		this.publishers = publishers;
	}

	@Override
	public String toString() {
		String result = String.format("Book [id=%d, name='%s']%n", bookId, name);
		if (publishers != null) {
			for (Publisher publisher : publishers) {
				result += String.format("Publisher[id=%d, name='%s']%n", publisher.getPubId(), publisher.getName());
			}
		}

		return result;
	}

}
