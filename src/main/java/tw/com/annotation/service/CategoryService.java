package tw.com.annotation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.annotation.dao.CategoryDao;
import tw.com.annotation.entity.Category;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryDao dao;
	
	public Category getById(Integer categoryId) {
		return dao.findOne(categoryId);
	}
	
	public List<Category> getAll() {
		return dao.findAll();
	}
	
}
