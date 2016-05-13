package tw.com.softleader.eeit8600.product.web;

import java.sql.Blob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String insert(@RequestParam String brandName, @RequestParam Blob brandLogo
			//@RequestBody ProductBrand productbrand
			){
		ProductBrand productbrand = new ProductBrand();
		brandService.insert(productbrand);
		return "redirect:/brands/list";
	}
	
	

}
