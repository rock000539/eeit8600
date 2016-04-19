package tw.com.softleader.eeit8600.movie.entity;

import java.sql.Date;

public class Movie {
	
	private int id;

	private String name;
	
	private String actor;
	
	private String types;
	
	
	
	@Override
	public String toString() {
		return "Movie [id=" + id + ", name=" + name + ", actor=" + actor + ", types=" + types + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
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

	public String getTypes() {
		return types;
	}

	public void setTypes(String types) {
		this.types = types;
	}
	
	


}
