package tw.com.softleader.eeit8600.product.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.eeit8600.product.entity.ProductCategory;

public interface CategoryDao extends JpaRepository<ProductCategory, Long>{

	//public List<Category> findByPriceLessThan(Integer price);
	
}
