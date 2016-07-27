//package tw.com.queautiful.product.service;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import tw.com.queautiful.product.dao.ArticleCMDao;
//import tw.com.queautiful.product.entity.ArticleCM;
//
//@Service
//public class ArticleCMService {
//
//	@Autowired
//	private ArticleCMDao articleCMDao;
//	
//	public ArticleCM getById(Long acmId){
//		return articleCMDao.findOne(acmId);
//	}
//	
//	public List<ArticleCM> getAll(){
//		return articleCMDao.findAll();
//	}
//	
//	public void insert(ArticleCM articleCM){
//		articleCMDao.save(articleCM);
//	}
//	
//	public void update(ArticleCM articleCM){
//		articleCMDao.save(articleCM);
//	}
//	
//	public void delete(Long acmId){
//		articleCMDao.delete(acmId);
//	}
//}
