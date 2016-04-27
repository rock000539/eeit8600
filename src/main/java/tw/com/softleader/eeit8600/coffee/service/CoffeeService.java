package tw.com.softleader.eeit8600.coffee.service;

import java.util.ArrayList;
import java.util.List;

import tw.com.softleader.eeit8600.book.dao.BookDao;
import tw.com.softleader.eeit8600.book.entity.Book;
import tw.com.softleader.eeit8600.coffee.dao.CoffeeDao;
import tw.com.softleader.eeit8600.coffee.entity.Coffee;


public class CoffeeService {
	private CoffeeDao coffeeDao;
	
	public CoffeeService() {
		coffeeDao  = new CoffeeDao();
	}
	
	public Coffee getById(Long id) {
		return coffeeDao.select(id);		
	}
	
	public List<Coffee> getAll() {
		return coffeeDao.select();
	}
	
	public void insert(Coffee Coffee) {
		coffeeDao.insert(Coffee);
	}
	
	public void update(Coffee Coffee) {
		coffeeDao.update(Coffee);
	}
	
	public void delete(int id) {
		coffeeDao.delete(id);
	}
}

