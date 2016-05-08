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
	public List findById(Long id){
		return coffeeDao.findById(id);
	}
	public List findByName(String name){
		return coffeeDao.findByName(name);
	}
//	public List findByNameIgnoreCase(String name){
//		return coffeeDao.findByNameIgnoreCase(name);
//	}
//	public List findByLocalIgnoreCase(String local){
//		return coffeeDao.findByLocalIgnoreCase(local);
//	}
//	public List findByPriceIgnoreCase(int price){
//		return coffeeDao.findByPriceIgnoreCase(price);
//	}
//	public List findByTestingIgnoreCase(String testing){
//		return coffeeDao.findByTestingIgnoreCase(testing);
//	}
	
	
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

