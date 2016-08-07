package tw.com.queautiful.product.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class LoginController
{
//    @Autowired
//    private MemberService memberService;
    
    @RequestMapping("loginBms")    
    public String loginBms(){        
        return "/member/loginBms";
    }
    
    @RequestMapping("login")    
    public String login(){
        
        return "/member/login";
    }
    @RequestMapping("loginBmsDenied")  
    public String bmsDenied(){
    	return "/member/loginBmsDenied";
    }
    
    //-------------------------------------------
    
    @RequestMapping(value = "loginBms", method = RequestMethod.GET)
    public String loginBms(HttpServletRequest req,
        @RequestParam(value = "error", required = false) String error,
        @RequestParam(value = "logout", required = false) String logout) {

       if (error != null) {
           req.setAttribute("error", "帳號或密碼輸入錯誤");
        }

       if (logout != null) {
           req.setAttribute("msg", "成功登出");
           //可註解想轉的登出頁面
        }

        return "/member/loginBms";//回傳驗證錯誤的資訊

    }
    
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login(HttpServletRequest req,
        @RequestParam(value = "error", required = false) String error,
        @RequestParam(value = "logout", required = false) String logout) {

       if (error != null) {
           req.setAttribute("error", "帳號或密碼輸入錯誤");
        }

       if (logout != null) {
           req.setAttribute("msg", "成功登出");
           //可註解想轉的登出頁面
        }

        return "/member/login";//回傳驗證錯誤的資訊

    }
 
    
}
