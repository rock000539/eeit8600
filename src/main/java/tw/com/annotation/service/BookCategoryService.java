package tw.com.annotation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.annotation.dao.BookCategoryDao;
import tw.com.annotation.entity.BookCategory;

@Service
public class BookCategoryService {
	
	@Autowired
	private BookCategoryDao dao;
	
	public BookCategory getById(Integer categoryId) {
		return dao.findOne(categoryId);
	}
	
	public List<BookCategory> getAll() {
		return dao.findAll();
	}
	
}
