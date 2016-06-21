package tw.com.queautiful.product;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.context.annotation.*;
import org.springframework.security.config.annotation.authentication.builders.*;
import org.springframework.security.config.annotation.web.builders.*;
import org.springframework.security.config.annotation.web.configuration.*;
import org.springframework.security.core.*;
import org.springframework.security.core.context.*;
import org.springframework.security.web.authentication.*;
import org.springframework.security.web.savedrequest.*;

import tw.com.queautiful.product.entity.*;
import tw.com.queautiful.product.service.*;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter
{
    @Autowired
    MemberService memberService;

    @Override
    protected void configure(HttpSecurity http) throws Exception
    {
        http.csrf().disable().authorizeRequests()
                .antMatchers("/*", 
                 "/expdate/search",
                 "/members/*",
                 "/expdate/batchCodeController",
                 "/articleCMs/*",
                 "/brands/*",
                 "/categories/*",
                 "/ingredients/*",
                 "/products/*",
                 "/reviewCMs/*",
                 "/reviews/*").permitAll()
                .anyRequest().authenticated() //存取必須通過的驗證
                .and().formLogin().loginPage("/login").failureUrl("/login?error") //如果認證失敗，則導往/login並帶參數               
                .permitAll().successHandler(new loginSuccessHandler()).and().logout().logoutUrl("/members/logout")
                .permitAll().and().sessionManagement().maximumSessions(1).expiredUrl("/expired");
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception
    {
        List<Member> members = new ArrayList<Member>();
        members = memberService.getAll();
        for (int i = 0; i < members.size(); i++)
        {
            Member member = new Member();
            member = (Member) members.get(i);
            auth.inMemoryAuthentication().withUser(member.getEmail()).password(member.getPassword())
                    .roles(member.getFirstName());
        }
        auth.inMemoryAuthentication().withUser("user").password("p").roles("USER");
        auth.inMemoryAuthentication().withUser("parker").password("p").roles("parker");

    }

    //-------------------------------------------------------------------------------------------
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
