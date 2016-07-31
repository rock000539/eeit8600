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

import tw.com.queautiful.product.entity.ArticleRCM;
import tw.com.queautiful.product.service.ArticleRCMService;
import tw.com.queautiful.product.service.ArticleReplyService;
import tw.com.queautiful.product.service.MemberService;

@Controller
@RequestMapping("/articleRCMs")
public class ArticleRCMController {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ArticleRCMService service;
	
	@Autowired
	private ArticleReplyService articleReplyService;
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("articleRCMs",service.getAll());
		return"/articleRCM/articleRCMList";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam Long arcmId){
		service.delete(arcmId);
		return"redirect:/articleRCMs/list";
	}
	
	@RequestMapping("/add")
	public String addPage(){
		return"/articleRCM/articleRCMAdd";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	@ResponseBody
	public ArticleRCM insert(@RequestBody ArticleRCM articleRCM){
		articleRCM.setArcmTime(new java.sql.Timestamp(System.currentTimeMillis()));
		
		articleRCM.setMember(memberService.getById(articleRCM.getMemberId()));
		articleRCM.setArticleReply(articleReplyService.getById(articleRCM.getArId()));
		log.debug("{}",articleRCM);
		service.insert(articleRCM);
		return articleRCM;
	}
	
	@RequestMapping("/edit")
	public String editPage(@RequestParam Long acmId,Model model){
		model.addAttribute("articleRCM", service.getById(acmId));
		return"/articleRCM/articleRCMEdit";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public ArticleRCM update(@RequestBody ArticleRCM articleRCM){
		service.update(articleRCM);
		return articleRCM;
	}
	
	// 提供一般抓取資料使用
	@RequestMapping("/select")
	@ResponseBody
	public List<ArticleRCM> select() {
		return service.getAll();
	}
}
