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

import tw.com.queautiful.product.entity.ArticleReply;
import tw.com.queautiful.product.service.ArticleReplyService;
import tw.com.queautiful.product.service.ArticleService;
import tw.com.queautiful.product.service.MemberService;

@Controller
@RequestMapping("/articlereplies")
public class ArticleReplyController {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ArticleReplyService service;
	
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("articleReplies",service.getAll());
		return"/articleReply/articleReplyList";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam Long arId){
		service.delete(arId);
		return"redirect:/articleReplies/list";
	}
	
	@RequestMapping("/add")
	public String addPage(){
		return"/articleReply/articleReplyAdd";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	@ResponseBody
	public ArticleReply insert(@RequestBody ArticleReply articleReply){
		articleReply.setArTime(new java.sql.Timestamp(System.currentTimeMillis()));
		
		articleReply.setMember(memberService.getById(articleReply.getMemberId()));
		articleReply.setArticle(articleService.getById(articleReply.getArticleId()));

		service.insert(articleReply);
		return articleReply;
	}
	
	@RequestMapping("/edit")
	public String editPage(@RequestParam Long arId,Model model){
		model.addAttribute("articleReply", service.getById(arId));
		return"/articleReply/articleReplyEdit";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public ArticleReply update(@RequestBody ArticleReply articleReply){
		service.update(articleReply);
		return articleReply;
	}
	
	// 提供一般抓取資料使用
	@RequestMapping("/select")
	@ResponseBody
	public List<ArticleReply> select() {
		return service.getAll();
	}
}
