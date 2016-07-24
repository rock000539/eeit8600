package tw.com.queautiful.index;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.queautiful.product.entity.WebMail;
import tw.com.queautiful.product.service.MemberService;
import tw.com.queautiful.product.service.WebMailService;

@Controller
public class BmsController {
	@Autowired
	WebMailService webMailService;
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/bms")
	public String bmsPage(Model model){
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
		return "/bms/bms";
	}
}
