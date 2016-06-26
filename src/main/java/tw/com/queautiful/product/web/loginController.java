package tw.com.queautiful.product.web;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import tw.com.queautiful.product.entity.*;
import tw.com.queautiful.product.service.*;

@Controller
@RequestMapping("/")
public class loginController
{
    @Autowired
    private MemberService memberService;
    
    @RequestMapping("login")    
    public String login(){
        
        return "/member/login";
    }
    //--------------------------------------------
    @RequestMapping("out")    
    public String logoutPage(){
        
        return "/member/logout";
    }
    //*********************************************
    @RequestMapping("login?logout")    
    public String logout(){
        
        return "/expdate/search";
    }
    
    @RequestMapping("login?error")    
    public String loginError(Model model){
        model.addAttribute("param", "用戶或密碼錯誤");
        return "/member/login";
    }
    
    
    @RequestMapping("/check")   
    public String check(HttpServletRequest request,String memberEmail){
        List<Member> list=new ArrayList<Member>();
        list=memberService.getAll();
        
        for(int i=0;i<list.size();i++){
            String Email=list.get(i).getEmail();
            if(memberEmail==Email){
                request.getSession().setAttribute("memberId", list.get(i).getMemberId());
            }
        }
       
        return null;
    }
    
    
}
