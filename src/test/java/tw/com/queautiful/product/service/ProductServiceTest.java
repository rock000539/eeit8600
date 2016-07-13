package tw.com.queautiful.product.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.queautiful.App;
import tw.com.queautiful.commons.util.Spec;
import tw.com.queautiful.product.entity.Product;


@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(App.class)
public class ProductServiceTest {

	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ProductService service;

	@PersistenceContext
	private EntityManager em;

	@Test
	public void test() {

		Product filter = new Product();
		filter.setProdName("產品1");
		filter.getBrand().setBrandId(2L);
		filter.setProdDesc("說明2");

		//Specification<Product> spec = new ProductSpecification(filter);
		Specification<Product> spec = Spec.byAuto(em, filter);
		List<Product> list = service.getAll(spec);

		for (Product product : list) {
			log.debug("{}", product);
		}

		log.debug("{}", em);

	}

}
