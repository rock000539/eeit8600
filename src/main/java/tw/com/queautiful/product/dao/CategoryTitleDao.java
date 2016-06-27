package tw.com.queautiful.product.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.queautiful.product.entity.CategoryTitle;

public interface CategoryTitleDao extends JpaRepository<CategoryTitle, Long> {
	
}
