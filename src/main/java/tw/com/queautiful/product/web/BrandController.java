package tw.com.queautiful.product.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.com.queautiful.product.entity.Brand;
import tw.com.queautiful.product.service.BrandService;

@Controller
@RequestMapping("/brands")
public class BrandController {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	private String rootPath = System.getProperty("user.dir");
	private String imgPath = rootPath + File.separator + "src/main/webapp/WEB-INF";
	
	@Autowired
	private BrandService brandService;
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("brands",brandService.getAll());
		return "/brand/brandList";
	}
	
	@RequestMapping("/add")
	public String addPage(){
		return "/brand/brandAdd";
	}
	
	@RequestMapping("/edit")
	public String editPage(@RequestParam Long brandId,Model model){
		model.addAttribute("brand",brandService.getById(brandId));
		return "/brand/brandEdit";
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public Brand insert(@RequestPart("brand") Brand brand,	
			@RequestPart("brandImgFile") MultipartFile brandImgFile){	

		brandService.saveImg(brand, brandImgFile);
		brandService.insert(brand);
		return brand;
		
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Brand update(@RequestPart("brand") Brand brand, 
			@RequestPart("brandImgFile") List<MultipartFile> brandImgFiles){
		
		if(!brandImgFiles.isEmpty()){
			MultipartFile brandImgFile = brandImgFiles.get(0);
			brandService.saveImg(brand, brandImgFile);
		}
		brandService.update(brand);
		return brand;
		
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam Long brandId) {
		brandService.delete(brandId);
		return "redirect:/brands/list";
	}
	
	@RequestMapping("/show")
	public void show(HttpServletResponse  resp, @RequestParam Long brandId){
		Brand brand=brandService.getById(brandId);
		String brandName = brand.getBrandName();
		try (InputStream is = new FileInputStream(imgPath +"/img/brand/"+brandName+".png");
			ServletOutputStream out = resp.getOutputStream();){			
			byte[] b = new byte[8192];
			int len = 0;
			while ((len = is.read(b)) != -1) {
			out.write(b, 0, len);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
//	@RequestMapping(value = "/getimage", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
//	public void getImage( HttpServletResponse response ) throws IOException
//	{
//	    
//		ByteStreams.copy( getClass().getResourceAsStream( "/preview-image.jpg" ), response.getOutputStream() );
//	}
	
	public Map<String,String> validate(String[] data){
		Map<String,String> errorMsg = new HashMap<String,String>();		
		return null;		
	}

}
