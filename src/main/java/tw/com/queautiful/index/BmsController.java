package tw.com.queautiful.index;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.product.entity.Ingredient;
import tw.com.queautiful.product.entity.TimeOnSiteEnity;
import tw.com.queautiful.product.entity.WebMail;
import tw.com.queautiful.product.entity.WebViewAndVisitorData;
import tw.com.queautiful.product.service.IngredientService;
import tw.com.queautiful.product.service.MemberService;
import tw.com.queautiful.product.service.TimeOnSiteService;
import tw.com.queautiful.product.service.WebMailService;
import tw.com.queautiful.product.service.WebViewAndVisitorDataService;

@Controller
public class BmsController {
	@Autowired
	private WebMailService webMailService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private TimeOnSiteService timeOnSiteService;
	
	@PersistenceContext
	private EntityManager manager;
	
	@Autowired
	private IngredientService ingredientService;
	
	@Autowired
	private WebViewAndVisitorDataService webViewAndVisitorDataService;
	
	@RequestMapping("/bms")
	public String bmsPage(Model model){
		Map<String, Object> dataMap =new HashMap<String, Object>();
		double Bounce=0;
		
		//取出瀏覽人數資料-----------------------------------------------------
		
		WebViewAndVisitorData webViewAndVisitorData=webViewAndVisitorDataService.findOne();
		long totalVisitors = webViewAndVisitorData.getTotalVisitors();
		long uniqueVisitors = webViewAndVisitorData.getUniqueVisitors();
		dataMap.put("totalVisitors", totalVisitors);
		dataMap.put("uniqueVisitors", uniqueVisitors);
		//計算跳出率----------------------------------------------------------
		List timeOnSiteDatas=timeOnSiteService.findAll();
		for(int i=0;i<timeOnSiteDatas.size();i++){
			TimeOnSiteEnity	timeOnSite=(TimeOnSiteEnity) timeOnSiteDatas.get(i);
			String pageUrl=timeOnSite.getPageUrl();
			String[] pageUrlArray=pageUrl.split("/");
			if(pageUrlArray.length>3){
			if(pageUrlArray[3].equalsIgnoreCase("fms")){
				if(timeOnSite.getTimeOnSite()<5000){
					Bounce++;	
				}
			}
			}else{
				if(timeOnSite.getTimeOnSite()<5000){
					Bounce++;	
				}
			}
			
		}
		double BounceRate=(Bounce/timeOnSiteDatas.size())*10000d;
		dataMap.put("BounceRate",(Math.ceil(BounceRate)/100));
		
		//計算網站停留時間資料----------------------------------------------------
		
		String queryAvgTime="SELECT AVG([time_on_site]) From [timeonsite]";
		List<BigInteger> resultList =manager.createNativeQuery(queryAvgTime).getResultList();
		BigInteger bigId=resultList.get(0);
		long avgTimeMs=bigId.longValue();
		
		SimpleDateFormat sdf=new SimpleDateFormat("00:mm:ss",Locale.US);
		String avgTimeOnSite=sdf.format(new Date(avgTimeMs));		
		dataMap.put("avgTimeOnSite", avgTimeOnSite);
		
		//計算瀏覽人數-------------------------------------------
		
		dataMap.put("visitors",timeOnSiteDatas.size());
		model.addAttribute("dataMap", dataMap);
		
		//信件用--------------------------------------------
		
		List<Map<String, Object>> Mailresult=new ArrayList<Map<String, Object>>();
		List<WebMail> webMails = webMailService.findAll();
		
		for(int i=0;i<webMails.size();i++){
			Map<String, Object> resultMap=new HashMap<String, Object>();
			Long memeberId=webMails.get(i).getWebMailSender();
			if(memeberId!=null&&memeberId!=0){
			String nickName=memberService.getById(memeberId).getNickname();
			resultMap.put("nickName", nickName);
			}else{
				String nickName=webMails.get(i).getAnonymousName();
				resultMap.put("nickName", nickName);
			}
			resultMap.put("webMail",webMails.get(i));
			Mailresult.add(resultMap);
		}
		
		
		model.addAttribute("pageVisitorBarChart", timeOnSiteService.getPagesVisitorNum());
		model.addAttribute("Mailresult",Mailresult);
		return "/bms/bms";
	}
	
	@RequestMapping(value="/bms/getUnreadData",method=RequestMethod.POST)
	@ResponseBody
	public Map getUnreadData(){
		Map<String, List<?>> resultMap=new HashMap<String, List<?>>();
		List result=new ArrayList();
		
		List<WebMail> webMails=webMailService.findByMailReadTypeIs(false);
		List<String> nickNameList=new ArrayList();
		for(int i=0;i<webMails.size();i++){
			Long SenderId=webMails.get(i).getWebMailSender();
			String nickName="";
			if(SenderId==null||SenderId==0){
				nickName=webMails.get(i).getAnonymousName();
			}else{
				nickName=memberService.getById(SenderId).getNickname();
			}
			
			if(nickName==null||nickName==""){
				nickName="匿名";
			}
			nickNameList.add(nickName);
		}
		
		resultMap.put("webMails", webMails);
		resultMap.put("nickNames", nickNameList);
		List <Ingredient> Ingredients=ingredientService.findByCheckedDataIs(false);
		resultMap.put("Ingredients", Ingredients);
		
		return resultMap;
		
	}
	
}
