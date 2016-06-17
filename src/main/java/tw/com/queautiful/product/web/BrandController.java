package tw.com.queautiful.product.web;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
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
	public Brand insert(@RequestParam String brandName, 
			@RequestParam String website,
			@RequestParam String bcFunc,	
			@RequestPart MultipartFile brandImgFile){	
		//System.out.println(brand.getBrandImgFile());
		//System.out.println(brandImgFile);
		
		Brand brand=new Brand();
		brand.setBrandName(brandName);
		brand.setBcFunc(bcFunc);
		brand.setWebsite(website);
		
		if (!brandImgFile.isEmpty()) {
			try {
				byte[] bytes = brandImgFile.getBytes();

				// Creating the directory to store file
				//String rootPath = System.getProperty("catalina.home");
				//File dir = new File(rootPath + File.separator + "tmpFiles");
				File dir = new File("/brandimg");				
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + brandName+".png");
				BufferedOutputStream bos = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				bos.write(bytes);
				bos.close();

				log.info("Server File Location=" + serverFile.getAbsolutePath());
				brand.setBrandImg(dir.getAbsolutePath() + File.separator + brandName+".png");

				System.out.println("You successfully uploaded file=" + brandName);
			} catch (Exception e) {
				System.out.println("You failed to upload " + brandName + " => " + e.getMessage());
			}
		} else {
			System.out.println("You failed to upload " + brandName + " because the file was empty.");
		}
		
		
//		String[] data = {
//				productbrand.getBrandName(),
//				productbrand.getWebsite(),
//				productbrand.getBcFunc()
//		};
//		
//		brandService.insert(productbrand);
		brandService.insert(brand);
		return brand;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Brand update(@RequestBody Brand brand){
		brandService.update(brand);
		return brand;
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam Long brandId) {
		brandService.delete(brandId);
		return "redirect:/brands/list";
	}
	
	@RequestMapping("/show")
	public void show(HttpServletResponse  resp){
		try {
			ServletOutputStream out = resp.getOutputStream();
//			out.write(byte[]);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Map<String,String> validate(String[] data){
		Map<String,String> errorMsg = new HashMap<String,String>();
		
		return null;
		
	}
	
	//-------------------------------------------------------------------
	@RequestMapping("/add2")
	public String addPage2(){
		return "/brand/brandAdd2";
	}
	@RequestMapping("/add3")
	public String addPage3(){
		return "/brand/brandAdd3";
	}
//	@RequestMapping("/insert2")
//	@ResponseBody
//	public Brand insert2(@RequestBody Brand brand){	
//		System.out.println(brand.getBrandImgFile());
//		brandService.insert(brand);
//		return brand;
//	}
	
	@RequestMapping(value = "/insert2"
			//,method = RequestMethod.POST, consumes=MediaType.MULTIPART_FORM_DATA_VALUE, produces="application/json"
			)
	@ResponseBody
	public Brand insert2(@RequestParam("brandJsonStr") String brandJsonStr,
//			@RequestParam String brandName, 
//			@RequestParam String website,
//			@RequestParam String bcFunc,	
			@RequestPart("brandImgFile") MultipartFile brandImgFile
			){	
		//System.out.println(brand.getBrandImgFile());
		//System.out.println(brandImgFile);
		
//		Brand brand=new Brand();
//		brand.setBrandName(brandName);
//		brand.setBcFunc(bcFunc);
//		brand.setWebsite(website);
		System.out.println(brandJsonStr);
		System.out.println(brandImgFile);
		//String brandName = brand.getBrandName();
		ObjectMapper mapper = new ObjectMapper();
		Brand brand = null;
		try {
			brand = mapper.readValue(brandJsonStr, Brand.class);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		String brandName = brand.getBrandName();
		if (!brandImgFile.isEmpty()) {
			try {
				byte[] bytes = brandImgFile.getBytes();

				// Creating the directory to store file
				//String rootPath = System.getProperty("catalina.home");
				//File dir = new File(rootPath + File.separator + "tmpFiles");
				File dir = new File("D:/tmpFiles");				
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + brandName+".png");
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				log.info("Server File Location=" + serverFile.getAbsolutePath());
				//brand.setBrandImg(dir.getAbsolutePath() + File.separator + brandName+".png");

				System.out.println("You successfully uploaded file=" + brandName);
			} catch (Exception e) {
				System.out.println("You failed to upload " + brandName + " => " + e.getMessage());
			}
		} else {
			System.out.println("You failed to upload " + brandName + " because the file was empty.");
		}
		brandService.insert(brand);
		return brand;
	}
	
	
	//-------------------------------------------------------------------

}
