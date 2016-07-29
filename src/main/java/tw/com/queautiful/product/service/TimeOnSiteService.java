package tw.com.queautiful.product.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public Map getPagesVisitorNum(){
		List<TimeOnSiteEnity> index = timeOnsiteDao.findByPageUrlContaining("fms");
		List<TimeOnSiteEnity> expdate = timeOnsiteDao.findByPageUrlContaining("expdate");
		List<TimeOnSiteEnity> ingredient = timeOnsiteDao.findByPageUrlContaining("ingredients");
		List<TimeOnSiteEnity> product = timeOnsiteDao.findByPageUrlContaining("products");
		List<TimeOnSiteEnity> review = timeOnsiteDao.findByPageUrlContaining("reviews");
		List<TimeOnSiteEnity> forum = timeOnsiteDao.findByPageUrlContaining("forums");
		List<TimeOnSiteEnity> member = timeOnsiteDao.findByPageUrlContaining("members");
		List<TimeOnSiteEnity> contact = timeOnsiteDao.findByPageUrlContaining("contact");
		Map pageVisitors = new HashMap();
		pageVisitors.put("index", index.size());
		pageVisitors.put("expdate", expdate.size());
		pageVisitors.put("ingredient", ingredient.size());
		pageVisitors.put("product", product.size());
		pageVisitors.put("review", review.size());
		pageVisitors.put("forum", forum.size());
		pageVisitors.put("member", member.size());
		pageVisitors.put("contact", contact.size());
		
		return pageVisitors;
	}
	
}
