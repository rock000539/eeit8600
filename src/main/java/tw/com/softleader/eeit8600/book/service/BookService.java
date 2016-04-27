package tw.com.softleader.eeit8600.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.eeit8600.book.dao.BookDao;
import tw.com.softleader.eeit8600.book.entity.Book;

@Service
public class BookService {
	
	@Autowired
	private BookDao bookDao;
	
	
	public Book getById(Long id) {
		return bookDao.findOne(id);
	}
	
	public List<Book> getAll() {
		
		Book book1 = new Book();
		book1.setIsbnNo("111-000-0001");
		book1.setName("Happy to learn Java");
		book1.setAuthor("Gary Lee");
		book1.setPrice(100);
		
		bookDao.save(book1);
		
		return bookDao.findByPriceLessThan(100);
	}
	
	public void insert(Book book) {
		bookDao.save(book);
	}
	
	public void update(Book book) {
		bookDao.save(book);
	}
	
	public void delete(Long id) {
		bookDao.delete(id);
	}
}
