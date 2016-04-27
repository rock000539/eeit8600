package tw.com.softleader.eeit8600.movie.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import tw.com.softleader.eeit8600.book.dao.BookDao;
import tw.com.softleader.eeit8600.book.entity.Book;
import tw.com.softleader.eeit8600.movie.dao.MovieDao;
import tw.com.softleader.eeit8600.movie.entity.Movie;

@Service
public class MovieService {
	
	private MovieDao movieDao;
	
	public MovieService() {
		movieDao = new MovieDao();
	}
	
	public Movie getById(int id) {
		return movieDao.findById(id);		
	}
	
	public List<Movie> getAll() {
		return movieDao.findAll();
	}
	
	public void insert(Movie movie) {
		movieDao.insert(movie);
	}
	
	public void update(Movie movie) {
		movieDao.update(movie);
	}
	
	public void delete(int id) {
		movieDao.delete(id);
	}
	
}