package tw.com.queautiful.product.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.queautiful.product.entity.Ingredient;

public interface IngredientDao extends JpaRepository<Ingredient, Long>{

}
