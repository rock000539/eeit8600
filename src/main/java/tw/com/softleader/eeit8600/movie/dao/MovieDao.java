package tw.com.softleader.eeit8600.movie.dao;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.eeit8600.movie.entity.Movie;

public interface MovieDao extends JpaRepository<Movie, Long> {

	public Set<Movie> findByNameIgnoreCase(String name);
	public Set<Movie> findByNameIgnoreCaseStartingWith(String name);
	public Set<Movie> findByNameIgnoreCaseEndingWith(String name);
	
	public Set<Movie> findByActorIgnoreCase(String actor);
	public Set<Movie> findByActorIgnoreCaseStartingWith(String actor);
	public Set<Movie> findByActorIgnoreCaseEndingWith(String actor);
	
	public List<Movie> findByGenreIgnoreCase(String genre);
	
	public List<Movie> findByNameContaining(String name);
	
	public List<Movie> findByActorAndGenre(String actor, String genre);
	
	public List<Movie> findByActorOrGenre(String name, String genre); 
	
	public List<Movie> findByGenreNot(String genre);
	
	public List<Movie> findByActorOrderByRatingDesc(String actor);
	
	public List<Movie> findByGenreOrderByRatingDesc(String genre);
	
	public List<Movie> findByRatingBetween(double start, double end);
	
	public List<Movie> findByRatingGreaterThanEqual(double rating);
	
	public List<Movie> findByRatingLessThanEqual(Double rating);
	
	public List<Movie> findAllByOrderByRatingDesc();
	
	public List<Movie> findTop3ByOrderByRatingDesc();
	
	
	
}