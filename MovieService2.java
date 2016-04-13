package com.eeit8626;

import java.util.ArrayList;
import java.util.List;

public class MovieService {

	
	public static void main(String[] args) {
		MovieService ms = new MovieService();
		System.out.println(ms.getById());
		System.out.println("---------------------------------------------------------------------------------");
		List<Movie> mss=ms.getAll();
		for(Movie m:mss){
			System.out.println(m);
		}

	}
	
	public Movie getById(){
		Movie movie = new Movie();
		movie.setId(1);
		movie.setName("Harry Potter");
		movie.setPrice(350);
		movie.setRoom("room A");
		movie.setActor("Emma");
		
		return movie;
		
	}
	
	public List<Movie> getAll(){
		List<Movie> movies = new ArrayList<Movie>();
		Movie m1 = new Movie();
		m1.setId(1);
		m1.setName("Harry Potter");
		m1.setPrice(350);
		m1.setRoom("room A");
		m1.setActor("Emma");
		movies.add(m1);
		
		Movie m2 = new Movie();
		m2.setId(2);
		m2.setName("Avengers");
		m2.setPrice(250);
		m2.setRoom("room B");
		m2.setActor("Chris");
		movies.add(m2);
		
		return movies;
		
		
	}

}
