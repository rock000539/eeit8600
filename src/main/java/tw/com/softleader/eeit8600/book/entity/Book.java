package tw.com.softleader.eeit8600.book.entity;

public class Book extends Object {
	
	private Long id;
	
	private String isbnNo;
	
	private String name;
	
	private String author;
	
	private Integer price;
	
	@Override
	public String toString() {
		return "Book [id=" + id + ", isbnNo=" + isbnNo + ", name=" + name + ", author=" + author + ", price=" + price + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getIsbnNo() {
		return isbnNo;
	}

	public void setIsbnNo(String isbnNo) {
		this.isbnNo = isbnNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}
	
	
	
}
