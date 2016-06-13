package tw.com.queautiful.product.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.queautiful.product.entity.Product;

public interface ProductDao extends JpaRepository<Product, Long> {

}
