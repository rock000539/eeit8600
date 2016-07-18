package tw.com.annotation.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.annotation.entity.BookCategory;

public interface BookCategoryDao extends JpaRepository<BookCategory, Integer> {

}
