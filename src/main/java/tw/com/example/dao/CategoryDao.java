package tw.com.example.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.example.entity.Category;

public interface CategoryDao extends JpaRepository<Category, Integer> {

}
