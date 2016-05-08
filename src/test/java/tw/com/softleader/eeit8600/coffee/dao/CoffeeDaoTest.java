package tw.com.softleader.eeit8600.coffee.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.util.Collection;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.eeit8600.App;
import tw.com.softleader.eeit8600.coffee.entity.Coffee;
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(App.class)
public class CoffeeDaoTest {
	
	@Autowired
	CoffeeDao coffeeDao;
	Collection<Coffee> coffeeList;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		Coffee coffee1=new Coffee(1L,"first","JP",100,"no");
		Coffee coffee2=new Coffee(2L,"Secend","US",200,"no");
		coffeeDao.save(coffee1);	
		coffeeDao.save(coffee2);	
		
	}

	@After
	public void tearDown() throws Exception {
		
	}
	@Test
	public void testFindByName() {
		coffeeList=coffeeDao.findByName("first");
		assertEquals(1, coffeeList.size());		
	}

	@Test
	public void testFindByPrice() {
		coffeeList=coffeeDao.findByPrice(200);
		assertEquals(1, coffeeList.size());		
	}

	@Test
	public void testFindByLocal() {
		coffeeList=coffeeDao.findByLocal("us");
		assertEquals(1, coffeeList.size());		
	}
	@Test
	public void testFindByTesting() {
		coffeeList=coffeeDao.findByTesting("no");
		assertEquals(2, coffeeList.size());		
	}
	
	
//	@Test
//	public void testFindByNameIgnoreCase() {
//		coffeeList=coffeeDao.findByNameIgnoreCase("first");
//		assertEquals(1, coffeeList.size());		
//	}
//	@Test
//	public void testFindByPriceIgnoreCase() {
//		coffeeList=coffeeDao.findByPriceIgnoreCase(200);
//		assertEquals(1, coffeeList.size());		
//	}
//
//	@Test
//	public void testFindByLocalIgnoreCase() {
//		coffeeList=coffeeDao.findByLocalIgnoreCase("us");
//		assertEquals(1, coffeeList.size());		
//	}
//	@Test
//	public void testFindByTestingIgnoreCase() {
//		coffeeList=coffeeDao.findByTestingIgnoreCase("no");
//		assertEquals(2, coffeeList.size());		
//	}
}
