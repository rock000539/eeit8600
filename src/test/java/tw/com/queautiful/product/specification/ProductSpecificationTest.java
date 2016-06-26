package tw.com.queautiful.product.specification;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.queautiful.App;
import tw.com.queautiful.product.dao.ProductDao;
import tw.com.queautiful.product.entity.Product;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(App.class)
public class ProductSpecificationTest {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ProductDao dao;
	
	@Test
	public void test() {
		
		Product filter = new Product();
		filter.setProdName("產品1");
		filter.setBrandId(1L);
		filter.setProdDesc("說明2");
		
		Specification<Product> spec = new ProductSpecification(filter);
		List<Product> list = dao.findAll(spec);
		
		for (Product product : list) {
			log.debug("{}", product);
		}
		
	}

}
