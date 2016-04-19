package tw.com.softleader.eeit8600.coffee.service;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import tw.com.softleader.eeit8600.coffee.entity.Coffee;

public class CoffeeByParkerServiceTest {

	@Test
	public void testGetAll() {
		
	}

	@Test
	public void testGetByid() {
		CoffeeByParkerService cs = new CoffeeByParkerService();
		Coffee cp = cs.getByid();
		assertEquals("not bad", cp.getTesting());
		assertEquals(200, cp.getPrice());
	}

	@Test
	public void testMain() {
		
	}

}
