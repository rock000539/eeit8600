package tw.com.example.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "BOOKDETAIL")
public class Detail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "DETAILID")
	private Integer detailId;

	@Column(name = "NUMBEROFPAGES")
	private Integer numberOfPages;
	
	@OneToOne(mappedBy="bookDetail")
	private Book book;

	public Detail() {
		
	}

	public Detail(Integer numberOfPages) {
		this.numberOfPages = numberOfPages;
	}

	public Integer getDetailId() {
		return detailId;
	}

	public void setDetailId(Integer detailId) {
		this.detailId = detailId;
	}

	public Integer getNumberOfPages() {
		return numberOfPages;
	}

	public void setNumberOfPages(Integer numberOfPages) {
		this.numberOfPages = numberOfPages;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	@Override
	public String toString() {
		return "BookDetail [detailId=" + detailId + ", numberOfPages=" + numberOfPages + ", book=" + book + "]";
	}

}
