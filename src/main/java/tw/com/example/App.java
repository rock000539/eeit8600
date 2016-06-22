package tw.com.example;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import tw.com.example.dao.BookDao;
import tw.com.example.dao.CategoryDao;
import tw.com.example.dao.DetailDao;
import tw.com.example.dao.PublisherDao;
import tw.com.example.entity.Book;
import tw.com.example.entity.Category;
import tw.com.example.entity.Detail;

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

		// // @OneToOne Example
		// // save a couple of bookDetails
		// List<Detail> details = new ArrayList<>();
		// details.add(new Detail(49));
		// details.add(new Detail(59));
		// details.add(new Detail(69));
		// detailDao.save(details);
		//
		// // save a couple of books
		// List<Book> books = new ArrayList<>();
		// // 新增時就寫入FK
		// books.add(new Book("Book A", detailDao.findOne(1)));
		// books.add(new Book("Book B", detailDao.findOne(2)));
		// books.add(new Book("Book C"));
		// bookDao.save(books);
		//
		// // 修改時才寫入FK
		// Book bookC = bookDao.findOne(3L);
		// bookC.setDetail(detailDao.findOne(3));
		// bookDao.save(bookC);
		//
		// // fetch all books
		// for (Book book : bookDao.findAll()) {
		// logger.info("{}", book.toString());
		// }

		// @OneToMany / @ManyToOne Example
		List<Category> categories = new ArrayList<>();
		categories.add(new Category("category4"));
		categories.add(new Category("category5"));
		categories.add(new Category("category6"));
		categoryDao.save(categories);

		// save a couple of books
		List<Book> books = new ArrayList<>();
		books.add(new Book("bookD", categoryDao.findOne(1)));
		books.add(new Book("bookE", categoryDao.findOne(1)));
		books.add(new Book("bookF", categoryDao.findOne(1)));
		bookDao.save(books);

		// fetch all books
		for (Book book : bookDao.findAll()) {
			logger.info("{}", book);
		}

		// fetch all categories
		for (Category category : categoryDao.findAll()) {
			logger.info("{}", category.toString());
		}

		// @ManyToMany Example

	}

}
