package tw.com.softleader.eeit8600.app.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import tw.com.softleader.eeit8600.app.entity.AppBean;

public class AppServiceTest {

	@Test
	public void testGetById() {
		AppService as = new AppService();
		AppBean ab = as.getById(1);
		assertEquals(1, ab.getId());
	}
	
	@Test
	public void testGetByAll() {
		AppService as = new AppService();
		List<AppBean> list = as.getAll();
		assertEquals(2, list.size());
	}

}
