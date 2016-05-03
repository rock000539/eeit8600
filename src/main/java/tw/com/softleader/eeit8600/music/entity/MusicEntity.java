package tw.com.softleader.eeit8600.music.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="MUSIC")
public class MusicEntity {

//	private Long id;
//	private String musicNo;
//	private String title;
//	private String author;
//	private Integer price;	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private Long id;
	
	@Column(name="MUSIC_NO", length=25)
	private String musicNo;
	
	@Column(name="TITLE", length=80)
	private String title;
	
	@Column(name="AUTHOR")
	private String author;
	
	@Column(name="PRICE")
	private Integer price;
	
	
	@Override
	public String toString() {
		return "MusicEntity [id=" + id + ", music_no=" + musicNo + ", title="
				+ title + ", author=" + author + ", price=" + price + "]";
	}
	
	public void Music(){	}
	
	public void Music(String musicNo, String title, String author){
		this.musicNo=musicNo;
		this.title=title;
		this.author=author;
	}
	
	public long getId() {
		return id;
	}
	public void setId(Long id) {
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
