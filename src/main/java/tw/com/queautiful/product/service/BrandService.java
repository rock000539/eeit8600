package tw.com.queautiful.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.BrandDao;
import tw.com.queautiful.product.entity.Brand;

@Service
public class BrandService {

	@Autowired
	private BrandDao brandDao;
	
	public Brand getById(Long brandId){
		return brandDao.findOne(brandId);
	}
	
	public List<Brand> getAll(){
		return brandDao.findAll();	
	}
	
	public Page<Brand> getAll(Pageable pageable){
		return brandDao.findAll(pageable);
	}
	
	public void insert(Brand brand){
		brandDao.save(brand);
	}
	
	public void update(Brand brand){
		brandDao.save(brand);
	}
	
	public void delete(Long brandId){
		brandDao.delete(brandId);
	}
		
}
