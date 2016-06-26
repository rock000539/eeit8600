package tw.com.softleader.eeit8600.product.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tw.com.softleader.eeit8600.product.entity.Category;
import tw.com.softleader.eeit8600.product.service.CategoryService;

@Controller
@RequestMapping("/categories")
public class CategoryController {

	@Autowired
	private CategoryService categorySerivce;
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("categories", categorySerivce.getAll());
		
		return "/category/categoryList";
	}
	
	@RequestMapping("/delete")
	public String delete(Long id,Model model){
		categorySerivce.delete(id);
		return "redirect:/categories/list";
	}
	
	@RequestMapping("/edit")
	public String editPage(@RequestParam Long id,Model model){
		model.addAttribute("category",categorySerivce.getById(id));
		return "/category/categoryEdit";
	}
	
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> update(@RequestBody Category productCategory){
		
		// 接收資料
		String[] data={
			productCategory.getKind(),
			productCategory.getLevel().toString()
		};
		
		// 驗證資料
		Map<String,String> errorMsg =verifyData(data);
		if(!errorMsg.isEmpty()){

			return errorMsg;
		}
		
		// 轉換並封裝資料
		Category temp=new Category();
		temp.setId(productCategory.getId());
		temp.setKind(productCategory.getKind());
		temp.setLevel(productCategory.getLevel());
		
		// 更新到資料庫
		categorySerivce.update(productCategory);
		
		// 傳回成功的相關訊息
		Map<String,String> successMsg= new HashMap<>();
		successMsg.put("id", temp.getId().toString());
		successMsg.put("kind", temp.getKind());
		successMsg.put("level", temp.getLevel().toString());
	
		return successMsg;
	}


	private Map<String, String> verifyData(String data[]) {
		Map<String,String> errorMsg=new HashMap<String,String>();
		if(data[0] == null || data[0].trim().length()==0){
			errorMsg.put("kindError", "請輸入種類欄位");
		}
		try {
			Double.parseDouble(data[1]);
		} catch (NumberFormatException e) {
			errorMsg.put("levelError", "請輸入正確的權重(不可空白或非數字)");
		}

		return errorMsg;
	}
	
	@RequestMapping("/add")
	public String addPage(){
		return "/category/categoryAdd";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> insert(@RequestBody Category productCategory){
		
		// 接收資料
		String[] data={
				productCategory.getKind(),
				productCategory.getLevel().toString()
		};
				
		// 驗證資料
		Map<String,String> errorMsg=verifyData(data);
		if(!errorMsg.isEmpty()){ // 傳回失敗的相關訊息
			errorMsg.put("result", "Fail");
			return errorMsg;
		}
		
		// 轉換並封裝資料
		Category temp=new Category();
		temp.setKind(productCategory.getKind());
		temp.setLevel(productCategory.getLevel());
		
		// 新增到資料庫
		categorySerivce.insert(productCategory);
		
		// 傳回成功的相關訊息
		Map<String, String> successMsg = new HashMap<>();
		successMsg.put("id",temp.getId().toString());
		successMsg.put("kind", temp.getKind());
		successMsg.put("level", temp.getLevel().toString());
		
		
		return successMsg;
	}

}
