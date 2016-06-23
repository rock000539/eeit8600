package tw.com.queautiful.product.web;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.com.queautiful.commons.util.FileProcessing;
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

	// 提供一般抓取資料使用
	@RequestMapping("/select")
	@ResponseBody
	public List<Product> select() {
		return service.getAll();
	}

	// 提供jqGrid抓取資料使用
	@RequestMapping("/select_jqgrid")
	@ResponseBody
	public Page<Product> select(@RequestParam(required = false) Integer page,
			@RequestParam(required = false) Integer rows) {

		log.debug("page = {}", page);
		log.debug("rows = {}", rows);

		Pageable pageable = new PageRequest(page - 1, rows);
		Page<Product> prodPage = service.getAll(pageable);

		log.debug("getSize = {}", prodPage.getSize()); // 列數(資料筆數)
		log.debug("getNumber = {}", prodPage.getNumber()); // 頁數-1
		log.debug("getTotalPages() = {}", prodPage.getTotalPages()); // 總共幾頁
		log.debug("getTotalElements = {}", prodPage.getTotalElements()); // 全部有幾筆資料
		log.debug("getNumberOfElements = {}", prodPage.getNumberOfElements()); // 列數(資料筆數)
		log.debug("----------------------------------------------------------"); // 測試

		return prodPage;
	}

	@RequestMapping("/add")
	public String addPage() {
		return "/product/productAdd";
	}

//	@RequestMapping(value = "/insert", method = RequestMethod.POST)
//	@ResponseBody
//	public Product insert(@RequestBody Product product) {
//		service.insert(product);
//		return product;
//	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	public Product insert(@RequestPart Product product, @RequestPart MultipartFile prodImgFile) {
		String prodName = product.getProdName();
		String prodImg = FileProcessing.saveImg(prodName, "product", prodImgFile);
		product.setProdImg(prodImg);
		service.insert(product);
		return product;
	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam Long prodId, Model model) {
		model.addAttribute("product", service.getById(prodId));
		return "/product/productEdit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Product update(@RequestBody Product product) {
		service.update(product);
		return product;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public void delete(@RequestBody Product product) {
		service.delete(product.getProdId());
	}
	
	@RequestMapping("/show")
	public void show(HttpServletResponse resp, @RequestParam Long prodId) {
		String prodImg = service.getById(prodId).getProdImg();
		FileProcessing.showImg(resp, prodImg);
	}

}
