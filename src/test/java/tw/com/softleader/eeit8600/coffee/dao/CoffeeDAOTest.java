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
		List<CoffeeByParker> books = dao.select();
		
		bean.setId(1);
		bean.setName("first");
		bean.setLocal("JP");
		bean.setPrice(200);
		bean.setTesting("not bad");		
		dao.insert(bean);
		
		dao.select();
		dao.select(1);
		
	}
	
}
