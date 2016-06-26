package tw.com.softleader.eeit8600.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.eeit8600.product.dao.CategoryDao;
import tw.com.softleader.eeit8600.product.entity.Category;

@Service
public class CategoryService {

	@Autowired
	private CategoryDao categoryDao;
	
	public Category getById(Long id){
		return categoryDao.findOne(id);
	}
	
	public List<Category> getAll(){
	
		return categoryDao.findAll();
	}
	
	public void insert(Category category){
		categoryDao.save(category);
	}
	
	public void update(Category category){
		categoryDao.save(category);
	}
	
	public void delete(Long id){
		categoryDao.delete(id);
	}
}
