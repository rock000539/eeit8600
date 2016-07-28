package tw.com.queautiful.product.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.IngredientDao;
import tw.com.queautiful.product.entity.Ingredient;
import tw.com.queautiful.product.entity.Member;



@Service
public class IngredientService {
	@Autowired
	private IngredientDao ingredientDao;
	@PersistenceContext
	private EntityManager manager;
	
	public Ingredient getById(Long ingredId){
		return ingredientDao.findOne(ingredId);
	}
	
	public List<Ingredient> getAll(){
		return ingredientDao.findAll();
	}
	
	public Page<Ingredient> getAll(Pageable pageable){
		return ingredientDao.findAll(pageable);
	}
	
	public void insert(Ingredient ingredient){
		ingredientDao.save(ingredient);
	}
	
	public void update(Ingredient ingredient){
		ingredientDao.save(ingredient);
	}
	
	public void delete(Long ingredId){
		ingredientDao.delete(ingredId);
		String deleteProdIngreListData=
		"Delete form [proingrelist] where [ingredid]="+ingredId;
		manager.createNativeQuery(deleteProdIngreListData).executeUpdate();
	}
	
	public List<Ingredient> findByIngredName(String ingredName){
		return (List<Ingredient>) ingredientDao.findByIngredNameEndsWith(ingredName);
	}
	
	public List<Ingredient> findByIngredChName(String ingredName){
		return (List<Ingredient>) ingredientDao.findByIngredChNameEndsWith(ingredName);
	}
	
	public Ingredient findByIngredCorrectName(String ingredName){		
		return ingredientDao.findByIngredCorrectName(ingredName);
	}
	
	public Ingredient findByIngredChCorrectName(String ingredName){
		return ingredientDao.findByIngredChCorrectName(ingredName);
	}
	
	public List<Ingredient> findByCheckedDataIs(boolean CheckedData){
		return ingredientDao.findByCheckedDataIs(CheckedData);
	}
}
