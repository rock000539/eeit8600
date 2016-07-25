package tw.com.queautiful.product.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.hibernate.Hibernate;
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
import tw.com.queautiful.product.entity.Review;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(App.class)
public class ProductServiceTest {

	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ProductService productService;
	
	@Autowired
	private BrandService brandService;

	@PersistenceContext
	private EntityManager em;

	@Test
	@Transactional
	public void test() {

//		Product filter = new Product();
//		filter.setBrand(brandService.getById(1L));
//		
//		log.debug("{}", filter);
//
//		Specification<Product> spec = Spec.byAuto(em, filter);
//		List<Product> list = productService.getAll(spec);
//
//		for (Product product : list) {
//			log.debug("{}", product);
//		}
		
		Product product = productService.getById(1L);
		for(Review review : product.getReviews()) {
			log.debug("review = {}", review);
		}
	}

}
