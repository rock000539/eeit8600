package tw.com.softleader.eeit8600.drama.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "DRAMA")
public class Drama {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;

	@Column(name = "NAME", length = 50)
	private String name;

	@Column(name = "EPISODES")
	private Integer episodes;

	@Column(name = "ACTOR", length = 50)
	private String actor;

	@Column(name = "GENRE")
	private String genre;

	public Drama() {
	}

	public Drama(String name, Integer episodes, String actor, String genre) {
		this.name = name;
		this.episodes = episodes;
		this.actor = actor;
		this.genre = genre;
	}

	@Override
	public String toString() {
		return "Drama [id=" + id + ", name=" + name + ", episodes=" + episodes + ", actor=" + actor + ", genre="
				+ genre + "]";
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

	public Integer getEpisodes() {
		return episodes;
	}

	public void setEpisodes(Integer episodes) {
		this.episodes = episodes;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

}
