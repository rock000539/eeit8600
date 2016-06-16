package tw.com.queautiful.product.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.service.ProductService;

@Controller
@RequestMapping("/products")
public class ProductController {

	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ProductService service;

	@RequestMapping("/list")
	public String listPage() {
		return "/product/productList";
	}

	@RequestMapping("/select")
	@ResponseBody
	public List<Product> select(@RequestParam Integer page, @RequestParam Integer rows) {
		
		// slf4j
		log.debug("{}", "page = " + page);
		log.debug("{}", "rows = " + rows);

		Pageable pageable = new PageRequest(page - 1, rows);
		Page<Product> prodPage = service.getAll(pageable);
		return prodPage.getContent();
	}
	
	@RequestMapping("/add")
	public String addPage() {
		return "/product/productAdd";
	}

	@RequestMapping("/insert")
	@ResponseBody
	public Product insert(@RequestBody Product product) {
		service.insert(product);
		return product;
	}
	
	@RequestMapping("/edit")
	public String editPage() {
		return "/product/productEdit";
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Product update(@RequestBody Product product) {
		service.update(product);
		return product;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public String delete(@RequestBody Product product) {
		service.delete(product.getProdId());
		return "Success";
	}
}
