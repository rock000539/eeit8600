package tw.com.queautiful.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.ArticleDao;
import tw.com.queautiful.product.entity.Article;

@Service
public class ArticleService {

	@Autowired
	private ArticleDao articleDao;
	
	public Article getById(Long articleId){
		return articleDao.findOne(articleId);
	}
	
	public List<Article> getAll(){
		return articleDao.findAll();
	}
	
	public void insert(Article article){
		articleDao.save(article);
	}
	
	public void update(Article article){
		articleDao.save(article);
	}
	
	public void delete(Long articleId){
		articleDao.delete(articleId);
	}
	
}
