package tw.com.softleader.eeit8600.book.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.eeit8600.book.entity.Book;

public interface BookDao extends JpaRepository<Book, Long>{

	public List<Book> findByPriceLessThan(Integer price);
	
}
