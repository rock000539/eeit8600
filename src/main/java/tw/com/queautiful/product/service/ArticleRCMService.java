package tw.com.queautiful.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.ArticleRCMDao;
import tw.com.queautiful.product.entity.ArticleRCM;

@Service
public class ArticleRCMService {

	@Autowired
	private ArticleRCMDao articleRCMDao;
	
	public ArticleRCM getById(Long arcmId){
		return articleRCMDao.findOne(arcmId);
	}
	
	public List<ArticleRCM> getAll(){
		return articleRCMDao.findAll();
	}
	
	public void insert(ArticleRCM articleRCM){
		articleRCMDao.save(articleRCM);
	}
	
	public void update(ArticleRCM articleRCM){
		articleRCMDao.save(articleRCM);
	}
	
	public void delete(Long arcmId){
		articleRCMDao.delete(arcmId);
	}
}
