package tw.com.example.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.example.entity.Book;

public interface BookDao extends JpaRepository<Book, Long> {

}
