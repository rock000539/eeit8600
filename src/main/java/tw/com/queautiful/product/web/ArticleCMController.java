package tw.com.queautiful.product.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.product.entity.ArticleCM;
import tw.com.queautiful.product.service.ArticleCMService;

@Controller
@RequestMapping("/articleCMs")
public class ArticleCMController {

	@Autowired
	private ArticleCMService service;
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("articleCMs",service.getAll());
		return"/articleCM/articleCMList";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam Long acmId){
		service.delete(acmId);
		return"redirect:/articleCMs/list";
	}
	
	@RequestMapping("/add")
	public String addPage(){
		return"/articleCM/articleCMAdd";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	@ResponseBody
	public ArticleCM insert(@RequestBody ArticleCM articleCM){
		service.insert(articleCM);
		return articleCM;
	}
	
	@RequestMapping("/edit")
	public String editPage(@RequestParam Long acmId,Model model){
		model.addAttribute("articleCM", service.getById(acmId));
		return"/articleCM/articleCMEdit";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public ArticleCM update(@RequestBody ArticleCM articleCM){
		service.update(articleCM);
		return articleCM;
	}
}
