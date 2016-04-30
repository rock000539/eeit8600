package tw.com.softleader.eeit8600.coffee.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.eeit8600.coffee.entity.Coffee;

public interface CoffeeDao extends JpaRepository<Coffee, Long> {

	public List<Coffee> findByPriceLessThan(Integer price);

}
