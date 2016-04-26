package tw.com.softleader.eeit8600.coffee.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;

import tw.com.softleader.eeit8600.coffee.entity.Coffee;

public class CoffeeDAOTest {

	@Test
	public void testCrud() {
		CoffeeDAO dao=new CoffeeDAO();
		Coffee bean=new Coffee(); 
		List<Coffee> coffees = dao.select();
		int originalSize = coffees.size();
		
		//test find all
		coffees=dao.select();
		//test insert
		bean.setId(1);
		bean.setName("first");
		bean.setLocal("JP");
		bean.setPrice(200);
		bean.setTesting("not bad");		
		dao.insert(bean);	
		assertEquals(originalSize+1, coffees.size());
		
		// test findById	
		Coffee dbbean=dao.select(1L);
		assertEquals(bean.getId(), dbbean.getId());
		assertEquals(bean.getName(), dbbean.getName());
		assertEquals(bean.getLocal(), dbbean.getLocal());
		assertEquals(bean.getTesting(), dbbean.getTesting());
		assertEquals(bean.getPrice(), dbbean.getPrice());
		// test update
		dbbean.setPrice(500);
		dao.update(dbbean);
		
		Coffee updatedCoffee = dao.select(1L);
		assertEquals(dbbean.getPrice(), updatedCoffee.getPrice());
		
		// test delete
		dao.delete(1);
		coffees = dao.select();
				
		assertEquals(originalSize, coffees.size());
		
	}
	
}
