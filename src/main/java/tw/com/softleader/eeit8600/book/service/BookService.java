package tw.com.softleader.eeit8600.book.service;

import java.util.List;

import tw.com.softleader.eeit8600.book.dao.BookDao;
import tw.com.softleader.eeit8600.book.entity.Book;

public class BookService {
	
	private BookDao bookDao;
	
	public BookService() {
		bookDao = new BookDao();
	}
	
	public Book getById(Long id) {
		return bookDao.findById(id);		
	}
	
	public List<Book> getAll() {
		return bookDao.findAll();
	}
	
	public void insert(Book book) {
		bookDao.insert(book);
	}
	
	public void update(Book book) {
		bookDao.update(book);
	}
	
	public void delete(Long id) {
		bookDao.delete(id);
	}
}
