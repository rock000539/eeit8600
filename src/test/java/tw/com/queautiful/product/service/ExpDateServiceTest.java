package tw.com.queautiful.product.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.queautiful.App;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(App.class)
public class ExpDateServiceTest {
	private Logger log = LoggerFactory.getLogger(this.getClass()); 
	
	@Autowired
	ExpDateService service;

	@Test
	public void testDateExpAfterOneMonth() {
		assertEquals(Long.valueOf(3L), service.expDateAfterOneMonth().get(0).getMemberId());
	}

}
