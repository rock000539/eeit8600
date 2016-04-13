package tw.com.softleader.eeit8600.drama.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Test;

import tw.com.softleader.eeit8600.book.entity.Book;
import tw.com.softleader.eeit8600.book.service.BookService;
import tw.com.softleader.eeit8600.drama.entity.Drama;

public class DramaServiceTest {

	@Test
	public void testGetById() {
		DramaService dramaservice = new DramaService();
		Drama drama = dramaservice.getById();
		assertEquals("Rick Grimes",drama.getActor());
		assertEquals(20,drama.getEpisode());
		
	}

	@Test
	public void testGetAll() {
		DramaService dramaservice = new DramaService();
		List<Drama> dramas = dramaservice.getAll();
		
		assertEquals(2, dramas.size());
	}

}
