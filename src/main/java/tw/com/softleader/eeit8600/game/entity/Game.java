package tw.com.softleader.eeit8600.game.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="GAME")
public class Game {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private Long id;
	
	@Column(name="NAME", length=30)
	private String name;
	
	@Column(name="EVALUATION")
	private Integer evaluation;
	
	@Column(name="DOWNLOAD")
	private Integer download;
	
	@Column(name="URL", length=50)
	private String url;
	
	public Game(){
		
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getEvaluation() {
		return evaluation;
	}

	public void setEvaluation(Integer evaluation) {
		this.evaluation = evaluation;
	}

	public Integer getDownload() {
		return download;
	}

	public void setDownload(Integer download) {
		this.download = download;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "GameBean [id=" + id + ", name=" + name + ", evaluation=" + evaluation + ", download=" + download
				+ ", url=" + url + "]";
	}
}
