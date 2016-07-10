package tw.com.queautiful.product.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import tw.com.queautiful.product.entity.Product;

public interface ProductDao extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {
	
	@Query("select p from Product p where p.prodName like %?1%")
	List<Product> findByProdNameEndsWith(String prodName);
	
	List<Product> findTop10ByOrderByScoreDesc();
}
