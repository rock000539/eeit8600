package tw.com.softleader.eeit8600.product.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.eeit8600.product.entity.Brand;
import tw.com.softleader.eeit8600.product.service.BrandService;

@Controller
@RequestMapping("/brands")
public class BrandController {
	
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
	public Brand insert(@RequestBody Brand brand){	
		brandService.insert(brand);
//		String[] data = {
//				productbrand.getBrandName(),
//				productbrand.getWebsite(),
//				productbrand.getBcFunc()
//		};
//		
//		brandService.insert(productbrand);
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

}
