package tw.com.queautiful.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.CategoryTitleDao;
import tw.com.queautiful.product.entity.CategoryTitle;

@Service
public class CategoryTitleService {
	
	@Autowired
	private CategoryTitleDao dao;
	
	public CategoryTitle getById(Long titleId) {
		return dao.findOne(titleId);
	}
	
	public List<CategoryTitle> getAll() {
		return dao.findAll();
	}
	
	public Page<CategoryTitle> getAll(Pageable pageable) {
		return dao.findAll(pageable);
	}
	
	public void insert(CategoryTitle categoryTitle) {
		dao.save(categoryTitle);
	}
	
	public void update(CategoryTitle categoryTitle) {
		dao.save(categoryTitle);
	}
	
	public void delete(Long titleId) {
		dao.delete(titleId);
	}
}
