package tw.com.queautiful.product.service;

import static org.junit.Assert.*;

import java.sql.Date;
import java.text.ParseException;
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
	
	@Autowired
	private MemberService memberService;

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
		
		log.debug("reivew_size = {}", product.getReviews().size());
		
		List<Review> reviews = product.getReviews();
		
		int size = reviews.size();
		int[] ages = new int[5]; 
		int[] stars = new int[6];
		
		for(Review review : reviews) {
			
			log.debug("review_star = {}", review.getReviewRating());
			
			Date date = review.getMember().getBirthDay();
			
			int age = 0;
			try {
				age = memberService.getMemberAge(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			
			if(age<=19) {
				ages[0]++;
			} else if(age>=20 && age<=24) {
				ages[1]++;
			} else if(age>=25 && age<=29) {
				ages[2]++;
			} else if(age>=30 && age<=34) {
				ages[3]++;
			} else {
				ages[4]++;
			}
			
			stars[review.getReviewRating()] ++;
			
		}
		
		for(int i = 0; i<ages.length; i++) {
			log.debug("ages {} = {}", i, ages[i]);
		}
		
		for(int i = 0; i<stars.length; i++) {
			log.debug("stars {} = {}", i, stars[i]);
		}
		
	}

}
