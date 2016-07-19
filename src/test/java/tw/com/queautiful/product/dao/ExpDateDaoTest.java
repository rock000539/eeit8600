package tw.com.queautiful.product.dao;

import static org.junit.Assert.*;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.queautiful.App;
import tw.com.queautiful.product.entity.ExpDate;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(App.class)
public class ExpDateDaoTest {
	private Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private ExpDateDao dao;
	
	@Test
	public void testFindByExpIs() {
		Calendar exp = Calendar.getInstance();
		exp.set(2018, 2, 16);
		Date expDate = new Date(exp.getTimeInMillis());
		List<ExpDate> e = dao.findByExpIs(expDate);
		log.debug(e.toString());
		assertEquals(Long.valueOf(1L), e.get(0).getMemberId());
	}

}
