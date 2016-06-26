package tw.com.softleader.eeit8600.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.eeit8600.product.dao.IngredientDao;
import tw.com.softleader.eeit8600.product.entity.Ingredient;

@Service
public class IngredientService {
	@Autowired
	private IngredientDao ingredientDao;
	
	public Ingredient getById(Long ingredId){
		return ingredientDao.findOne(ingredId);
	}
	
	public List<Ingredient> getAll(){
		return ingredientDao.findAll();
	}
	
	public void insert(Ingredient ingredient){
		ingredientDao.save(ingredient);
	}
	
	public void update(Ingredient ingredient){
		ingredientDao.save(ingredient);
	}
	
	public void delete(Long ingredId){
		ingredientDao.delete(ingredId);
	}
	
	
}
