package tw.com.softleader.eeit8600.drama.service;

import static org.junit.Assert.assertEquals;
import java.util.List;
import org.junit.Test;
import tw.com.softleader.eeit8600.drama.entity.Drama;

public class DramaServiceTest {

	@Test
	public void testGetById() {
		DramaService dramaservice = new DramaService();
		Drama drama = dramaservice.getById(1L);
		assertEquals("Rick Grimes",drama.getActor());
		assertEquals(20,drama.getEpisodes().intValue());
		
	}

	@Test
	public void testGetAll() {
		DramaService dramaservice = new DramaService();
		List<Drama> dramas = dramaservice.getAll();
		
		assertEquals(2, dramas.size());
	}

}
