package tw.com.softleader.eeit8600.movie.dao;

import static org.junit.Assert.assertEquals;

import java.util.Collection;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.eeit8600.App;
import tw.com.softleader.eeit8600.movie.entity.Movie;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(App.class)
public class MovieDaoTest {
	
	@Autowired
	MovieDao movieDao;
	Collection<Movie> movies;
	
	
	@Before
	public void initData(){
		Movie movie1 = new Movie("Batman Begins", "Christian Bale", "Action", 8.3);
		Movie movie2 = new Movie("The Dark Knight", "Christian Bale", "Action", 9.0);
		Movie movie3 = new Movie("The Dark Knight Rises", "Christian Bale", "Action", 8.5);
		Movie movie4 = new Movie("Gone Girl", "Gillian Flynn", "Mystery", 8.1);
		Movie movie5 = new Movie("The Wolf of Wall", "Leonardo DiCaprio", "Biography", 8.2);
		Movie movie6 = new Movie("Rush", "Daniel Brühl", "Biography", 8.2);
		movieDao.save(movie1);
		movieDao.save(movie2);
		movieDao.save(movie3);
		movieDao.save(movie4);
		movieDao.save(movie5);
		movieDao.save(movie6);
	}
	
	@org.junit.After
	public void dropData(){
		movies = movieDao.findAll();
		movieDao.delete(movies);
	}
	
	@Test
	public void testFindByNameIgnoreCase() {
		movies = movieDao.findByNameIgnoreCase("Gone Girl");
		assertEquals(1, movies.size());
	}
	
	@Test
	public void testFindByNameIgnoreCaseStartingWith(){
		movies = movieDao.findByNameIgnoreCaseStartingWith("the dark");
		assertEquals(2, movies.size());
	}
	@Test
	public void testFindByNameIgnoreCaseEndingWith(){
		movies = movieDao.findByNameIgnoreCaseEndingWith("Wall");
		assertEquals(1, movies.size());
	}
	
	@Test
	public void testFindByActorIgnoreCase() {
		movies = movieDao.findByActorIgnoreCase("christian Bale");
		assertEquals(3, movies.size());
	}
	
	@Test
	public void testFindByActorIgnoreCaseStartingWith(){
		movies = movieDao.findByActorIgnoreCaseStartingWith("christian");
		assertEquals(3, movies.size());
	}
	@Test
	public void testFindByActorIgnoreCaseEndingWith(){
		movies = movieDao.findByActorIgnoreCaseEndingWith("bale");
		assertEquals(3, movies.size());
	}
	
	@Test
	public void testFindByGenreIgnoreCase() {
		movies = movieDao.findByGenreIgnoreCase("biography");
		assertEquals(2, movies.size());
	}
	
	@Test
	public void testFindByNameContaining() {
		movies = movieDao.findByNameContaining("Dark");
		assertEquals(2, movies.size());
	}
	
	@Test
	public void testFindByActorAndGenre(){
		movies = movieDao.findByActorAndGenre("Christian Bale", "Action");
		assertEquals(3, movies.size());
	}
	
	@Test
	public void testFindByActorOrGenre(){
		movies = movieDao.findByActorOrGenre("Christian Bale", "Mystery");
		assertEquals(4, movies.size());
	}
	
	@Test
	public void testFindByGenreNot(){
		movies = movieDao.findByGenreNot("Action");
		assertEquals(3, movies.size());
	}
	
	@Test
	public void testFindByActorOrderByRatingDesc(){
		List<Movie> movies = movieDao.findByActorOrderByRatingDesc("Christian Bale");
		assertEquals((Double)9.0, movies.get(0).getRating());
	}
	
	@Test
	public void testFindByGenreOrderByRatingDesc(){
		List<Movie> movies = movieDao.findByGenreOrderByRatingDesc("Action");
		assertEquals((Double)9.0, movies.get(0).getRating());
	}

	@Test
	public void testFindByRatingBetween(){
		movies = movieDao.findByRatingBetween(8.3, 9.0);
		assertEquals(3, movies.size());
	}
	@Test
	public void testFindByRatingGreaterThanEqual(){
		movies = movieDao.findByRatingGreaterThanEqual(8.5);
		assertEquals(2, movies.size());
	}
	@Test
	public void testFindByRatingLessThanEqual(){
		movies = movieDao.findByRatingLessThanEqual(8.2);
		assertEquals(3, movies.size());
	}

	@Test
	public void testFindAllByOrderByRatingDesc(){
		List<Movie> movies = movieDao.findAllByOrderByRatingDesc();
		assertEquals((Double)9.0, movies.get(0).getRating());
	}
	
	@Test
	public void testFindTop3ByOrderByRatingDesc(){
		movies = movieDao.findTop3ByOrderByRatingDesc();
		assertEquals((Double)9.0, ((List<Movie>) movies).get(0).getRating());
	}
	
	

}
