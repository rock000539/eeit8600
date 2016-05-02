package tw.com.softleader.eeit8600.movie.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.eeit8600.movie.entity.Movie;

public interface MovieDao extends JpaRepository<Movie, Long> {
	
	public List<Movie> findByActorIgnoreCase(String actor);
	
	public List<Movie> findByGenreIgnoreCase(String genre);
	

	
}