package tw.com.queautiful.product.web;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
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
import tw.com.queautiful.product.service.ReviewService;

@Controller
@RequestMapping("/reviews")
public class ReviewController {

	@Autowired
	private ReviewService service;
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("reviews", service.getAll());
		return "/review/reviewList";
	}
	
	@RequestMapping("/listgrid")
	public String listGridPage(Model model){
		model.addAttribute("reviews", service.getAll());
		return "/review/reviewListGrid";
	}
	
	@RequestMapping("/testboostrap")
	public String testBoostrap(Model model){
		model.addAttribute("reviews", service.getAll());
		return "/review/reviewTestBoostrap";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam Long reviewId){
		service.delete(reviewId);
		return "redirect:/reviews/list";
	}
	
	@RequestMapping("/edit")
	public String editPage(@RequestParam Long reviewId,Model model){
		model.addAttribute("review", service.getById(reviewId));
		return "/review/reviewEdit";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public Review update(@RequestPart("review") Review review,
			@RequestPart(value = "reviewImgFile", required = false) MultipartFile reviewImgFile) {
		
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
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	@ResponseBody
	public Review insert(@RequestBody Review review){
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
