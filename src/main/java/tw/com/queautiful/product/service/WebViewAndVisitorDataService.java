package tw.com.queautiful.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.WebViewAndVisitorDataDao;
import tw.com.queautiful.product.entity.WebViewAndVisitorData;

@Service
public class WebViewAndVisitorDataService {
	@Autowired
	private WebViewAndVisitorDataDao WebViewAndVisitorDataDao;

	public WebViewAndVisitorData findOne(){
		return WebViewAndVisitorDataDao.findOne(1L);
	}
	
	public void update(WebViewAndVisitorData webViewAndVisitorData){
		WebViewAndVisitorDataDao.save(webViewAndVisitorData);
	}
}
