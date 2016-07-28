package tw.com.queautiful.product.web;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.com.queautiful.commons.util.FileProcessing;
import tw.com.queautiful.commons.util.Spec;
import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.entity.Review;
import tw.com.queautiful.product.service.BrandService;
import tw.com.queautiful.product.service.CategoryService;
import tw.com.queautiful.product.service.ProductService;
import tw.com.queautiful.product.vo.brand.BrandSearch;
import tw.com.queautiful.product.vo.category.CategorySearch;
import tw.com.queautiful.product.vo.product.ProductInventory;
import tw.com.queautiful.product.vo.product.ProductSearch;

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
	
	@Autowired
	private MessageSource messageSource;

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

	@RequestMapping("/list")
	public String listPage() {
		return "/product/productList";
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

		prodService.update(product);
		return product;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public void delete(@RequestBody Product product) {
		prodService.delete(product.getProdId());
	}

	@RequestMapping("/show")
	public void show(HttpServletResponse resp, @RequestParam String prodImg) {
		if (prodImg != null) {
			FileProcessing.showImg(resp, prodImg);
		}
	}

	@RequestMapping("/search")
	public String searchPage(Model model) {

		// 類別
		List<CategorySearch> categories = categoryService.getAllByVoSearch();
		model.addAttribute("categories", categories);

		// 品牌
		List<BrandSearch> brands = brandService.getAllByVoSearch();
		model.addAttribute("brands", brands);

		return "/product/productSearch";
	}

	@RequestMapping("/search/{brandId}")
	@ResponseBody
	public List<ProductSearch> searchByBrand(@PathVariable Long brandId) {
		return prodService.getAllByVoSearch(brandService.getById(brandId).getProducts());
	}
	
	@RequestMapping("/inventory")
	public String inventoryPage(
			@RequestParam(required = false, defaultValue = "list") String mode,
			@RequestParam(required = false) Long brandId,
			@RequestParam(required = false) Long categoryId, 
			Model model) {

		// 篩選條件
		Product filter = new Product();

		if (brandId != null) {
			filter.setBrand(brandService.getById(brandId));
			model.addAttribute("brandId", brandId);
		} else if (categoryId != null) {
			filter.setCategory(categoryService.getById(categoryId));
			model.addAttribute("categoryId", categoryId);
		}

		// 初始頁碼、每頁幾筆資料
		Pageable pageable = new PageRequest(0, 10);

		// 查詢資料
		Page<Product> pages = prodService.getAll(Spec.byAuto(entityManager, filter), pageable);
		
		// Copy需要送到前端的資料
		List<ProductInventory> products = prodService.getAllByVoInventory(pages.getContent());
		model.addAttribute("products", products);
		
		// list模式下總共幾頁
		model.addAttribute("mode", "list");
		model.addAttribute("totalPage", pages.getTotalPages());

		return "/product/productInventory";
	}

	@RequestMapping("/inventory_data")
	@ResponseBody
	public Map<String, Object> listData(
			@RequestParam(required = false) String mode,
			@RequestParam(required = false) Long brandId,
			@RequestParam(required = false) Long categoryId, 
			@RequestParam(required = false) Integer page, 
			@RequestParam(required = false) Integer rows) {

		log.debug("brandId = {}", brandId);
		log.debug("categoryId = {}", categoryId);
		log.debug("page = {}", page);
		log.debug("rows = {}", rows);
		
		// 頁碼、每頁幾筆資料
		Pageable pageable = new PageRequest(page - 1, rows);

		// 篩選條件
		Product filter = new Product();

		// 設定條件
		Page<Product> pages = null;
		if (brandId != null) {
			filter.setBrand(brandService.getById(brandId));
			pages = prodService.getAll(Spec.byAuto(entityManager, filter), pageable);
		} else if (categoryId != null) {
			filter.setCategory(categoryService.getById(categoryId));
			pages = prodService.getAll(Spec.byAuto(entityManager, filter), pageable);
		} else {
			pages = prodService.getAll(pageable);
		}
		
		// Copy需要送到前端的資料
		List<ProductInventory> products = prodService.getAllByVoInventory(pages.getContent());
		
		Map<String, Object> data = new HashMap<>();
		//data.put("mode", mode);
		//data.put("brandId", brandId);
		//data.put("categoryId", categoryId);
		//data.put("page", page);
		//data.put("rows", rows);
		data.put("totalPage", pages.getTotalPages());
		data.put("products", products);
		
		return data;
	}

	@RequestMapping("/view/{prodId}")
	public String viewPage(@PathVariable Long prodId, Model model) {
		
		Product product = prodService.getById(prodId);
		
		List<Review> reviews = product.getReviews();
		int[] ages = prodService.calcAges(reviews); 
		int[] stars = prodService.calcStars(reviews);
		
		model.addAttribute("size", reviews.size());
		model.addAttribute("ages", ages);
		model.addAttribute("stars", stars);
		model.addAttribute("product", prodService.getByIdByVoView(prodId));
		return "/product/productView";
	}

	@RequestMapping("/login")
	public String loginPage(Model model) {
		return "/product/login";
	}
	
	@RequestMapping("/i18n")
	@ResponseBody
	public String getMessage() {
		Locale locale = LocaleContextHolder.getLocale();
		String msg = messageSource.getMessage("home", null, locale);
		log.debug("msg = {}", msg);
		return msg;
	} 

}
