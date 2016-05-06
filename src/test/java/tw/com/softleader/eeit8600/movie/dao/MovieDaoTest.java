package tw.com.softleader.eeit8600.movie.dao;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
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
	List<Movie> movies;

	
	public void setup(){
		Movie movie1 = new Movie("Batman Begins", "Christian Bale", "Action");
		Movie movie2 = new Movie("The Dark Knight", "Christian Bale", "Action");
		Movie movie3 = new Movie("The Dark Knight Rises", "Christian Bale", "Action");
		Movie movie4 = new Movie("Gone Girl", "Gillian Flynn", "Mystery");
		Movie movie5 = new Movie("The Wolf of Wall", "Leonardo DiCaprio", "Biography");
		Movie movie6 = new Movie("Rush", "Daniel Brühl", "Biography");
		movieDao.save(movie1);
		movieDao.save(movie2);
		movieDao.save(movie3);
		movieDao.save(movie4);
		movieDao.save(movie5);
		movieDao.save(movie6);
	}
	
	@Test
	public void testFindByActorIgnoreCase() {
		movies = movieDao.findByActorIgnoreCase("Christian Bale");
		assertEquals(3, movies.size());
//		movies = movieDao.findByActorIgnoreCase("Gillian Flynn");
//		assertEquals(1, movies.size());
	}

	@Test
	public void testFindByGenreIgnoreCase() {
		movies = movieDao.findByGenreIgnoreCase("Biography");
		assertEquals(2, movies.size());
		
	}

}
