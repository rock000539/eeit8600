package tw.com.queautiful.product.web;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.product.entity.Article;
import tw.com.queautiful.product.service.ArticleService;

@Controller
@RequestMapping("/articles")
public class ArticleController {

	@Autowired
	private ArticleService articleService;
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("articles", articleService.getAll());		
		return "/article/articleList";
	}
	
	@RequestMapping("/add")
	public String addPage(){
		return "/article/articleAdd";
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public Article insert(@RequestBody Article article){
		article.setArticleTime(new Date(System.currentTimeMillis()));
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
		article.setArticleTime(new Date(System.currentTimeMillis()));
		articleService.insert(article);	
		return article;
	}
	
	
	@RequestMapping("/delete")
	public String delete(@RequestParam Long articleId){
		articleService.delete(articleId);
		return "redirect:/articles/list";
	}
	
	
}
