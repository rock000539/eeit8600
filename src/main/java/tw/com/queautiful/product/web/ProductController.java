package tw.com.queautiful.product.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.service.ProductService;

@Controller
@RequestMapping("/products")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@RequestMapping("/list")
	public String listPage(){
		return "/product/productList";
	}
	
	@RequestMapping("/select")
	@ResponseBody
	public List<Product> select(){
		List<Product> list = service.getAll();
		return list;
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public Product insert(@RequestBody Product product) {
		service.insert(product);
		return product;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Product update(@RequestBody Product product){
		service.update(product);
		return product;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(@RequestBody Product product){
		service.delete(product.getProdId());
		return "Success";
	}
}
