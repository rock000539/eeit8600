package tw.com.queautiful.product.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.commons.util.RealIpUtils;
import tw.com.queautiful.product.entity.TimeOnSiteEnity;
import tw.com.queautiful.product.service.TimeOnSiteService;

@Controller
@RequestMapping(value="/timeonsite",method=RequestMethod.POST)
public class TimeOnSiteController {
	@Autowired
	private TimeOnSiteService timeOnSiteService;
	@RequestMapping("/record")
	@ResponseBody
	public String record(Integer timeOnSiteStr,String pageUrl,Long memberId,HttpServletRequest req){
		TimeOnSiteEnity timeOnSiteEnity=new TimeOnSiteEnity();
		
		timeOnSiteEnity.setPageUrl(pageUrl);
		timeOnSiteEnity.setPageUrlTrimmed(pageUrl);
		if(memberId!=null&&memberId!=0){
		timeOnSiteEnity.setMemberId(memberId);
		}else{
			timeOnSiteEnity.setMemberId(0L);
		}
		long timeOnSite=Long.valueOf(timeOnSiteStr);
		timeOnSiteEnity.setTimeOnSite(timeOnSite);
		
		String realIp=RealIpUtils.getRealIpAddr(req);
		timeOnSiteEnity.setClientIp(realIp);
		
		timeOnSiteService.insert(timeOnSiteEnity);
		return "";
	}
}
