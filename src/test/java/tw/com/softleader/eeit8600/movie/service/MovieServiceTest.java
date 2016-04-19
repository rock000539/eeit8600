package tw.com.softleader.eeit8600.movie.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import tw.com.softleader.eeit8600.movie.entity.Movie;

public class MovieServiceTest {

	@Test
	public void testGetById() {
		MovieService test = new MovieService();
		Movie movie = test.getById(1);
		assertEquals("BatMan", movie.getName());
		assertEquals("Action", movie.getTypes());
	}

	@Test
	public void testGetAll() {
		MovieService test = new MovieService();
		List<Movie> movies = test.getAll();
		assertEquals(3, movies.size());
	}

}
