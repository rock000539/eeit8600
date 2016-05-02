package tw.com.softleader.eeit8600.notebook.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.eeit8600.App;
import tw.com.softleader.eeit8600.notebook.entity.Notebook;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(App.class)
public class NotebookDaoTest {

	@Autowired
	private NotebookDao notebookDao;

	
	@Test
	public void testCrud() {
		//NotebookDao notebookDao = new NotebookDao();
		
		// find all data
		List<Notebook> notebooks = notebookDao.findAll();
		int originalSize = notebooks.size();
		
		// test insert
		Notebook nb1 = new Notebook();
		nb1.setId(1);
		nb1.setBrand("ASUS");
		nb1.setName("ZenBook");
		nb1.setCpu("Intel® Core™ M 5Y10 處理器");
		nb1.setPrice(40000);
		
		notebookDao.save(nb1);
		
		
		notebooks = notebookDao.findAll();
		assertEquals(originalSize+1, notebooks.size());
		
		// test findById
		Notebook dbNotebook = notebookDao.findOne(1L);
		assertEquals(nb1.getBrand(), dbNotebook.getBrand());
		assertEquals(nb1.getName(), dbNotebook.getName());
		assertEquals(nb1.getCpu(), dbNotebook.getCpu());
		assertEquals(nb1.getPrice(), dbNotebook.getPrice());
		
		// test update
		dbNotebook.setPrice(60000);
		notebookDao.save(dbNotebook);
		
		Notebook updatedBook = notebookDao.findOne(1L);
		assertEquals(dbNotebook.getPrice(), updatedBook.getPrice());
		
		// test delete
		notebookDao.delete(1L);
		
		notebooks = notebookDao.findAll();
		
		assertEquals(originalSize, notebooks.size());
		
	}

}
