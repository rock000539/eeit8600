package tw.com.softleader.eeit8600.movie.service;


import java.util.ArrayList;
import java.util.List;

import tw.com.softleader.eeit8600.movie.entity.Movie;

public class MovieService {

	public static void main(String[] args) {
		Movie movie = new MovieService().getById(1);
		System.out.println(movie);
		
		List<Movie> movies = new MovieService().getAll();
		for(Movie m: movies) {
			System.out.println(m);
		}
	}

	public Movie getById(int id) {
		
		
		Movie movie1 = new Movie();
		movie1.setId(1);
		movie1.setName("Bat Man");
		movie1.setActor("Ben");
		movie1.setTypes("Actor");
		
		return movie1;
	}


	public List<Movie> getAll() {
		
		List<Movie> movies = new ArrayList<Movie>();
		
		Movie movie1 = new Movie();
		movie1.setId(1);
		movie1.setName("Bat Man");
		movie1.setActor("Ben");
		movie1.setTypes("Actor");

		movies.add(movie1);
		
		Movie movie2 = new Movie();
		movie2.setId(2);
		movie2.setName("Harry Porter");
		movie2.setActor("Harry");
		movie2.setTypes("fiction");
		
		movies.add(movie2);
		
		return movies;
	}
	
}