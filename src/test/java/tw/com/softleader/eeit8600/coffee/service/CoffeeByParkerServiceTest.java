package tw.com.softleader.eeit8600.coffee.service;

import static org.junit.Assert.*;

import org.junit.Test;

import tw.com.softleader.eeit8600.book.entity.Book;
import tw.com.softleader.eeit8600.book.service.BookService;
import tw.com.softleader.eeit8600.coffee.entity.CoffeeByParker;

public class CoffeeByParkerServiceTest {

	@Test
	public void testGetAll() {
		
	}

	@Test
	public void testGetByid() {
		CoffeeByParkerService cs = new CoffeeByParkerService();
		CoffeeByParker cp = cs.getByid();
		assertEquals("not bad", cp.getTesting());
		assertEquals(200, cp.getPrice());
	}

	@Test
	public void testMain() {
		
	}

}
