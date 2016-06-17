package tw.com.queautiful.product.web;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
//	@RequestMapping(value="/insert", method=RequestMethod.POST)
//	public String insert(Member member){
//		System.out.println(member);
//		service.insert(member);
//		return "member/memberAdd";
//	}
	
	@RequestMapping("/edit")
	public String editPage(@RequestParam Long memberId, Model model){
		model.addAttribute("member", service.getById(memberId));
		return "/member/memberEdit";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(Member member, @RequestParam MultipartFile memberImgFile){
		System.out.println(memberImgFile);
		BufferedOutputStream bOut = null;
		try {
			byte[] img = memberImgFile.getBytes();
			bOut = new BufferedOutputStream(new FileOutputStream(new File("D:\\test.jpg")));
			bOut.write(img);
			System.out.println("test");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			if (bOut != null) {
				try {
					bOut.close();
				} catch (IOException e) {
					e.printStackTrace();
				} 
			}
		}
			
//		service.update(member);
		return "/member/memberEdit";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam Long memberId){
		service.delete(memberId);
		return "redirect:/members/list";
	}

}
