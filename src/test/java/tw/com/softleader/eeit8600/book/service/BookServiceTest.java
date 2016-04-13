package tw.com.softleader.eeit8600.book.service;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;

import tw.com.softleader.eeit8600.book.entity.Book;

public class BookServiceTest {

	@Test
	public void testGetById() {
		BookService bookService = new BookService();
		
		Book book = bookService.getById(1L);
		
		assertEquals("111-000-0001", book.getIsbnNo());
		assertEquals(100, book.getPrice().intValue());
	}

	@Test
	public void testGetAll() {
		BookService bookService = new BookService();
		List<Book> books = bookService.getAll();
		
		assertEquals(2, books.size());
		
	}

}
