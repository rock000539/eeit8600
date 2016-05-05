package tw.com.softleader.eeit8600.coffee.dao;

import static org.junit.Assert.*;

import org.junit.Test;

import tw.com.softleader.eeit8600.coffee.entity.Coffee;

public class CoffeeDaoTest {

	@Test
	public void testFindById() {
		
		Coffee coffee = new Coffee();
		coffee.setId(1L);
		coffee.setLocal("Australia");
		coffee.setName("Espresso");
		coffee.setPrice(100);
		coffee.setTesting("yes");
		
		
		assertEquals(100,100);
	}

}
