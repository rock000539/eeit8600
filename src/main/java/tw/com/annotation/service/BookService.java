package tw.com.annotation.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.annotation.dao.BookDao;
import tw.com.annotation.entity.Book;

@Service
public class BookService {
	
	@Autowired
	private BookDao dao;
	
	public Book getById(Long bookId) {
		return dao.findOne(bookId);
	}
	
	public List<Book> getAll() {
		return dao.findAll();
	}
	
}
