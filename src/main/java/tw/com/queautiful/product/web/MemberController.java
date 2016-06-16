package tw.com.queautiful.product.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.service.MemberService;

@Controller
@RequestMapping("/members")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("members", service.getAll());
		return "/member/memberList";
	}
	
	@RequestMapping("/add")
	public String addPage(){
		return "/member/memberAdd";
	}
	

}
