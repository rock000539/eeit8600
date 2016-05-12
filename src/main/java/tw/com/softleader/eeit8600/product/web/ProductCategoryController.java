package tw.com.softleader.eeit8600.product.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestAttributes;

import tw.com.softleader.eeit8600.product.entity.ProductCategory;
import tw.com.softleader.eeit8600.product.service.ProductCategoryService;

@Controller
@RequestMapping("/categories")
public class ProductCategoryController {

	@Autowired
	private ProductCategoryService categorySerivce;
	
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
		model.addAttribute("categories",categorySerivce.getById(id));
		return "/category/categoryEdit";
	}
	
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(@RequestParam Long id,@RequestParam String kind,@RequestParam Double level,Model model,RequestAttributes attr){
		
		Map<String,String> errorMsg =verifyData(kind,level);
		if(!errorMsg.isEmpty()){
			model.addAttribute("errorMsg",errorMsg);
			model.addAttribute("result","Fail");
			return "forword:/categories/edit?id="+id;
		}
		
		ProductCategory productCategory=new ProductCategory();
		productCategory.setId(id);
		productCategory.setKind(kind);
		productCategory.setLevel(level);
		
		categorySerivce.update(productCategory);
		
		
		return "";
	}

	private Map<String, String> verifyData(String kind, Double level) {

		Map<String,String> errorMsg=new HashMap<String,String>();
		if(kind == null || kind.trim().length()==0){
			errorMsg.put("kindError", "請輸入種類欄位");
		}
		if(level == null){
			errorMsg.put("levelError", "請輸入權重欄位");
		}
		return errorMsg;
	}
	
	
}
