package tw.com.softleader.eeit8600.movie.dao;

import static org.junit.Assert.*;

import java.awt.print.Book;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import tw.com.softleader.eeit8600.movie.entity.Movie;

public class MovieDaoTest {

	@Test
	public void test() {
		MovieDao movieDao = new MovieDao();
		//findall
		List<Movie> movies = movieDao.findAll();
		int originalSize = movies.size();
		System.out.println(originalSize);
		
		//insert
		Movie movie1 = new Movie();
		movie1.setId(1);
		movie1.setName("Batman Begin");
		movie1.setActor("Christian Bale");
		movie1.setTypes("Action");
		//movieDao.insert(movie1);
		
		//movies = movieDao.findAll();
		//assertEquals(originalSize+1, movies.size());
		
		// test findById
		Movie movieDb = movieDao.findById(1);
		assertEquals(movieDb.getId(), movie1.getId());
		assertEquals(movieDb.getName(), movie1.getName());
		assertEquals(movieDb.getActor(), movie1.getActor());
		assertEquals(movieDb.getTypes(), movie1.getTypes());
		System.out.println(movieDb);
		
		
		// test update
		movieDb.setTypes("Adventure");
		movieDao.update(movieDb);
		System.out.println(movieDao.findById(1));
		
		
		// test delete
//		movieDao.delete(1);
//		movies = movieDao.findAll();
//		assertEquals(originalSize, movies.size());
		
		
	}

}
