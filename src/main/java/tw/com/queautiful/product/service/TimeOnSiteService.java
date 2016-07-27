package tw.com.queautiful.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.TimeOnSiteDao;
import tw.com.queautiful.product.entity.TimeOnSiteEnity;

@Service
public class TimeOnSiteService {
	@Autowired
	private TimeOnSiteDao timeOnsiteDao;
	
	public String insert(TimeOnSiteEnity timeOnSite){
		timeOnsiteDao.save(timeOnSite);
		return null;
	}
	
	public List<TimeOnSiteEnity> findAll(){
		return timeOnsiteDao.findAll();
	}
	
}
