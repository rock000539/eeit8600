package tw.com.softleader.eeit8600.drama.dao;

import java.util.List;

import org.junit.Test;
import static org.junit.Assert.assertEquals;

import tw.com.softleader.eeit8600.drama.entity.Drama;

public class DramaDaoTest {

	@Test
	public void testCrud() {
//		DramaDao dramaDao = new DramaDao();
//
//		//Find All
//		List<Drama> dramas = dramaDao.findAll();
//		int originalSize = dramas.size();
//		
//		//Test Insert
//		Drama drama1 = new Drama();
//		drama1.setId(1);
//		drama1.setName("The Walking Dead");
//		drama1.setEpisodes(20);
//		drama1.setActor("Rick Grimes");
//		drama1.setChannel(79);
//		dramaDao.insert(drama1);
//		dramas=dramaDao.findAll();
//		assertEquals(originalSize+1,dramas.size());
//		
//		//Test findById
//		Drama dbDrama = dramaDao.findById(1);
//		assertEquals(drama1.getName(),dbDrama.getName());
//		assertEquals(drama1.getEpisodes(),dbDrama.getEpisodes());
//		assertEquals(drama1.getActor(),dbDrama.getActor());
//		assertEquals(drama1.getChannel(),dbDrama.getChannel());
//
//		//Test Update
//		dbDrama.setEpisodes(25);
//		dramaDao.update(dbDrama);
//		Drama updatedDrama = dramaDao.findById(1);
//		assertEquals(dbDrama.getEpisodes(),updatedDrama.getEpisodes());
//	
//		//Test Delete
//		dramaDao.delete(1);
//		dramas=dramaDao.findAll();
//		assertEquals(originalSize,dramas.size());		
	}

}
