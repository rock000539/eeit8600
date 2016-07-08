package tw.com.queautiful;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.RequestCache;

import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.service.MemberService;

@EnableGlobalAuthentication
@EnableGlobalMethodSecurity(securedEnabled = true) 
@EnableWebSecurity
public class MultiHttpSecurityConfig {
    @Autowired
    MemberService memberService;
    
    @Autowired
    protected void configureGlobal(AuthenticationManagerBuilder auth) throws Exception
    {  
    	auth.inMemoryAuthentication().withUser("parker").password("p").roles("PARKER");
    	
        auth.inMemoryAuthentication()
        .withUser("user").password("p").roles("USER");
        
        List<Member> members = new ArrayList<Member>();
        members = memberService.getAll();
        
        for (int i = 0; i < members.size(); i++)
        {
            Member member = new Member();
            member = (Member) members.get(i);
            auth.inMemoryAuthentication().withUser(member.getEmail()).password(member.getPassword())
                    .roles("USER");
        }
   
    }   
    
    @Configuration
    @Order(2) //優先
    public static class App2ConfigurationAdapter extends WebSecurityConfigurerAdapter {
       
        @Override
        protected void configure(HttpSecurity http) throws Exception {
       
            http    .csrf()
                    .disable()
                    .antMatcher("/Gundam/**")
                    .authorizeRequests()
                    .anyRequest()
                    .hasRole("PARKER")//管理員PARKER才允許訪問的位置                 
                    .and()
                    .formLogin()
                    .loginPage("/login")
                    .failureUrl("/login?error")
                    .permitAll()
                    .and()
                    .logout()
                    .logoutUrl("/logout")          
                    .permitAll()
                    .and()
                    .exceptionHandling().accessDeniedPage("/loginBmsDenied")  //權限不夠 登入時會導入的頁面                    
                    .and() 
                    .httpBasic();  //設定最高權限(放到最後)
//                    .and()
//                    .sessionManagement().maximumSessions(1).expiredUrl("/logout");
        }       
    }    
    
@Configuration
@Order(3) 
public static class WebSecurityConfig extends WebSecurityConfigurerAdapter
{
    @Autowired
    MemberService memberService;

    @Override
    public void configure(WebSecurity web) throws Exception {
    web
    .ignoring()
    .antMatchers("/**/**"); // 這個過濾條件中，忽略url(不用登入即可看的路徑)
    }
    
    @Override
    protected void configure(HttpSecurity http) throws Exception
    {  
        http.csrf().disable()
                .authorizeRequests()  //開始設定路徑&權限
                .antMatchers(
                "/","/expdate/search",
                "/expdate/batchCodeController",
                "/loginBms",
                "/loginBmsDenied",
                "/ingredients/startSearch") 
                .permitAll()      //設定過濾條件 ↓         
                //沒有設ROLE(一般人)，permitAll():表示以上路徑都可訪問                            
                .anyRequest().authenticated() // #7所有其他的URL都需要用户進行驗證 (固定會加的東西)
                
                .and() //這是功能分隔用                
                .formLogin()
                .loginPage("/login")     //登入頁面的URL
                .failureUrl("/login?error") //如果認證失敗，則導往/login並帶參數               
                .permitAll() 
                .successHandler(new loginSuccessHandler()) //登入成功後執行的方法
                
                .and()
                .logout()
                .logoutUrl("/logout")//登出要用的url
                .logoutSuccessUrl("/")//登出後轉導的頁面
                .invalidateHttpSession(true)//登出後使session無效
                .permitAll()
                
                .and()
                .sessionManagement().maximumSessions(1).expiredUrl("/logout"); //生成session 設置同時同帳號最大連線數是1                                                                                      //，到登出頁面時session失效
//                .and()
//                .channelSecurity()
//                .anyRequest().requiresSecure(); 安全通道https的設置(尚未啟用)
    }
    

    //------------------------------------------------------------------------------------------------
    public class loginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler 
    {
        @Override
        public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                Authentication authentication) throws ServletException, IOException
        {
            List<Member> members = memberService.getAll();
            String Email = SecurityContextHolder.getContext().getAuthentication().getName();

            for (int i = 0; i < members.size(); i++)
            {

                Member member = members.get(i);

                if (member.getEmail().equals(Email))
                {
                    request.getSession().setAttribute("memberId", member.getMemberId());
                    //---------------------------------------------------------------------------------
                    Cookie crunchifyCookie = new Cookie("UserName", Email);
                    response.addCookie(crunchifyCookie);
                    //----------------------------------------------------------------------------------
                    break;
                }
                else
                {
                    request.getSession().setAttribute("memberId", 0L);

                }
            }
            
            super.onAuthenticationSuccess(request, response, authentication);
        }

        @Override
        public void setRequestCache(RequestCache requestCache)
        {
            // TODO Auto-generated method stub
            super.setRequestCache(requestCache);
        }

    }

}


}



