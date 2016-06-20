package tw.com.queautiful.product.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	
	public void insert(Brand brand){
		brandDao.save(brand);
	}
	
	public void update(Brand brand){
		brandDao.save(brand);
	}
	
	public void delete(Long brandId){
		brandDao.delete(brandId);
	}
	
	public void saveImg(Brand brand, MultipartFile brandImgFile){
		String brandName = brand.getBrandName();
		if(!brandImgFile.isEmpty()){
			try {
				byte[] bytes = brandImgFile.getBytes();
				String path = "src/main/webapp/WEB-INF/img/brand";
				File dir = new File(path);

				if(!dir.exists())
					dir.mkdirs();
				
				String imgPath = path + File.separator + brandName + ".png";
				
				File file = new File(imgPath);
				FileOutputStream fos = new FileOutputStream(file);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(bytes);
				bos.close();
				fos.close();
				
				brand.setBrandImg(imgPath);
				
			} catch (IOException e) {
				System.out.println("Failed to upload " + brandName + " => " + e.getMessage());
				e.printStackTrace();
			}
		}else{
			System.out.println("Failed to upload " + brandName + " because the file was empty.");
		}
	}
	
}
