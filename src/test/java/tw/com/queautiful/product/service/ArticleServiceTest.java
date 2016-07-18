package tw.com.queautiful.product.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.queautiful.App;
import tw.com.queautiful.commons.util.ArticleType;
import tw.com.queautiful.commons.util.Spec;
import tw.com.queautiful.product.entity.Article;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(App.class)
public class ArticleServiceTest {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private MemberService memberService;

	@PersistenceContext
	private EntityManager em;
	
	@Test
	public void test() {
		
		// Spec 篩選條件
		Article article = new Article();
		article.setMember(memberService.getById(1L));
		// article.setArticleType(ArticleType.NEWS);
		Specification<Article> spec = Spec.byAuto(em, article);
		
		String[] array = { "articleTime", "articleCollect" };
		
		// Page, Sort 指定
		Pageable pageable = new PageRequest(0, 10, new Sort(Sort.Direction.DESC, array));
		
		// 撈資料 
		Page<Article> pages = articleService.getAll(spec, pageable);
		List<Article> list = pages.getContent();
		
		for(Article tmp : list) {
			log.debug("{}", tmp);
		}
		
		// 結論    => 前端需要傳入
		// 1.Specification需要篩選的欄位
		// 2.Page所需要的頁數、筆數
		// 3.Sort的方向
		
	}

}
