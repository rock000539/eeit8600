package tw.com.queautiful.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.ArticleCMDao;
import tw.com.queautiful.product.dao.ArticleReplyDao;
import tw.com.queautiful.product.entity.ArticleCM;
import tw.com.queautiful.product.entity.ArticleReply;

@Service
public class ArticleReplyService {

	@Autowired
	private ArticleReplyDao articleReplyDao;
	
	public ArticleReply getById(Long arId){
		return articleReplyDao.findOne(arId);
	}
	
	public List<ArticleReply> getAll(){
		return articleReplyDao.findAll();
	}
	
	public void insert(ArticleReply articleReply){
		articleReplyDao.save(articleReply);
	}
	
	public void update(ArticleReply articleReply){
		articleReplyDao.save(articleReply);
	}
	
	public void delete(Long arId){
		articleReplyDao.delete(arId);
	}
}
