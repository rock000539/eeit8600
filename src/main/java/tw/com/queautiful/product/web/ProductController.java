package tw.com.queautiful.product.web;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

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
import tw.com.queautiful.commons.util.Spec;
import tw.com.queautiful.product.entity.Brand;
import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.service.BrandService;
import tw.com.queautiful.product.service.CategoryService;
import tw.com.queautiful.product.service.ProductService;

@Controller
@RequestMapping("/products")
public class ProductController {

	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ProductService prodService;

	@Autowired
	private BrandService brandService;

	@Autowired
	private CategoryService categoryService;

	@PersistenceContext
	private EntityManager entityManager;

	@RequestMapping("/list")
	public String listPage() {
		return "/product/productList";
	}

	// 提供一般抓取資料使用
	@RequestMapping("/select")
	@ResponseBody
	public List<Product> select() {
		return prodService.getAll();
	}

	// 提供jqGrid抓取資料使用
	@RequestMapping("/select_jqgrid")
	@ResponseBody
	public Page<Product> select(@RequestParam(required = false) Integer page,
			@RequestParam(required = false) Integer rows) {

		log.debug("page = {}", page);
		log.debug("rows = {}", rows);

		Pageable pageable = new PageRequest(page - 1, rows);
		Page<Product> prodPage = prodService.getAll(pageable);

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

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	public Product insert(@RequestPart(required = false) Product product,
			@RequestPart(required = false) MultipartFile prodImgFile) {

		if (prodImgFile != null) {
			String prodName = product.getProdName();
			String prodImg = FileProcessing.saveImg(prodName, "product", prodImgFile);
			product.setProdImg(prodImg);
		}

		// FK設定
		product.setBrand(brandService.getById(product.getBrandId()));
		product.setCategory(categoryService.getById(product.getCategoryId()));

		log.debug("{}", product);

		prodService.insert(product);
		return product;
	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam Long prodId, Model model) {
		model.addAttribute("product", prodService.getById(prodId));
		return "/product/productEdit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Product update(@RequestPart(required = false) Product product,
			@RequestPart(required = false) MultipartFile prodImgFile) {

		if (prodImgFile != null) {
			String prodName = product.getProdName();
			String prodImg = FileProcessing.saveImg(prodName, "product", prodImgFile);
			product.setProdImg(prodImg);
		}

		// FK設定
		product.setBrand(brandService.getById(product.getBrandId()));
		product.setCategory(categoryService.getById(product.getCategoryId()));

		log.debug("{}", product);

		prodService.update(product);
		return product;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public void delete(@RequestBody Product product) {
		prodService.delete(product.getProdId());
	}

	@RequestMapping("/show")
	public void show(HttpServletResponse resp, @RequestParam Long prodId) {
		String prodImg = prodService.getById(prodId).getProdImg();
		if (prodImg != null) {
			FileProcessing.showImg(resp, prodImg);
		}
	}

	@RequestMapping("/searchbybrand")
	@ResponseBody
	public List<Product> searchByBrand(@RequestParam Long brandId) {
		Brand brand = brandService.getById(brandId);
		return brand.getProducts();
	}

	@RequestMapping("/select_fms")
	public String selectFmsPage(Model model) {
		model.addAttribute("categories", categoryService.getAll());
		return "/product/productSelectFms";
	}

	@RequestMapping("/list_fms")
	public String listFmsPage(@RequestParam(required = false) Long brandId,
			@RequestParam(required = false) Long categoryId, Model model) {

		log.debug("brandId = {}", brandId);
		log.debug("categoryId = {}", categoryId);

		// 篩選條件
		Product product = new Product();
		
		if (brandId != null) {
			product.setBrand(brandService.getById(brandId));
			model.addAttribute("brandId", brandId);
		} else if (categoryId != null) {
			product.setCategory(categoryService.getById(categoryId));
			model.addAttribute("categoryId", categoryId);
		}
		
		// 初始頁碼、每頁幾筆資料
		Pageable pageable = new PageRequest(0, 5);
		
		// 查詢資料
		Page<Product> pages = prodService.getAll(Spec.byAuto(entityManager, product), pageable);

		model.addAttribute("products", pages.getContent());
		model.addAttribute("totalPage", pages.getTotalPages());

		return "/product/productListFms";
	}

	@RequestMapping("/list_data")
	@ResponseBody
	public List<Product> listFmsData(@RequestParam(required = false) Long brandId,
			@RequestParam(required = false) Long categoryId, @RequestParam(required = false) Integer page,
			@RequestParam(required = false) Integer rows, Model model) {

		log.debug("brandId = {}", brandId);
		log.debug("categoryId = {}", categoryId);
		log.debug("page = {}", page);
		log.debug("rows = {}", rows);
		
		Product product = new Product();
		Pageable pageable = new PageRequest(page - 1, rows);

		Page<Product> pages = null;

		if (brandId != null) {
			product.setBrand(brandService.getById(brandId));
			pages = prodService.getAll(Spec.byAuto(entityManager, product), pageable);
		} else if (categoryId != null) {
			product.setCategory(categoryService.getById(categoryId));
			pages = prodService.getAll(Spec.byAuto(entityManager, product), pageable);
		} else {
			pages = prodService.getAll(pageable);
		}
		
		log.debug("pages.getContent = {}", pages.getContent());
		
		return pages.getContent();
	}

	@RequestMapping("/view_fms")
	public String viewFmsPage(@RequestParam(required = false) Long prodId, Model model) {
		log.debug("prodId = {}", prodId);
		Product product = prodService.getById(prodId);
		log.debug("{}", product);
		model.addAttribute("product", product);
		return "/product/productViewFms";
	}

	@RequestMapping("/rank_fms")
	public String rankFmsPage(Model model) {
		// model.addAttribute("products",
		// prodService.findTop10ByOrderByScoreDesc());
		return "/product/productRankFms";
	}

}
