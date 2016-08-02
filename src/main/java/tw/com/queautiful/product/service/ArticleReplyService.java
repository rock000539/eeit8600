package tw.com.queautiful.product.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.ArticleReplyDao;
import tw.com.queautiful.product.entity.Article;
import tw.com.queautiful.product.entity.ArticleReply;
import tw.com.queautiful.product.vo.article.ArticleReplyVO;

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
	
	public Page<ArticleReply> getAll(Specification<ArticleReply> spec, Pageable pageable){
		return articleReplyDao.findAll(spec, pageable);
	}
	
	public List<ArticleReplyVO> getAllByVO(List<ArticleReply> list){
		List<ArticleReply> ar_list = list;
		List<ArticleReplyVO> areplies = new ArrayList<>();
		ArticleReplyVO areply = null;
		for(ArticleReply temp : ar_list){
			areply = new ArticleReplyVO();
			BeanUtils.copyProperties(temp, areply);
			areplies.add(areply);
		}
		return areplies;
	}
}
