package tw.com.softleader.eeit8600.music.entity;

public class MusicEntity {

//	private int muid;
//	private String muauthor;
//	private String mutitle;
//	private Integer muprice;

	private int id;
	private String musicNo;
	private String title;
	private String author;
	private Integer price;	
	
	@Override
	public String toString() {
		return "MusicEntity [id=" + id + ", music_no=" + musicNo + ", title="
				+ title + ", author=" + author + ", price=" + price + "]";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getMusicNo() {
		return musicNo;
	}

	public void setMusicNo(String musicNo) {
		this.musicNo = musicNo;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
