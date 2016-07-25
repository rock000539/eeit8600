package tw.com.queautiful.product.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.CategoryDao;
import tw.com.queautiful.product.entity.Category;
import tw.com.queautiful.product.vo.category.CategorySearch;


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
	
	public List<CategorySearch> getAllByVoSearch() {
		
		List<Category> c_list = categoryDao.findAll();
		List<CategorySearch> categories = new ArrayList<>();
		CategorySearch category = null;
		for (Category temp : c_list) {
			category = new CategorySearch();
			BeanUtils.copyProperties(temp, category);
			categories.add(category);
		}
		
		return categories;
	}
	
}
