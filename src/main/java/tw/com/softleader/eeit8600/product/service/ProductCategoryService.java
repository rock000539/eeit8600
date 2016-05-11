package tw.com.softleader.eeit8600.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.eeit8600.product.dao.ProductCategoryDao;
import tw.com.softleader.eeit8600.product.entity.ProductCategory;

@Service
public class ProductCategoryService {

	@Autowired
	private ProductCategoryDao categoryDao;
	
	public List<ProductCategory> getAll(){
		
		return categoryDao.findAll();
	}
	
	public void insert(ProductCategory category){
		categoryDao.save(category);
	}
	
	public void udpate(ProductCategory category){
		categoryDao.save(category);
	}
	
	public void delete(Long id){
		categoryDao.delete(id);
	}
}
