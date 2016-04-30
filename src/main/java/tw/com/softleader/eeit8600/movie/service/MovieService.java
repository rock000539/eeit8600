package tw.com.softleader.eeit8600.movie.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.eeit8600.book.dao.BookDao;
import tw.com.softleader.eeit8600.book.entity.Book;
import tw.com.softleader.eeit8600.movie.dao.MovieDaoImp;
import tw.com.softleader.eeit8600.movie.entity.Movie;

@Service
public class MovieService {
	
	@Autowired
	private MovieDaoImp movieDao;
		
	public Movie getById(Long id) {
		return movieDao.getOne(id);		
	}
	
	public List<Movie> getAll() {
		return movieDao.findAll();
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
	
}