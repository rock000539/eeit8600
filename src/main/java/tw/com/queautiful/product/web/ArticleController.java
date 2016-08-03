package tw.com.queautiful.product.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.OrderBy;
import javax.persistence.PersistenceContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.commons.enums.ArticleType;
import tw.com.queautiful.commons.util.Spec;
import tw.com.queautiful.product.entity.Article;
import tw.com.queautiful.product.entity.ArticleReply;
import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.service.ArticleReplyService;
import tw.com.queautiful.product.service.ArticleService;
import tw.com.queautiful.product.service.MemberService;
import tw.com.queautiful.product.vo.article.ArticleListFms;
import tw.com.queautiful.product.vo.article.ArticleReplyVO;

@Controller
@RequestMapping("/articles")
public class ArticleController {

	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private ArticleReplyService arService;

	@Autowired
	private MemberService memberService;

	@PersistenceContext
	private EntityManager em;

	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("articles", articleService.getAll());
		return "/article/articleList";
	}

	@RequestMapping("/select")
	@ResponseBody
	public List<Article> select() {
		List<Article> articles = articleService.getAll();
		return articles;
	}

	@RequestMapping("/select_jqgrid")
	@ResponseBody
	public Page<Article> select(@RequestParam(required = false) Integer page,
			@RequestParam(required = false) Integer rows) {
		Pageable pageable = new PageRequest(page - 1, rows);
		Page<Article> articlePage = articleService.getAll(pageable);
		return articlePage;
	}

	@RequestMapping("/add")
	public String addPage() {
		return "/article/articleAdd";
	}

	@RequestMapping("/insert")
	@ResponseBody
	public Article insert(@RequestBody Article article) {
		article.setArticleTime(new java.sql.Timestamp(System.currentTimeMillis()));

		log.debug("{}", article.getArticleTime());
		log.debug("{}", article);
		article.setMember(memberService.getById(article.getMemberId()));
		articleService.insert(article);
		return article;
	}

	@RequestMapping("/edit/{articleId}")
	public String editPage(@PathVariable Long articleId, Model model) {
		model.addAttribute("article", articleService.getById(articleId));
		return "/article/articleEdit";
	}

	@RequestMapping("/update")
	@ResponseBody
	public Article update(@RequestBody Article article) {
		// log.debug("{}",article);
		article.setaEditTime(new java.sql.Timestamp(System.currentTimeMillis()));
		log.debug("{}", article.getMemberId());
		log.debug("{}", article);
		article.setMember(memberService.getById(article.getMemberId()));
		articleService.update(article);
		return article;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public void delete(@RequestBody Article article) {
		articleService.delete(article.getArticleId());
	}

	@RequestMapping("/article-page")
	public String articlePage(@RequestParam Long articleId, Model model) {
		model.addAttribute("article", articleService.getById(articleId));
		return "/article/articlePage";
	}

	@RequestMapping("/listfms")
	public String listFmsPage(Model model, @RequestParam(required = false) ArticleType articleType) {
		log.debug("articleType-->{}",articleType);
		// 初始頁碼、每頁幾筆資料
		Pageable pageable = new PageRequest(0, 10,  new Sort(Sort.Direction.DESC,"articleTime"));

		// 設定查詢條件、查詢資料
		Page<Article> a_page = null;
		Article a_spec = new Article();
		a_spec.setArticleShow(true);
		if (articleType != null) {
			a_spec.setArticleType(articleType);
		}
		a_page = articleService.getAll(Spec.byAuto(em, a_spec), pageable);

		log.debug("pages.getContent()-->{}", a_page.getContent());

		List<Article> a_list = a_page.getContent();
		List<ArticleListFms> articles = articleService.getAllByVOListFms(a_list);
		
		log.debug("ArticleListFms(articles)-->{}", articles);
		log.debug("totalPage-->{}",a_page.getTotalPages());

		model.addAttribute("articles", articles);
		model.addAttribute("totalPage", a_page.getTotalPages());

		return "/article/articleListFms";
	}
	
	@RequestMapping("/list_data")
	@ResponseBody
	public List<ArticleListFms> listFmsData(Integer page, Integer rows,@RequestParam(required = false) ArticleType articleType) {
		log.debug("{}",articleType);
		// 初始頁碼、每頁幾筆資料
		Pageable pageable = new PageRequest(page - 1, rows, new Sort(Sort.Direction.DESC,"articleTime"));
		
		// 設定查詢條件、查詢資料
		Page<Article> a_page = null;
		Article a_spec = new Article();
		a_spec.setArticleShow(true);
		if (articleType != null) {
			a_spec.setArticleType(articleType);
		}
		a_page = articleService.getAll(Spec.byAuto(em, a_spec), pageable);
		
		log.debug("list_data:pages.getContent()-->{}", a_page.getContent());

		List<Article> a_list = a_page.getContent();
		List<ArticleListFms> articles = articleService.getAllByVOListFms(a_list);
		
		return articles;
	}

	@RequestMapping("/view/{articleId}")
	public String articleView(@PathVariable Long articleId, Model model) {
		Pageable pageable = new PageRequest(0, 10, new Sort(Sort.Direction.ASC,"arTime"));
		ArticleReply ar_spec = new ArticleReply();
		ar_spec.setArShow(true);
		ar_spec.setArticle(articleService.getById(articleId));
		Page<ArticleReply> ar_page = arService.getAll(Spec.byAuto(em, ar_spec), pageable);
		List<ArticleReply> ar_list = ar_page.getContent();
		
		List<ArticleReplyVO> areplies = arService.getAllByVO(ar_list);
		
		model.addAttribute("article", articleService.getOneByVO(articleService.viewNCount(articleId)));
		model.addAttribute("arSize", areplies.size());
		model.addAttribute("areplies" , areplies);
		
		return "/article/articleView";
	}

}
