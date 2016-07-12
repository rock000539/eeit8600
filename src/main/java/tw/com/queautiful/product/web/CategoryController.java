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
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.commons.util.FileProcessing;
import tw.com.queautiful.product.entity.Category;
import tw.com.queautiful.product.service.CategoryService;

@Controller
@RequestMapping("/categories")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("categories", categoryService.getAll());
		return "/category/categoryList";
	}
	
	// 提供一般抓取資料使用
	@RequestMapping("/select")
	@ResponseBody
	public List<Category> select() {
		return categoryService.getAll();
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam Long categoryId){
		categoryService.delete(categoryId);
		return "redirect:/categories/list";
	}
	
	@RequestMapping("/edit")
	public String editPage(@RequestParam Long categoryId,Model model){
		model.addAttribute("category",categoryService.getById(categoryId));
		return "/category/categoryEdit";
	}
	
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public Category update(@RequestBody Category category){
		categoryService.update(category);
		return category;
		/*	
		// 接收資料
		String[] data={
				category.getCategoryName(),
				category.getCategoryImg()
		};
		
		// 驗證資料
		Map<String,String> errorMsg =verifyData(data);
		if(!errorMsg.isEmpty()){

			return errorMsg;
		}
		
		// 轉換並封裝資料
		Category temp=new Category();
		temp.setCategoryId(category.getCategoryId());
		temp.setCategoryName(category.getCategoryName());
		temp.setCategoryImg(category.getCategoryImg());
		
		// 更新到資料庫
		service.update(category);
		
		// 傳回成功的相關訊息
		Map<String,String> successMsg= new HashMap<>();
		successMsg.put("id", temp.getCategoryId().toString());
		successMsg.put("kind", temp.getCategoryName());
		successMsg.put("level", temp.getCategoryImg());
	*/
	}


//	private Map<String, String> verifyData(String data[]) {
//		Map<String,String> errorMsg=new HashMap<String,String>();
//		if(data[0] == null || data[0].trim().length()==0){
//			errorMsg.put("kindError", "請輸入種類欄位");
//		}
//		try {
//			Double.parseDouble(data[1]);
//		} catch (NumberFormatException e) {
//			errorMsg.put("levelError", "請輸入正確的權重(不可空白或非數字)");
//		}
//
//		return errorMsg;
//	}
	
	@RequestMapping("/add")
	public String addPage(){
		return "/category/categoryAdd";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	@ResponseBody
	public Category insert(@RequestBody Category category){
		categoryService.insert(category);
		return category;
		/*	
		// 接收資料
		String[] data={
				category.getCategoryName(),
				category.getCategoryImg()
		};
				
		// 驗證資料
		Map<String,String> errorMsg=verifyData(data);
		if(!errorMsg.isEmpty()){ // 傳回失敗的相關訊息
			errorMsg.put("result", "Fail");
			return errorMsg;
		}
		
		// 轉換並封裝資料
		Category temp=new Category();
		temp.setCategoryName(category.getCategoryName());
		temp.setCategoryImg(category.getCategoryImg());
		
		// 新增到資料庫
		categorySerivce.insert(category);
		
		// 傳回成功的相關訊息
		Map<String, String> successMsg = new HashMap<>();
		successMsg.put("id",temp.getCategoryId().toString());
		successMsg.put("kind", temp.getCategoryName());
		successMsg.put("level", temp.getCategoryImg());
	*/	
	}
	
	@RequestMapping("/show")
	public void show(HttpServletResponse resp, @RequestParam Long categoryId) {
		String prodImg = categoryService.getById(categoryId).getCategoryImg();
		if(prodImg!=null) {
			FileProcessing.showImg(resp, prodImg);
		}
	}
	
}
