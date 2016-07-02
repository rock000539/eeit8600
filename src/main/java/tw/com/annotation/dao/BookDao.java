package tw.com.annotation.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.annotation.entity.Book;

public interface BookDao extends JpaRepository<Book, Long> {

}
