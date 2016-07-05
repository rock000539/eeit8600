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
import tw.com.queautiful.product.entity.Brand;
import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.entity.Review;
import tw.com.queautiful.product.service.MemberService;
import tw.com.queautiful.product.service.ProductService;
import tw.com.queautiful.product.service.ReviewService;

@Controller
@RequestMapping("/reviews")
public class ReviewController {
	
	private Logger log=LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ReviewService service;
	
	@Autowired
	private ProductService prodService;
	
	@Autowired
	private MemberService memberService;
	
	// 提供jqGrid抓取資料使用
	@RequestMapping("/select_jqgrid")
	@ResponseBody
	public Page<Review> select(@RequestParam(required = false) Integer page,
			@RequestParam(required = false) Integer rows) {

		log.debug("page = {}", page);
		log.debug("rows = {}", rows);

		Pageable pageable = new PageRequest(page - 1, rows);
		Page<Review> reviewPage = service.getAll(pageable);
	
		log.debug("getSize = {}", reviewPage.getSize()); // 列數(資料筆數)
		log.debug("getNumber = {}", reviewPage.getNumber()); // 頁數-1
		log.debug("getTotalPages() = {}", reviewPage.getTotalPages()); // 總共幾頁
		log.debug("getTotalElements = {}", reviewPage.getTotalElements()); // 全部有幾筆資料
		log.debug("getNumberOfElements = {}", reviewPage.getNumberOfElements()); // 列數(資料筆數)
		log.debug("----------------------------------------------------------"); // 測試

		return reviewPage;
	}
	
	@RequestMapping("/list")  // original + boostrap
	public String listPage(Model model){
		model.addAttribute("reviews", service.getAll());
		return "/review/reviewList";
	}
	
	@RequestMapping("/listoriginal")
	public String listOriginal(Model model){
		model.addAttribute("reviews", service.getAll());
		return "/review/reviewListOriginal";
	}
	
	@RequestMapping("/listgrid")
	public String listGrid(){
		return "/review/reviewListGrid";
	}
	
	@RequestMapping("/reviews")
	public String testBoostrap(Model model){
//		model.addAttribute("produts", prodService.getAll());
		model.addAttribute("reviews", service.getAll());
//		model.addAttribute("members", memberService.getAll());
		return "/review/reviews";
	}
	
//	@RequestMapping("/delete")
//	public String delete(@RequestParam Long reviewId){
//		service.delete(reviewId);
//		return "redirect:/reviews/list";
//	}
	
	@RequestMapping(value="delete",method=RequestMethod.POST)
	@ResponseBody	
	public void delete(@RequestBody Review review){
		service.delete(review.getReviewId());
		
	}
	
	@RequestMapping("/edit")
	public String editPage(@RequestParam Long reviewId,Model model){
		model.addAttribute("review", service.getById(reviewId));
		return "/review/reviewEdit";
	}
	
	@RequestMapping("/editgrid")
	public String editPageGrid(@RequestParam Long reviewId,Model model){
		model.addAttribute("review", service.getById(reviewId));
		return "/review/reviewEditGrid";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public Review update(@RequestPart("review") Review review,
			@RequestPart(value = "reviewImgFile", required = false) MultipartFile reviewImgFile) {
		//FK設定
		review.setProduct(prodService.getById(review.getProdId()));
		
		//判斷是否有傳入圖片
		if (reviewImgFile != null) {
			//取得品牌名稱當作檔名
			String reviewTitle = review.getReviewTitle();
			
			//存圖片-->直接使用FileProcessing檔的saveImg方法
			//傳入參數:1.imgName(檔名), 2.folderName(資料夾名稱), 3.MultipartFile
			//傳回檔案儲存的路徑
			String reviewImg = FileProcessing.saveImg(reviewTitle, "brand", reviewImgFile);
			
			//將檔案路徑存成Entity的屬性
			review.setReviewImg(reviewImg);
		}
		
		service.update(review);
		return review;
		
				
	}

	
	@RequestMapping("/add")
	public String addPage(){
		return"/review/reviewAdd";
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public Review insert(@RequestPart("review") Review review, 
			@RequestPart("reviewImgFile") MultipartFile reviewImgFile){
		
		//FK設定
		review.setProduct(prodService.getById(review.getProdId()));
		
		
		//取得品牌名稱當作檔名
		String reviewTitle = review.getReviewTitle();
		
		//存圖片-->直接使用FileProcessing檔的saveImg方法
		//傳入參數:1.imgName(檔名), 2.folderName(資料夾名稱), 3.MultipartFile
		//傳回檔案儲存的路徑
		String reviewImg = FileProcessing.saveImg(reviewTitle, "review", reviewImgFile);
		
		//將檔案路徑存成Entity的屬性
		review.setReviewImg(reviewImg);
		
		service.insert(review);
		return review;
	}
	
	// 提供一般抓取資料使用
	@RequestMapping("/select")
	@ResponseBody
	public List<Review> select() {
		return service.getAll();
	}
	
	@RequestMapping("/show")
	public void show(HttpServletResponse resp, @RequestParam Long reviewId) {
		Review review = service.getById(reviewId);
		
		//取得檔案路徑
		String reviewImg = review.getReviewImg();
		
		//在網頁中顯示圖片-->直接使用FileProcessing檔的showImg方法
		//傳入參數:1.HttpServletResponse, 2.檔案路徑
		FileProcessing.showImg(resp, reviewImg);
	}
}
