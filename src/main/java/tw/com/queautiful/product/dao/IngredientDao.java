package tw.com.queautiful.product.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.queautiful.product.entity.Ingredient;

public interface IngredientDao extends JpaRepository<Ingredient, Long>{
	@Query("select s from Ingredient s where s.ingredName like %?1% order by s.ingredName asc ")
	List<Ingredient> findByIngredNameEndsWith(String ingredName);
	
	@Query("select s from Ingredient s where s.ingredChName like %?1% order by s.ingredName asc")
	List<Ingredient> findByIngredChNameEndsWith(String ingredChName);
	
	@Query("select s from Ingredient s where s.ingredChName = ?")
	Ingredient findByIngredChCorrectName(String ingredChName);
	
	@Query("select s from Ingredient s where s.ingredName = ?")
	Ingredient findByIngredCorrectName(String ingredName);
	@Query("select s from Ingredient s where s.CheckedData = ?")
	public List<Ingredient> findByCheckedDataIs(boolean CheckedData);
	
}
