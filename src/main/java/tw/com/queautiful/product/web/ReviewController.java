package tw.com.queautiful.product.web;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;

import org.aspectj.lang.reflect.MemberSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.com.queautiful.commons.util.FileProcessing;
import tw.com.queautiful.product.entity.Brand;
import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.entity.Review;
import tw.com.queautiful.product.service.MemberService;
import tw.com.queautiful.product.service.ProductService;
import tw.com.queautiful.product.service.ReviewService;

@Controller
@RequestMapping("/reviews")
public class ReviewController {

	private Logger log = LoggerFactory.getLogger(this.getClass());

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

	@RequestMapping("/list")
	// original + boostrap
	public String listPage(Model model) {
		model.addAttribute("reviews", service.getAll());
		return "/review/reviewList";
	}

	@RequestMapping("/listoriginal")
	public String listOriginal(Model model) {
		model.addAttribute("reviews", service.getAll());
		return "/review/reviewListOriginal";
	}

	@RequestMapping("/listgrid")
	public String listGrid() {
		return "/review/reviewListGrid";
	}

	@RequestMapping("/reviews")
	public String reviews(Model model) throws ParseException {
		
		List<Review> list = service.getAll();
		model.addAttribute("reviews", list);
		log.debug("{}", list);
//		 model.addAttribute("reviews", service.findByOrderByReviewTimeDesc());
		 
		//會員年齡
//		String y = service.getAll().get ).getMember().getBirthDay().toString();
//		log.debug("birthday={}",y);
		for(int i=0; i<list.size(); i++){
			Integer age = memberService.getMemberAge(list.get(i).getMember().getBirthDay());
			log.debug("x={}",age);
			list.get(i).getMember().setAge(age);
		}
		
		return "/review/reviews";
	}

	@RequestMapping("/review")
	public String review(Model model) {
		model.addAttribute("review", service.getAll());
		return "/review/review";
	}

	@RequestMapping("/reviewjQueryRain")
	public String reviewjQueryRain(Model model) throws ParseException {
		Review review = service.getById(1L);
		log.debug("{}", review);
		model.addAttribute("review", review);

		// 得到英文月份
		Date temp = review.getReviewTime();
		log.debug("{}", temp);
		// 準備輸出的格式，如：Jun,18,16
		SimpleDateFormat sdf = new SimpleDateFormat("MMM,d,yy", Locale.US);
		// 利用 DateFormat 來parse 日期的字串
		DateFormat df = DateFormat.getDateInstance();
		String reviewTime = temp.toString();
		java.util.Date date = df.parse(reviewTime.replace("-", "/"));
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		log.debug("{}", sdf.format(calendar.getTime()));
		log.debug("{}", sdf.format(calendar.getTime()).substring(0, 3));
		log.debug("{}", sdf.format(calendar.getTime()).substring(4, 6));
		
		String month = sdf.format(calendar.getTime()).substring(0, 3);
		String day = sdf.format(calendar.getTime()).substring(4, 6);
		model.addAttribute("month",month);
		model.addAttribute("day",day);
		
		return "/review/reviewjQueryRain";
	}

	// @RequestMapping("/delete")
	// public String delete(@RequestParam Long reviewId){
	// service.delete(reviewId);
	// return "redirect:/reviews/list";
	// }

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public void delete(@RequestBody Review review) {
		service.delete(review.getReviewId());

	}

	@RequestMapping("/edit")
	public String editPage(@RequestPart Long reviewId, Model model) {
		model.addAttribute("review", service.getById(reviewId));
		return "/review/reviewEdit";
	}

	@RequestMapping("/editgrid")
	public String editPageGrid(@RequestParam Long reviewId, Model model) { // @RequestParam
																			// 類似getParameter
		model.addAttribute("review", service.getById(reviewId));
		return "/review/reviewEditGrid";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	// 傳回json字串
	public Review update(
			@RequestPart("review") Review review, // @RequestPart類似RequestParam
													// ,
			@RequestPart(value = "reviewImgFile", required = false) MultipartFile reviewImgFile) {
		// FK設定
		review.setProduct(prodService.getById(review.getProdId()));
		review.setMember(memberService.getById(review.getMemberId()));
		
		// 判斷是否有傳入圖片
		if (reviewImgFile != null) {
			// 取得品牌名稱當作檔名
			String reviewTitle = review.getReviewTitle();

			// 存圖片-->直接使用FileProcessing檔的saveImg方法
			// 傳入參數:1.imgName(檔名), 2.folderName(資料夾名稱), 3.MultipartFile
			// 傳回檔案儲存的路徑
			String reviewImg = FileProcessing.saveImg(reviewTitle, "brand",
					reviewImgFile);

			// 將檔案路徑存成Entity的屬性
			review.setReviewImg(reviewImg);
		}

		service.update(review);
		return review;

	}

	@RequestMapping("/add")
	public String addPage() {
		return "/review/reviewAdd";
	}

	@RequestMapping("/insert")
	@ResponseBody
	public Review insert(@RequestPart("review") Review review,
			@RequestPart("reviewImgFile") MultipartFile reviewImgFile) {

		// FK設定
		review.setProduct(prodService.getById(review.getProdId()));
		review.setMember(memberService.getById(review.getMemberId()));

		// 取得品牌名稱當作檔名
		String reviewTitle = review.getReviewTitle();

		// 存圖片-->直接使用FileProcessing檔的saveImg方法
		// 傳入參數:1.imgName(檔名), 2.folderName(資料夾名稱), 3.MultipartFile
		// 傳回檔案儲存的路徑
		String reviewImg = FileProcessing.saveImg(reviewTitle, "review",
				reviewImgFile);

		// 將檔案路徑存成Entity的屬性
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

		// 取得檔案路徑
		String reviewImg = review.getReviewImg();

		// 在網頁中顯示圖片-->直接使用FileProcessing檔的showImg方法
		// 傳入參數:1.HttpServletResponse, 2.檔案路徑
		FileProcessing.showImg(resp, reviewImg);
	}
}
