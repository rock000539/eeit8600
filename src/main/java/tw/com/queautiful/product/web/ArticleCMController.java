package tw.com.queautiful.product.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import tw.com.queautiful.product.service.ArticleService;
import tw.com.queautiful.product.service.MemberService;

@Controller
@RequestMapping("/articleCMs")
public class ArticleCMController {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ArticleCMService service;
	
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private MemberService memberService;
	
	
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
		articleCM.setAcmTime(new java.sql.Timestamp(System.currentTimeMillis()));
		
		articleCM.setMember(memberService.getById(articleCM.getMemberId()));
		articleCM.setArticle(articleService.getById(articleCM.getArticleId()));
		log.debug("{}",articleCM);
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
	
	// 提供一般抓取資料使用
	@RequestMapping("/select")
	@ResponseBody
	public List<ArticleCM> select() {
		return service.getAll();
	}
}
