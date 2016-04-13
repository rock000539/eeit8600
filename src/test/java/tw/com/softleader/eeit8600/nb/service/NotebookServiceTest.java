package tw.com.softleader.eeit8600.nb.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import tw.com.softleader.eeit8600.nb.entity.NotebookBean;

public class NotebookServiceTest {

	@Test
	public void testGetById() {
		NotebookService NotebookService= new NotebookService();
		NotebookBean nb = NotebookService.getById(1234567);
		
		assertEquals(25000,nb.getNbprice().intValue());
	}

	@Test
	public void testGetAll() {
		NotebookService  NotebookService=new NotebookService();
		List<NotebookBean> nbs = NotebookService.getAll();
		
		assertEquals(2,nbs.size());
	}

}
