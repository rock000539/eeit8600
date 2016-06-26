package tw.com.softleader.eeit8600.coffee.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.eeit8600.coffee.entity.Coffee;

public interface CoffeeDao extends JpaRepository<Coffee, Long> {

	public List<Coffee> findByPriceLessThan(Integer price);
	public List<Coffee> findById(Long id);
	public List<Coffee> findByName(String name);
	public List<Coffee> findByNameIgnoreCase(String name);
	public List<Coffee> findByLocal(String local);
	public List<Coffee> findByPrice(int price);
	public List<Coffee> findByTesting(String testing);
	
//	public List<Coffee> findByNameIgnoreCase(String name);
//	public List<Coffee> findByLocalIgnoreCase(String local);
//	public List<Coffee> findByPriceIgnoreCase(int price);
//	public List<Coffee> findByTestingIgnoreCase(String testing);
}
