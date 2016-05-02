package tw.com.softleader.eeit8600.notebook.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import tw.com.softleader.eeit8600.notebook.entity.Notebook;
import tw.com.softleader.eeit8600.notebook.service.NotebookService;

public class NotebookServiceTest {

	@Test
	public void testGetById() {
		NotebookService NotebookService= new NotebookService();
		Notebook nb = NotebookService.getById(1234567L);
		
		assertEquals(25000,nb.getPrice().intValue());
	}

	@Test
	public void testGetAll() {
		NotebookService  NotebookService=new NotebookService();
		List<Notebook> nbs = NotebookService.getAll();
		
		assertEquals(2,nbs.size());
	}

}
