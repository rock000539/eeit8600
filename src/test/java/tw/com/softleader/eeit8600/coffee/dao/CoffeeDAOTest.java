package tw.com.softleader.eeit8600.coffee.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import tw.com.softleader.eeit8600.book.entity.Book;
import tw.com.softleader.eeit8600.coffee.entity.CoffeeByParker;

public class CoffeeDAOTest {

	@Test
	public void testCrud() {
		CoffeeDAO dao=new CoffeeDAO();
		CoffeeByParker bean=new CoffeeByParker(); 
		List<CoffeeByParker> coffees = dao.select();
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
		CoffeeByParker dbbean=dao.select(1);
		assertEquals(bean.getId(), dbbean.getId());
		assertEquals(bean.getName(), dbbean.getName());
		assertEquals(bean.getLocal(), dbbean.getLocal());
		assertEquals(bean.getTesting(), dbbean.getTesting());
		assertEquals(bean.getPrice(), dbbean.getPrice());
		// test update
		dbbean.setPrice(500);
		dao.update(dbbean);
		
		CoffeeByParker updatedCoffee = dao.select(1);
		assertEquals(dbbean.getPrice(), updatedCoffee.getPrice());
		
		// test delete
		dao.delete(1);
		coffees = dao.select();
				
		assertEquals(originalSize, coffees.size());
		
	}
	
}
