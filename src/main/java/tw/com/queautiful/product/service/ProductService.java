package tw.com.queautiful.product.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.ProductDao;
import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.vo.product.ProductInventory;
import tw.com.queautiful.product.vo.product.ProductSearch;
import tw.com.queautiful.product.vo.product.ProductView;

@Service
public class ProductService {
	
	@Autowired
	private ProductDao productDao;

	public Product getById(Long prodId) {
		return productDao.findOne(prodId);
	}

	public List<Product> getAll() {
		return productDao.findAll();
	}
	
	public Page<Product> getAll(Pageable pageable) {
		return productDao.findAll(pageable);
	}

	public List<Product> getAll(Specification<Product> spec) {
		return productDao.findAll(spec);
	}
	
	public Page<Product> getAll(Specification<Product> spec, Pageable pageable) {
		return productDao.findAll(spec, pageable);
	}

	public void insert(Product product) {
		productDao.save(product);
	}

	public void update(Product product) {
		productDao.save(product);
	}

	public void delete(Long productId) {
		productDao.delete(productId);
	}
	
	public ProductView getByIdByVoView(Long prodId) {
		
		ProductView product = new ProductView();
		BeanUtils.copyProperties(productDao.findOne(prodId), product);
		
		return product;
	}
	
	public List<ProductSearch> getAllByVoSearch(List<Product> list) {
		
		List<Product> p_list = list != null ? list : productDao.findAll();

		List<ProductSearch> products = new ArrayList<>();
		ProductSearch product = null;
		for(Product temp : p_list) {
			product = new ProductSearch();
			BeanUtils.copyProperties(temp, product);
			products.add(product);
		}
		
		return products;
	}
	
	public List<ProductInventory> getAllByVoInventory(List<Product> list) {
		
		List<Product> p_list = list != null ? list : productDao.findAll();
		
		List<ProductInventory> products = new ArrayList<>();
		ProductInventory product = null;
		for(Product temp : p_list) {
			product = new ProductInventory();
			BeanUtils.copyProperties(temp, product);
			product.setrSize(temp.getReviews().size());
			products.add(product);
		}
		
		return products;
	}

	public List<Product> findTop10ByOrderByScoreDesc() {
		return productDao.findTop10ByOrderByScoreDesc();
	}
	
	public List<Product> findByProdNameEndsWith(String prodName){
		return productDao.findByProdNameEndsWith(prodName);
	}
	
}
