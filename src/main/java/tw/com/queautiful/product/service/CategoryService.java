package tw.com.queautiful.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.CategoryDao;
import tw.com.queautiful.product.entity.Category;


@Service
public class CategoryService {

	@Autowired
	private CategoryDao categoryDao;
	
	public Category getById(Long categoryId){
		return categoryDao.findOne(categoryId);
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
	
	public void delete(Long categoryId){
		categoryDao.delete(categoryId);
	}
}
