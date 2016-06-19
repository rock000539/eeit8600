package tw.com.example;

import java.util.HashSet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.Transactional;

import tw.com.example.dao.BookDao;
import tw.com.example.dao.PublisherDao;
import tw.com.example.entity.Book;
import tw.com.example.entity.Publisher;

@SpringBootApplication
public class App implements CommandLineRunner {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private BookDao bookDao;

	@Autowired
	private PublisherDao publisherDao;

	public static void main(String[] args) throws Exception {
		SpringApplication.run(App.class, args);
	}

	@Override
	@Transactional
	public void run(String... strings) throws Exception {

		// save a couple of books
		Publisher publisherA = new Publisher("PublisherA");
		Publisher publisherB = new Publisher("PublisherB");
		Publisher publisherC = new Publisher("PublisherC");
		
		HashSet<Publisher> setP = new HashSet<>();
		setP.add(publisherA);
		setP.add(publisherB);
		Book bookP = new Book("BookP", setP);
		
		logger.info(bookP.toString());
		
		// fetch all books
		for (Book book : bookDao.findAll()) {
			logger.info(book.toString());
		}

		// save a couple of publishers
		Book bookA = new Book("BookA");
		Book bookB = new Book("BookB");

		// fetch all publishers
		for (Publisher publisher : publisherDao.findAll()) {
			logger.info(publisher.toString());
		}
	}

}
