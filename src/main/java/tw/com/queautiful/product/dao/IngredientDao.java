package tw.com.queautiful.product.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.eeit8600.product.entity.Ingredient;

public interface IngredientDao extends JpaRepository<Ingredient, Long>{

}
