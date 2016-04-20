package tw.com.softleader.eeit8600.book.dao;

import java.util.List;

import org.junit.Test;
import static org.junit.Assert.assertEquals;

import tw.com.softleader.eeit8600.book.entity.Book;

public class BookDaoTest {
	
	@Test
	public void testInsert() {
		BookDao bookDao = new BookDao();
		
		// test insert
		Book book1 = new Book();
		book1.setIsbnNo("111-000-0001");
		book1.setName("Happy to learn Java");
		book1.setAuthor("Gary Lee");
		book1.setPrice(100);
		book1.setId(1L);
		
		bookDao.insert(book1);
	}
	
	@Test
	public void testCrud() {
		BookDao bookDao = new BookDao();
		
		// find all data
		List<Book> books = bookDao.findAll();
		int originalSize = books.size();
		
		// test insert
		Book book1 = new Book();
		book1.setIsbnNo("111-000-0001");
		book1.setName("Happy to learn Java");
		book1.setAuthor("Gary Lee");
		book1.setPrice(100);
		book1.setId(1L);
		
		bookDao.insert(book1);
		
		books = bookDao.findAll();
		assertEquals(originalSize+1, books.size());
		
		// test findById
		Book dbBook = bookDao.findById(1L);
		assertEquals(book1.getIsbnNo(), dbBook.getIsbnNo());
		assertEquals(book1.getName(), dbBook.getName());
		assertEquals(book1.getAuthor(), dbBook.getAuthor());
		assertEquals(book1.getPrice(), dbBook.getPrice());
		
		// test update
		dbBook.setPrice(200);
		bookDao.update(dbBook);
		
		Book updatedBook = bookDao.findById(1L);
		assertEquals(dbBook.getPrice(), updatedBook.getPrice());
		
		// test delete
		bookDao.delete(1L);
		books = bookDao.findAll();
		
		assertEquals(originalSize, books.size());
		
	}

}
