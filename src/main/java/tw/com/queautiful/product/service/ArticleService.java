package tw.com.queautiful.product.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import tw.com.queautiful.commons.util.Spec;
import tw.com.queautiful.product.dao.ArticleDao;
import tw.com.queautiful.product.entity.Article;
import tw.com.queautiful.product.entity.ArticleReply;
import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.vo.article.ArticleListFms;

@Service
public class ArticleService {

	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ArticleDao articleDao;

	public Article getById(Long articleId) {
		return articleDao.findOne(articleId);
	}

	public List<Article> getAll() {
		return articleDao.findAll();
	}

	public List<Article> getAll(Specification<Article> spec) {
		return articleDao.findAll(spec);
	}

	public Page<Article> getAll(Specification<Article> spec, Pageable pageable) {
		return articleDao.findAll(spec, pageable);
	}

	public Page<Article> getAll(Pageable pageable) {
		return articleDao.findAll(pageable);
	}

//	public List<Article> findByOrderByArticleTimeDesc() {
//		return articleDao.findByOrderByArticleTimeDesc();
//	}
//
//	public Page<Article> findByOrderByArticleTimeDesc(Pageable pageable) {
//		return articleDao.findByOrderByArticleTimeDesc(pageable);
//	}
//
//	public Page<Article> findByOrderByArticleTimeDesc(Specification<Article> spec, Pageable pageable){
//		return articleDao.findByOrderByArticleTimeDesc(spec, pageable);
//	}
	
	public void insert(Article article) {
		articleDao.save(article);
	}

	public void update(Article article) {
		articleDao.save(article);
	}

	public void delete(Long articleId) {
		articleDao.delete(articleId);
	}

	public Article viewNCount(Long articleId) {
		Article article = articleDao.findOne(articleId);
		article.setArticleView(article.getArticleView() + 1);
		articleDao.save(article);
		return article;
	}
	
	public List<ArticleListFms> getAllByVOListFms(List<Article> list){
		List<Article> a_list = list;
		List<ArticleListFms> articles = new ArrayList<>();

		ArticleListFms article = null;
		for (Article temp : a_list) {
			article = new ArticleListFms();
			BeanUtils.copyProperties(temp, article);
			Integer arSize = temp.getAreplies().size();
			article.setArSize(arSize);
			if(arSize!=0){
				ArticleReply lastPost = temp.getAreplies().get(arSize-1);
				article.setLastPost(lastPost);
			}
//			Member member = temp.getMember();
//			log.debug("member-->{}",member);
//			article.setMemberId(member.getMemberId());
//			article.setNickname(member.getNickname());
//			article.setMemberRegiDate(member.getMemberRegiDate());
//			Object[] reply = temp.getAreplies().toArray();
//			article.setAcmsSize(temp.getAcms().size());
			articles.add(article);
		}		
		return articles;	
	}

}
