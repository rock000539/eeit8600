package tw.com.queautiful.product.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

		if (page != null && rows != null) {
			log.debug("{}", "page = " + page);
			log.debug("{}", "rows = " + rows);

			Pageable pageable = new PageRequest(page - 1, rows);
			Page<Product> prodPage = service.getAll(pageable);
			return prodPage.getContent();
		} else {
			return service.getAll();
		}
	}

	@RequestMapping("/add")
	public String addPage() {
		return "/product/productAdd";
	}

	@RequestMapping(value="/insert", method=RequestMethod.POST)
	@ResponseBody
	public Product insert(@RequestBody Product product) {
		service.insert(product);
		return product;
	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam Long prodId, Model model) {
		model.addAttribute("product", service.getById(prodId));
		return "/product/productEdit";
	}

	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseBody
	public Product update(@RequestBody Product product) {
		service.update(product);
		return product;
	}

	@RequestMapping(value="/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(@RequestBody Product product) {
		service.delete(product.getProdId());
		return "Success";
	}
}
