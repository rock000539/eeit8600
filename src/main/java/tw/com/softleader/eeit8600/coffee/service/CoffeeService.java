package tw.com.softleader.eeit8600.coffee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.eeit8600.coffee.dao.CoffeeDao;
import tw.com.softleader.eeit8600.coffee.entity.Coffee;

@Service
public class CoffeeService {
	@Autowired
	private CoffeeDao coffeeDao;
	
	public CoffeeService() {
	}
	
	public Coffee getById(Long id) {
		return coffeeDao.findOne(id);		
	}
	
	public List<Coffee> getAll() {
		return coffeeDao.findAll();
	}
	
	public void insert(Coffee coffee) {
		coffeeDao.save(coffee);
	}
	
	public void update(Coffee coffee) {
		coffeeDao.save(coffee);
	}
	
	public void delete(Long id) {
		coffeeDao.delete(id);
	}
}

