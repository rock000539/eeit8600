package tw.com.queautiful.product.web;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
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
import tw.com.queautiful.product.entity.Category;
import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.service.BrandService;
import tw.com.queautiful.product.service.CategoryService;
import tw.com.queautiful.product.service.ProductService;
import tw.com.queautiful.product.vo.brand.BrandSearch;
import tw.com.queautiful.product.vo.category.CategorySearch;
import tw.com.queautiful.product.vo.product.ProductInventory;
import tw.com.queautiful.product.vo.product.ProductSearch;
import tw.com.queautiful.product.vo.product.ProductView;

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
	public void show(HttpServletResponse resp, @RequestParam String prodImg) {
		if (prodImg != null) {
			FileProcessing.showImg(resp, prodImg);
		}
	}

	@RequestMapping("/search")
	public String searchPage(Model model) {

		// 類別
		List<Category> c_list = categoryService.getAll();
		List<CategorySearch> categories = new ArrayList<>();
		CategorySearch category = null;
		for (Category tmp : c_list) {
			category = new CategorySearch();
			BeanUtils.copyProperties(tmp, category);
			categories.add(category);
		}

		// 品牌
		List<Brand> b_list = brandService.getAll();
		List<BrandSearch> brands = new ArrayList<>();
		BrandSearch brand = null;
		for (Brand tmp : b_list) {
			brand = new BrandSearch();
			BeanUtils.copyProperties(tmp, brand);
			brands.add(brand);
		}

		model.addAttribute("categories", categories);
		model.addAttribute("brands", brands);
		return "/product/productSearch";
	}

	@RequestMapping("/searchbybrand")
	@ResponseBody
	public List<ProductSearch> searchByBrand(@RequestParam Long brandId) {
		List<Product> p_list = brandService.getById(brandId).getProducts();
		List<ProductSearch> products = new ArrayList<>();
		ProductSearch product = null;
		for(Product tmp : p_list) {
			product = new ProductSearch();
			BeanUtils.copyProperties(tmp, product);
			products.add(product);
		}
		return products;
	}

	@RequestMapping("/inventory")
	public String inventoryPage(@RequestParam(required = false) Long brandId,
			@RequestParam(required = false) Long categoryId, Model model) {

		log.debug("brandId = {}", brandId);
		log.debug("categoryId = {}", categoryId);

		// 篩選條件
		Product filter = new Product();

		if (brandId != null) {
			log.debug("brand");
			filter.setBrand(brandService.getById(brandId));
			model.addAttribute("brandId", brandId);
		} else if (categoryId != null) {
			log.debug("category");
			filter.setCategory(categoryService.getById(categoryId));
			model.addAttribute("categoryId", categoryId);
		}

		// 初始頁碼、每頁幾筆資料
		Pageable pageable = new PageRequest(0, 10);

		// 查詢資料
		Page<Product> pages = prodService.getAll(Spec.byAuto(entityManager, filter), pageable);
		
		// Copy需要送到前端的資料
		List<Product> p_list = pages.getContent();
		List<ProductInventory> products = new ArrayList<>();
		ProductInventory product = null;
		for(Product tmp : p_list) {
			product = new ProductInventory();
			BeanUtils.copyProperties(tmp, product);
			product.setrSize(tmp.getReviews().size());
			products.add(product);
		}
		model.addAttribute("products", products);
		
		// 總共幾頁
		model.addAttribute("totalPage", pages.getTotalPages());

		return "/product/productInventory";
	}

	@RequestMapping("/list_data")
	@ResponseBody
	public List<ProductInventory> listData(@RequestParam(required = false) Long brandId,
			@RequestParam(required = false) Long categoryId, @RequestParam(required = false) Integer page,
			@RequestParam(required = false) Integer rows, Model model) {

		log.debug("brandId = {}", brandId);
		log.debug("categoryId = {}", categoryId);
		log.debug("page = {}", page);
		log.debug("rows = {}", rows);
		
		// 篩選條件
		Product filter = new Product();
		
		// 頁碼、每頁幾筆資料
		Pageable pageable = new PageRequest(page - 1, rows);

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
		List<Product> p_list = pages.getContent();
		List<ProductInventory> products = new ArrayList<>();
		ProductInventory product = null;
		for(Product tmp : p_list) {
			product = new ProductInventory();
			BeanUtils.copyProperties(tmp, product);
			product.setrSize(tmp.getReviews().size());
			products.add(product);
		}

		return products;
	}

	@RequestMapping("/view")
	public String viewPage(@RequestParam(required = false) Long prodId, Model model) {
		ProductView bean = new ProductView();
		BeanUtils.copyProperties(prodService.getById(prodId), bean);
		model.addAttribute("product", bean);
		return "/product/productView";
	}

	@RequestMapping("/login")
	public String rankPage(Model model) {
		return "/product/login";
	}

}
