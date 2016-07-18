package tw.com.queautiful.product.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.queautiful.product.entity.Category;

public interface CategoryDao extends JpaRepository<Category, Long> {

	//public List<Category> findByPriceLessThan(Integer price);
	
}
