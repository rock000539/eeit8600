package tw.com.queautiful.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import tw.com.queautiful.commons.util.Spec;
import tw.com.queautiful.product.dao.ArticleDao;
import tw.com.queautiful.product.entity.Article;

@Service
public class ArticleService {

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
	
	public Page<Article> getAll(Pageable pageable){
		return articleDao.findAll(pageable);
	}
	
	public List<Article> findByOrderByArticleTimeDesc(){
		return articleDao.findByOrderByArticleTimeDesc();
	}

	public void insert(Article article) {
		articleDao.save(article);
	}

	public void update(Article article) {
		articleDao.save(article);
	}

	public void delete(Long articleId) {
		articleDao.delete(articleId);
	}

}
