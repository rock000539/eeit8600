package tw.com.softleader.eeit8600.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.eeit8600.product.dao.ProductBrandDao;
import tw.com.softleader.eeit8600.product.entity.ProductBrand;

@Service
public class ProductBrandService {

	@Autowired
	private ProductBrandDao brandDao;
	
	public ProductBrand getById(Long id){
		return brandDao.findOne(id);
	}
	
	public List<ProductBrand> getAll(){
		return brandDao.findAll();	
	}
	
	public void insert(ProductBrand brand){
		brandDao.save(brand);
	}
	
	public void update(ProductBrand brand){
		brandDao.save(brand);
	}
	
	public void delete(Long id){
		brandDao.delete(id);
	}
}
