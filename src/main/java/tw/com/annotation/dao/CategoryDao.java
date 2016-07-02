package tw.com.annotation.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.annotation.entity.Category;

public interface CategoryDao extends JpaRepository<Category, Integer> {

}
