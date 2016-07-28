package tw.com.queautiful.product.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.product.entity.TimeOnSiteEnity;
import tw.com.queautiful.product.service.TimeOnSiteService;

@Controller
@RequestMapping(value="/timeonsite",method=RequestMethod.POST)
public class TimeOnSiteController {
	@Autowired
	private TimeOnSiteService timeOnSiteService;
	@RequestMapping("/record")
	@ResponseBody
	public String record(Integer timeOnSiteStr,String pageUrl,Long memberId){
		TimeOnSiteEnity timeOnSiteEnity=new TimeOnSiteEnity();
		
		timeOnSiteEnity.setPageUrl(pageUrl);
		if(memberId!=null&&memberId!=0){
		timeOnSiteEnity.setMemberId(memberId);
		}else{
			timeOnSiteEnity.setMemberId(0L);
		}
		long timeOnSite=Long.valueOf(timeOnSiteStr);
		timeOnSiteEnity.setTimeOnSite(timeOnSite);
		timeOnSiteService.insert(timeOnSiteEnity);
		return "";
	}
}
