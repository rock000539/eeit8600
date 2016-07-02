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
import tw.com.annotation.dao.CategoryDao;
import tw.com.annotation.dao.DetailDao;
import tw.com.annotation.dao.PublisherDao;
import tw.com.annotation.entity.Book;
import tw.com.annotation.entity.Category;
import tw.com.annotation.entity.Detail;
import tw.com.annotation.entity.Publisher;

@SpringBootApplication
public class App implements CommandLineRunner {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private BookDao bookDao;

	@Autowired
	private DetailDao detailDao;

	@Autowired
	private CategoryDao categoryDao;

	@Autowired
	private PublisherDao publisherDao;

	public static void main(String[] args) throws Exception {
		SpringApplication.run(App.class, args);
	}

	@Override
	@Transactional
	public void run(String... strings) throws Exception {

		// @OneToOne Example
//		// save a couple of bookDetails
//		List<Detail> details = new ArrayList<>();
//		details.add(new Detail(49));
//		details.add(new Detail(59));
//		details.add(new Detail(69));
//		detailDao.save(details);
//
//		// save a couple of books
//		List<Book> books = new ArrayList<>();
//		// 新增時就寫入FK
//		Book book1 = new Book("BookA");
//		book1.setDetail(detailDao.findOne(1));
//		books.add(book1);
//		Book book2 = new Book("BookB");
//		book2.setDetail(detailDao.findOne(1));
//		books.add(book2);
//		Book book3 = new Book("BookC");
//		books.add(book3);
//		bookDao.save(books);
//
//		// 修改時才寫入FK
//		Book bookC = bookDao.findOne(3L);
//		bookC.setDetail(detailDao.findOne(1));
//		bookDao.save(bookC);
//
//		// fetch all books
//		for (Book book : bookDao.findAll()) {
//			logger.info("{}", book.toString());
//		}

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
		List<Publisher> publishers = new ArrayList<>();
		Publisher publisher1 = new Publisher("publisher1");
		Publisher publisher2 = new Publisher("publisher2");
		Publisher publisher3 = new Publisher("publisher3");
		publishers.add(publisher1);
		publishers.add(publisher2);
		publishers.add(publisher3);
		publisherDao.save(publishers);
		
		List<Book> books = new ArrayList<>();
		Book book1 = new Book("book1");
		Book book2 = new Book("book2");
		Book book3 = new Book("book3");
		books.add(book1);
		books.add(book2);
		books.add(book3);
		bookDao.save(books);
		
		Book temp = bookDao.findOne(1L);
		temp.setPublishers(publisherDao.findAll());
		bookDao.save(temp);

		// fetch all books
		for (Book book : bookDao.findAll()) {
			logger.info("{}", book);
		}
		
	}

}
