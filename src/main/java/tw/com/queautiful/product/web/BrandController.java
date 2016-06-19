package tw.com.queautiful.product.web;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
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
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;

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
	
	@RequestMapping(value = "/insert"
			//,method = RequestMethod.POST, consumes=MediaType.MULTIPART_FORM_DATA_VALUE, produces="application/json"
			)
	@ResponseBody
	public Brand insert(@RequestPart("brand") Brand brand,	
			@RequestPart("brandImgFile") MultipartFile brandImgFile){	
//		System.out.println(brand);
//		System.out.println(brandImgFile);
		
		String brandName = brand.getBrandName();
		if (!brandImgFile.isEmpty()) {
			try {
				byte[] bytes = brandImgFile.getBytes();

				// Creating the directory to store file			
				File dir = new File(imgPath+"/img/brand");				
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File file = new File(dir.getAbsolutePath()
						+ File.separator + brandName+".png");
				BufferedOutputStream bos = new BufferedOutputStream(
						new FileOutputStream(file));
				bos.write(bytes);
				bos.close();

				log.info("Server File Location=" + file.getAbsolutePath());
				brand.setBrandImg("img/brand/" + brandName+".png");

				System.out.println("Successfully uploaded file=" + brandName);
			} catch (IOException e) {
				System.out.println("Failed to upload " + brandName + " => " + e.getMessage());
			}
		} else {
			System.out.println("Failed to upload " + brandName + " because the file was empty.");
		}
		brandService.insert(brand);
		return brand;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Brand update(@RequestPart("brand") Brand brand, 
			@RequestPart(value="brandImgFile") List<MultipartFile> brandImgFiles){
		if(!brandImgFiles.isEmpty()){
			MultipartFile brandImgFile = brandImgFiles.get(0);
			String brandName = brand.getBrandName();
			
			if(!brandImgFile.isEmpty()){
				try {
					byte[] bytes = brandImgFile.getBytes();
					File dir = new File(imgPath+"/img/brand");
					if(!dir.exists()){
						dir.mkdirs();
					}
									
					File file = new File(dir.getAbsolutePath()
							+ File.separator + brandName+".png");
					FileOutputStream fos = new FileOutputStream(file);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					bos.write(bytes);
					bos.close();
					
					log.info("Server File Location=" + file.getAbsolutePath());
					brand.setBrandImg("img/brand/" + brandName+".png");
				} catch (IOException e) {
					System.out.println("Failed to upload " + brandName + " => " + e.getMessage());
					e.printStackTrace();
				}
				
			}else{
				System.out.println("Failed to upload " + brandName + " because the file was empty.");
			}
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
			// TODO Auto-generated catch block
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
