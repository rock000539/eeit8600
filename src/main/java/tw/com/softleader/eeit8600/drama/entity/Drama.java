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

	@Column(name = "CHANNEL")
	private Integer channel;

	public Drama() {
	}

	public Drama(String name, Integer episodes, String actor, Integer channel) {
		this.name = name;
		this.episodes = episodes;
		this.actor = actor;
		this.channel = channel;
	}

	@Override
	public String toString() {
		return "Drama [id=" + id + ", name=" + name + ", episodes=" + episodes + ", actor=" + actor + ", channel="
				+ channel + "]";
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

	public Integer getChannel() {
		return channel;
	}

	public void setChannel(Integer channel) {
		this.channel = channel;
	}

}
