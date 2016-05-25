package tw.com.softleader.eeit8600.product.web;

import java.sql.Blob;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.eeit8600.product.entity.ProductBrand;
import tw.com.softleader.eeit8600.product.service.ProductBrandService;

@Controller
@RequestMapping("/brands")
public class ProductBrandController {
	
	@Autowired
	private ProductBrandService brandService;
	
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
	public String insert(@RequestBody ProductBrand productbrand){	
		
		String[] data = {
				productbrand.getBrandName(),
				productbrand.getWebsite(),
				productbrand.getBcFunc()
		};
		
		brandService.insert(productbrand);
		return "redirect:/brands/list";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam Long brandId) {
		brandService.delete(brandId);
		return "redirect:/brands/list";
	}
	
	public Map<String,String> validate(String[] data){
		Map<String,String> errorMsg = new HashMap<String,String>();
		
		return null;
		
	}

}
