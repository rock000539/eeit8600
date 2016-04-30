package tw.com.softleader.eeit8600.coffee.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.eeit8600.book.dao.BookDao;
import tw.com.softleader.eeit8600.coffee.entity.Coffee;

public class CoffeeDAOTest {

	@Autowired
	private CoffeeDao coffeeDao;
	
	@Test
	public void testCrud() {
		Coffee bean=new Coffee(); 
		List<Coffee> coffees = coffeeDao.findAll();
		int originalSize = coffees.size();
		
		//test find all
		coffees=coffeeDao.findAll();
		//test insert
		bean.setId(1);
		bean.setName("first");
		bean.setLocal("JP");
		bean.setPrice(200);
		bean.setTesting("not bad");		
		coffeeDao.save(bean);	
		assertEquals(originalSize+1, coffees.size());
		
		// test findById	
		Coffee dbbean=coffeeDao.findOne(1L);
		assertEquals(bean.getId(), dbbean.getId());
		assertEquals(bean.getName(), dbbean.getName());
		assertEquals(bean.getLocal(), dbbean.getLocal());
		assertEquals(bean.getTesting(), dbbean.getTesting());
		assertEquals(bean.getPrice(), dbbean.getPrice());
		// test update
		dbbean.setPrice(500);
		coffeeDao.save(dbbean);
		
		Coffee updatedCoffee = coffeeDao.findOne(1L);
		assertEquals(dbbean.getPrice(), updatedCoffee.getPrice());
		
		// test delete
		coffeeDao.findOne(1L);
		coffees = coffeeDao.findAll();
				
		assertEquals(originalSize, coffees.size());
		
	}
	
}
