package tw.com.queautiful.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.WebMailDao;
import tw.com.queautiful.product.entity.WebMail;

@Service
public class WebMailService {
	@Autowired
	private WebMailDao webMailDao;
	
	public List<WebMail> findAll(){
		return webMailDao.findAll();
	}
	
	public WebMail findOneById(long webMailId){
		return webMailDao.findOne(webMailId);
	}
	
	public void insertAndUpdate(WebMail webMail){
		webMailDao.save(webMail);
	}
	
	public void delete(long webMailId){
		webMailDao.delete(webMailId);
	}
	
	public List<WebMail> findByMailReadTypeIs(boolean mailReadType){
		return webMailDao.findByMailReadTypeIs(mailReadType);
	}
}
