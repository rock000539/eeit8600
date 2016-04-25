package tw.com.softleader.eeit8600.coffee.service;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import tw.com.softleader.eeit8600.coffee.entity.Coffee;

public class CoffeeServiceTest {

	@Test
	public void testGetAll() {
		
	}

	@Test
	public void testGetByid() {
		CoffeeService cs = new CoffeeService();
		Coffee cp = cs.getByid();
		assertEquals("not bad", cp.getTesting());
		assertEquals(200, cp.getPrice());
	}

	@Test
	public void testMain() {
		
	}

}
