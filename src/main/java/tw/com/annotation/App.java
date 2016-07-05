package tw.com.annotation;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import tw.com.annotation.dao.BookDao;
import tw.com.annotation.dao.BookCategoryDao;
import tw.com.annotation.dao.DetailDao;
import tw.com.annotation.dao.PublisherDao;
import tw.com.annotation.dao.TesterDao;
import tw.com.annotation.entity.Book;
import tw.com.annotation.entity.BookCategory;
import tw.com.annotation.entity.Detail;
import tw.com.annotation.entity.Publisher;
import tw.com.annotation.entity.Tester;
import tw.com.annotation.util.Gender;

@SpringBootApplication(
		exclude = {
				org.springframework.boot.autoconfigure.security.SecurityAutoConfiguration.class,
				org.springframework.boot.actuate.autoconfigure.ManagementWebSecurityAutoConfiguration.class
		}		
)
public class App implements CommandLineRunner {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private BookDao bookDao;

	@Autowired
	private DetailDao detailDao;

	@Autowired
	private BookCategoryDao categoryDao;

	@Autowired
	private PublisherDao publisherDao;
	
	@Autowired
	private TesterDao testerDao;

	public static void main(String[] args) throws Exception {
		SpringApplication.run(App.class, args);
	}

	@Override
	@Transactional
	public void run(String... strings) throws Exception {
		
		Tester tester = new Tester();
		tester.setName("USER2");
		tester.setAge(25);
		tester.setGender(Gender.MALE);
		testerDao.save(tester);
		
		logger.info("{}", Gender.MALE);
		logger.info("{}", Gender.FEMALE);
		
		List<Tester> testers = testerDao.findAll();
		for(Tester tmp : testers) {
			logger.info("{}", tmp);
		}

		// @OneToOne Example
//		// save a couple of books
//		List<Book> books = new ArrayList<>();
//		// 新增時就寫入FK
//		Book book1 = bookDao.findOne(1L);
//		book1.setDetail(detailDao.findOne(1));
//		books.add(book1);
//		Book book2 = bookDao.findOne(2L);
//		book2.setDetail(detailDao.findOne(1));
//		books.add(book2);
//		Book book3 = bookDao.findOne(3L);
//		book3.setDetail(detailDao.findOne(1));
//		books.add(book3);
//		bookDao.save(books);

		// @OneToMany / @ManyToOne Example
//		List<Category> categories = new ArrayList<>();
//		categories.add(new Category("category4"));
//		categories.add(new Category("category5"));
//		categories.add(new Category("category6"));
//		categoryDao.save(categories);
//
//		// save a couple of books
//		List<Book> books = new ArrayList<>();
//		Book book4 = new Book("bookD");
//		book4.setCategory(categoryDao.findOne(1));
//		books.add(book4);
//		Book book5 = new Book("bookE");
//		book5.setCategory(categoryDao.findOne(1));
//		books.add(book5);
//		Book book6 = new Book("bookF");
//		book6.setCategory(categoryDao.findOne(1));
//		books.add(book6);
//		bookDao.save(books);
//
//		// fetch all books
//		for (Book book : bookDao.findAll()) {
//			logger.info("{}", book);
//		}
//
//		// fetch all categories
//		for (Category category : categoryDao.findAll()) {
//			logger.info("{}", category.toString());
//		}

		// @ManyToMany Example
//		Book temp = bookDao.findOne(1L);
//		temp.setPublishers(publisherDao.findAll());
//		bookDao.save(temp);
//
//		// fetch all books
//		for (Book book : bookDao.findAll()) {
//			logger.info("{}", book);
//		}
		
	}

}
