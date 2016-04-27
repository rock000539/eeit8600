package tw.com.softleader.eeit8600.book.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.eeit8600.App;
import tw.com.softleader.eeit8600.book.entity.Book;


@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(App.class)
public class BookDaoTest {
	
	@Autowired
	private BookDao bookDao;
	
		
	@Test
	public void testCrud() {
		
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
		
		bookDao.save(book1);
		
		books = bookDao.findAll();
		assertEquals(originalSize+1, books.size());
		
		// test findById
		Book dbBook = bookDao.findOne(1L);
		assertEquals(book1.getIsbnNo(), dbBook.getIsbnNo());
		assertEquals(book1.getName(), dbBook.getName());
		assertEquals(book1.getAuthor(), dbBook.getAuthor());
		assertEquals(book1.getPrice(), dbBook.getPrice());
		
		// test update
		dbBook.setPrice(200);
		bookDao.save(dbBook);
		
		Book updatedBook = bookDao.findOne(1L);
		assertEquals(dbBook.getPrice(), updatedBook.getPrice());
		
		// test delete
		bookDao.delete(1L);
		books = bookDao.findAll();
		
		assertEquals(originalSize, books.size());
		
	}

}
