package tw.com.softleader.eeit8600.movie.service;


import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tw.com.softleader.eeit8600.movie.dao.MovieDao;
import tw.com.softleader.eeit8600.movie.entity.Movie;

@Service
public class MovieService {
	@Autowired
	private MovieDao movieDao;
		
	public Movie getById(Long id) {
		return movieDao.findOne(id);		
	}
	
	public List<Movie> getAll() {
		return movieDao.findAll();
	}
	
	public Long count(){
		return movieDao.count();
	}
	
	public void insert(Movie movie) {
		movieDao.save(movie);
	}
	
	public void update(Movie movie) {
		movieDao.save(movie);
	}
	
	public void delete(Long id) {
		movieDao.delete(id);
	}
	
	public Collection<Movie> findByName(String data){
		Set<Movie> movies = movieDao.findByNameIgnoreCase(data.trim());
		movies.addAll(movieDao.findByNameIgnoreCaseStartingWith(data.trim()));
		movies.addAll(movieDao.findByNameIgnoreCaseEndingWith(data.trim()));
		return movies;
	}
	
	public Collection<Movie> findByActor(String data){
		Set<Movie> movies = movieDao.findByActorIgnoreCase(data.trim());
		movies.addAll(movieDao.findByActorIgnoreCaseStartingWith(data.trim()));
		movies.addAll(movieDao.findByActorIgnoreCaseEndingWith(data.trim()));
		return movies;
	}
	
	public List<Movie> findByGenre(String data){
		return movieDao.findByGenreIgnoreCase(data);
	}
	
	
	
	public void addSomeData(){
		Movie movie1 = new Movie("Batman Begins", "Christian Bale", "Action", 8.3);
		Movie movie2 = new Movie("The Dark Knight", "Christian Bale", "Action", 9.0);
		Movie movie3 = new Movie("The Dark Knight Rises", "Christian Bale", "Action", 8.5);
		Movie movie4 = new Movie("Gone Girl", "Gillian Flynn", "Mystery", 8.1);
		Movie movie5 = new Movie("The Wolf of Wall", "Leonardo DiCaprio", "Biography", 8.2);
		Movie movie6 = new Movie("Rush", "Daniel Brühl", "Biography", 8.2);
		Movie movie7 = new Movie("Divergent", "Ansel Elgort", "Adventure", 6.7);
		Movie movie8 = new Movie("Inception", "Leonardo DiCaprio", "Sci-Fi", 8.8);
		Movie movie9 = new Movie("The Shawshank Redemption", "Tim Robbins", "Crime", 8.9);
		Movie movie10 = new Movie("Minions", "Sandra Bullock", "Animation", 6.5);
		movieDao.save(movie1);
		movieDao.save(movie2);
		movieDao.save(movie3);
		movieDao.save(movie4);
		movieDao.save(movie5);
		movieDao.save(movie6);
		movieDao.save(movie7);
		movieDao.save(movie8);
		movieDao.save(movie9);
		movieDao.save(movie10);
	}
}