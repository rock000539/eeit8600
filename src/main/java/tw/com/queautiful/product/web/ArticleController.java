package tw.com.queautiful.product.web;

import java.sql.Date;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.product.entity.Article;
import tw.com.queautiful.product.service.ArticleService;
import tw.com.queautiful.product.service.MemberService;

@Controller
@RequestMapping("/articles")
public class ArticleController {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ArticleService articleService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("articles", articleService.getAll());		
		return "/article/articleList";
	}
	
	@RequestMapping("/select")
	@ResponseBody
	public List<Article> select(){
		return articleService.getAll();
	}
	
	@RequestMapping("/select_jqgrid")
	@ResponseBody
	public Page<Article> select(@RequestParam(required=false) Integer page,
			@RequestParam(required=false) Integer rows){
		Pageable pageable= new PageRequest(page-1,rows);
		Page<Article> articlePage = articleService.getAll(pageable);
		return articlePage;
	}
	
	@RequestMapping("/add")
	public String addPage(){
		return "/article/articleAdd";
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public Article insert(@RequestBody Article article){
		article.setArticleTime(new Date(System.currentTimeMillis()));
		
		//insert FK : memberID 
//		Long memberId = 1L; //test
//		article.setMember(memberService.getById(memberId));

		log.debug("{}",article);
		article.setMember(memberService.getById(article.getMemberId()));
		articleService.insert(article);	
		return article;
	}
	
	@RequestMapping("/edit")
	public String editPage(@RequestParam Long articleId, Model model){
		model.addAttribute("article",articleService.getById(articleId));
		return "/article/articleEdit";
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Article update(@RequestBody Article article){
		log.debug("{}",article);
		article.setArticleTime(new Date(System.currentTimeMillis()));
		article.setMember(memberService.getById(article.getMemberId()));
		articleService.update(article);	
		return article;
	}
	
	
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(@RequestParam Article article){
		articleService.delete(article.getArticleId());
	}
	
	@RequestMapping("/article-page")
	public String articlePage(@RequestParam Long articleId, Model model){
		model.addAttribute("article", articleService.getById(articleId));
		return "/article/articlePage";
	}
	
}
