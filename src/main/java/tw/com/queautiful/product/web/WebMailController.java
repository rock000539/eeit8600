package tw.com.queautiful.product.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.product.entity.WebMail;
import tw.com.queautiful.product.service.MemberService;
import tw.com.queautiful.product.service.ReportService;
import tw.com.queautiful.product.service.WebMailService;

@Controller
@RequestMapping("/webmail")
public class WebMailController {
	@Autowired
	WebMailService webMailService;
	@Autowired
	MemberService memberService;
	@Autowired
	private ReportService reportService;
	
	@RequestMapping(value="/sendmail",method = RequestMethod.POST)   
	@ResponseBody
	public String sendMail(@RequestParam long memberid,
			 Long articleid,
			 Long reviewId,
			 Long acmId,
			 Long rcmId,
			@RequestParam String reportTitle,@RequestParam String reportDetile){
		
		WebMail webMail=new WebMail();
		webMail.setWebMailSender(memberid);
		webMail.setMailAddressee(0L);
		webMail.setMailTitle(reportTitle);
		webMail.setMailContent(reportDetile);
		
		long now=new java.util.Date().getTime();
		java.sql.Date date=new java.sql.Date(now);
		
		webMail.setMailSendDate(date);
		webMail.setMailReadType(false);
		webMail.setMailContentType("Report");
		
		if(articleid!=0){
			webMail.setArticleid(articleid);
		}else if(reviewId!=0){
			webMail.setReviewId(reviewId);
		}else if(acmId!=0){
			webMail.setAcmId(acmId);
		}else if(rcmId!=0){
			webMail.setRcmId(rcmId);
		}else{
			
		}
		webMailService.insertAndUpdate(webMail);
		return "信件已寄出";
		
	}
	
	@RequestMapping(value="/webmaillist",method = RequestMethod.GET)   
	public String webMailList(Model model){
		List<Map<String, Object>> result=new ArrayList<Map<String, Object>>();
		
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
			result.add(resultMap);
		}
		model.addAttribute("result",result);
		return "/report/webMailShow";	
	}
	
	@Transactional
	@RequestMapping(value="/postReport",method = RequestMethod.POST)
	@ResponseBody
	public String postReport(long webMailId){
		String result = reportService.postReport(webMailService.findOneById(webMailId));
		return result;	
	}
	
	@RequestMapping(value="/changemailreadtype",method = RequestMethod.POST)
	@Transactional
	@ResponseBody
	public String changeMailReadType(long webMailId){
		WebMail webMail=webMailService.findOneById(webMailId);
		webMail.setMailReadType(true);
		webMailService.insertAndUpdate(webMail);
		return "";
	}
	@RequestMapping(value="/deleteMail",method = RequestMethod.POST)
	@ResponseBody
	public String deleteMail(long webMailId){
		webMailService.delete(webMailId);
		return "Mail already deleted";
	}
	@RequestMapping(value="/reloadMail",method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> reloadMail(){
		
		List<Map<String, Object>> result=new ArrayList<Map<String, Object>>();
		List<WebMail> WebMails=webMailService.findAll();
		System.out.println(WebMails.size());
		for(int i=0;i<WebMails.size();i++){
			Map<String, Object> resultMap=new HashMap<String, Object>();
			WebMail webMail=WebMails.get(i);
			Long snederId=webMail.getWebMailSender();
			if(snederId!=null&&snederId!=0){
				resultMap.put("nickName", memberService.getById(webMail.getWebMailSender()).getNickname());
				resultMap.put("WebMails", webMail);
				result.add(resultMap);
				
			}else if(snederId==0){
				resultMap.put("nickName", "ADMIN");
				resultMap.put("WebMails", webMail);
				result.add(resultMap);
			}
			else{
				resultMap.put("nickName", webMail.getAnonymousName());
				resultMap.put("WebMails", webMail);
				result.add(resultMap);
			
			}
		}
		return result;
	}
	
	@RequestMapping(value="/getnickname",method = RequestMethod.POST)
	@ResponseBody
	public String getnickname(Long webMailSender,Long webMailId){
		if(webMailSender!=null&&webMailSender!=0){
		return memberService.getById(webMailSender).getNickname();
		}else{
			return webMailService.findOneById(webMailId).getAnonymousName();
		}
		
	}
	
	@RequestMapping(value="/sendMail",method = RequestMethod.POST)
	@ResponseBody
	public String sendMail(String webMailSender,String senderEMail,String mailSubject,String mailMessage,Long memberId){
		WebMail webMail=new WebMail();
		webMail.setMailTitle(mailSubject);
		webMail.setMailContent(mailMessage);
		webMail.setMailReadType(false);
		webMail.setMailContentType("Contact");
		long now=new java.util.Date().getTime();
		java.sql.Date date=new java.sql.Date(now);
		webMail.setMailSendDate(date);
		if(memberId==null){
			if(senderEMail!=null&&webMailSender!=null){
				webMail.setAnonymousEMail(senderEMail);
				webMail.setAnonymousName(webMailSender);
				webMailService.insertAndUpdate(webMail);
			}else{
				return "請填寫姓名和電子信箱";
			}
		}else{
			webMail.setWebMailSender(memberId);	
			webMailService.insertAndUpdate(webMail);
			
		}
		return "Thank for your Contact!!";
	}
	
	@RequestMapping(value="/replyMail",method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public String callBackMail(Long webMailId,String replyTitle,String replyMessages){
		System.out.println("webMailId "+webMailId+"replyTitle "+replyTitle+"replyMessages "+replyMessages);
		
		Long mailSender=webMailService.findOneById(webMailId).getWebMailSender();
		
		WebMail webMail=new WebMail();
		
		if(mailSender!=null&&mailSender!=0){
		webMail.setMailAddressee(mailSender);
		}else{
			return "匿名用戶，請使用Email聯繫";
		}
		long now=new java.util.Date().getTime();
		java.sql.Date date=new java.sql.Date(now);
		webMail.setMailSendDate(date);
		webMail.setMailContent(replyMessages);
		webMail.setMailTitle(replyTitle);
		webMail.setMailReadType(false);
		webMail.setMailContentType("Reply");
		webMail.setWebMailSender(0L);
		webMailService.insertAndUpdate(webMail);
		return "已成功回信";
	}
}
