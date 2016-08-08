package tw.com.queautiful.product.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.BrandDao;
import tw.com.queautiful.product.entity.Brand;
import tw.com.queautiful.product.vo.brand.BrandSearch;

@Service
public class BrandService {

	@Autowired
	private BrandDao brandDao;

	public Brand getById(Long brandId) {
		return brandDao.findOne(brandId);
	}

	public List<Brand> getAll() {
		return brandDao.findAll();
	}

	public Page<Brand> getAll(Pageable pageable) {
		return brandDao.findAll(pageable);
	}

	public void insert(Brand brand) {
		brandDao.save(brand);
	}

	public void update(Brand brand) {
		brandDao.save(brand);
	}

	public void delete(Long brandId) {
		brandDao.delete(brandId);
	}

	public List<BrandSearch> getAllByVoSearch() {
		
		List<Brand> b_list = brandDao.findAll();
		List<BrandSearch> brands = new ArrayList<>();
		BrandSearch brand = null;
		for (Brand temp : b_list) {
			brand = new BrandSearch();
			BeanUtils.copyProperties(temp, brand);
			brands.add(brand);
		}
		
		return brands;
	}
	
	public BrandSearch copyBrandForIngredient(Brand brand){
		BrandSearch brandSearch=new BrandSearch();
		BeanUtils.copyProperties(brand, brandSearch);
		return brandSearch;
	}

}
