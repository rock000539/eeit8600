package tw.com.annotation.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "PUBLISHER")
public class Publisher {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PUBID")
	private Long pubId;

	@Column(name = "NAME", length = 50)
	private String name;
	
	@ManyToMany(mappedBy = "publishers")
	private List<Book> books;
	
	public Publisher(){

    }

    public Publisher(String name){
        this.name = name;
    }
    
    public Publisher(String name, List<Book> books){
        this.name = name;
        this.books = books;
    }

	public Long getPubId() {
		return pubId;
	}

	public void setPubId(Long pubId) {
		this.pubId = pubId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
		if(!this.getBooks().contains(books)) {
			this.getBooks().addAll(books);
		}
	}
	
}
