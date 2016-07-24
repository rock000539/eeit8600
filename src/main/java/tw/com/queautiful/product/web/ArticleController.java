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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.commons.enums.ArticleType;
import tw.com.queautiful.commons.util.Spec;
import tw.com.queautiful.product.entity.Article;
import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.service.ArticleService;
import tw.com.queautiful.product.service.MemberService;
import tw.com.queautiful.product.vo.article.ArticleListFms;

@Controller
@RequestMapping("/articles")
public class ArticleController {

	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ArticleService articleService;

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
		for (Article a : articles) {
//			log.debug("{}", a.getArticleTime());
		}
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

		// insert FK : memberID
		// Long memberId = 1L; //test
		// article.setMember(memberService.getById(memberId));
		log.debug("{}", article.getArticleTime());
		log.debug("{}", article);
		article.setMember(memberService.getById(article.getMemberId()));
		articleService.insert(article);
		return article;
	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam Long articleId, Model model) {
		model.addAttribute("article", articleService.getById(articleId));
		return "/article/articleEdit";
	}

	@RequestMapping("/update")
	@ResponseBody
	public Article update(@RequestBody Article article) {
		// log.debug("{}",article);
		// article.setArticleTime(new Date(System.currentTimeMillis()));
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

		// 查詢資料
		Page<Article> a_page = null;
		if (articleType == null) {
			a_page = articleService.getAll(pageable);
		} else {
			Article a_spec = new Article();
			a_spec.setArticleType(articleType);
			a_page = articleService.getAll(Spec.byAuto(em, a_spec), pageable);
		}

		log.debug("pages.getContent()-->{}", a_page.getContent());

		List<Article> a_list = a_page.getContent();
		List<ArticleListFms> articles = new ArrayList<>();

		ArticleListFms article = null;
		for (Article temp : a_list) {
			article = new ArticleListFms();
			BeanUtils.copyProperties(temp, article);
			article.setAcmsSize(temp.getAcms().size());
			articles.add(article);
		}

		log.debug("ArticleListFms(articles)-->{}", articles);
		log.debug("totalPage-->{}",a_page.getTotalPages());

		model.addAttribute("articles", articles);
		model.addAttribute("totalPage", a_page.getTotalPages());

		return "/article/articleListFms";
	}

//	 @RequestMapping("/listfms")
//	 public String listFmsPage(Model model) {
//	 // 初始頁碼、每頁幾筆資料
//	 Pageable pageable = new PageRequest(0, 10, new Sort(Sort.Direction.DESC,"articleTime"));
//	
//	 // 查詢資料
//	 Page<Article> a_page = articleService.getAll(pageable);
//	
//	 log.debug("pages.getContent()-->{}", a_page.getContent());
//	
//	 List<Article> a_list = a_page.getContent();
//	 List<ArticleListFms> articles = new ArrayList<>();
//	
//	 ArticleListFms article = null;
//	 for (Article temp : a_list) {
//	 article = new ArticleListFms();
//	 BeanUtils.copyProperties(temp, article);
//	 article.setAcmsSize(temp.getAcms().size());
//	 articles.add(article);
//	 }
//	
//	 log.debug("ArticleListFms(articles)-->{}",articles);
//	
//	 model.addAttribute("articles", articles);
//	 model.addAttribute("totalPage", a_page.getTotalPages());
//	
//	 return "/article/articleListFms";
//	 }

	@RequestMapping("/list_data")
	@ResponseBody
	public List<Article> listFmsData(Integer page, Integer rows) {
		Pageable pageable = new PageRequest(page - 1, rows);
		Page<Article> pages = articleService.findByOrderByArticleTimeDesc(pageable);

		log.debug("list_data:pages.getContent()-->{}", pages.getContent());
		return pages.getContent();
	}
	

//	@RequestMapping("/selectbyarticletype")
//	@ResponseBody
//	public List<Article> selectByArticleType(@RequestParam ArticleType articleType) {
//		Article article = new Article();
//		article.setArticleType(articleType);
//		List<Article> articles = articleService.getAll(Spec.byAuto(em, article));
//		return articles;
//	}

//	@RequestMapping("/selectbyarticletype")
//	public String selectByArticleType(@RequestParam ArticleType articleType, Model model) {
//		Pageable pageable = new PageRequest(0, 10, new Sort(Sort.Direction.DESC, "articleTime"));
//		Article a_spec = new Article();
//		a_spec.setArticleType(articleType);
//		Page<Article> a_page = articleService.getAll(Spec.byAuto(em, a_spec), pageable);
//		
//		List<Article> a_list = a_page.getContent();
//		List<ArticleListFms> articles = new ArrayList<>();
//		ArticleListFms article = null;
//		for(Article temp : a_list){
//			article = new ArticleListFms();
//			BeanUtils.copyProperties(temp,article);
//			article.setAcmsSize(temp.getAcms().size());
//			articles.add(article);
//		}
//		
//		log.debug("selectByArticleType-->{}",articles);
//		
//		model.addAttribute("articles", articles);
//		model.addAttribute("totalPage",a_page.getTotalPages());
//		return "/article/articleListFms";
//	}

	@RequestMapping("/view")
	public String articleView(@RequestParam Long articleId, Model model) {
		model.addAttribute("article", articleService.viewNCount(articleId));
		return "/article/articleView";
	}

}
