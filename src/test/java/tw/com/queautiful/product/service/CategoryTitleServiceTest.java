package tw.com.queautiful.product.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import tw.com.queautiful.App;
import tw.com.queautiful.product.entity.CategoryTitle;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(App.class)
public class CategoryTitleServiceTest {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CategoryTitleService service;
	
	@Test
	public void test() {
		List<CategoryTitle> list = service.getAll();
		for(CategoryTitle categoryTitle : list) {
			log.debug("{}", categoryTitle);
		}
	}

}
