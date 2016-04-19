package tw.com.softleader.eeit8600.app.service;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;

import tw.com.softleader.eeit8600.app.entity.App;

public class AppServiceTest {

	@Test
	public void testGetById() {
		AppService as = new AppService();
		App ab = as.getById(1);
		assertEquals(1, ab.getId().intValue());
	}
	
	@Test
	public void testGetByAll() {
		AppService as = new AppService();
		List<App> list = as.getAll();
		assertEquals(2, list.size());
	}

}
