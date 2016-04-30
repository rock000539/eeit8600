package tw.com.softleader.eeit8600.movie.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="MOVIE")
public class Movie {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private Long id;
	
	@Column(name="NAME")
	private String name;
	
	@Column(name="ACTOR")
	private String actor;
	
	@Column(name="GENRE")
	private String genre;
	
	@Override
	public String toString() {
		return "Movie [id=" + id + ", name=" + name + ", actor=" + actor + ", genre=" + genre + "]";
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
	
	public static Movie getMovie(Long id, String name, String actor, String genre){
		Movie movie = new Movie();
		movie.id = id;
		movie.name = name;
		movie.actor = actor;
		movie.genre = genre;
		return movie;
	}


}
