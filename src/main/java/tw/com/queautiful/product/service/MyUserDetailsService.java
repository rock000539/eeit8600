package tw.com.queautiful.product.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.entity.Member;


@Service
public class MyUserDetailsService implements UserDetailsService {
	  
	
	@Autowired
	private MemberService memberService;
	

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Member user;
        try {
            user = memberService.getByEmail(email);
        } catch (Exception e) {
            throw new UsernameNotFoundException("user select fail");
        }
        if(user == null){
            throw new UsernameNotFoundException("no user found");
        } else {//uesr 存在--------
            try {
                List<GrantedAuthority> gas = new ArrayList<GrantedAuthority>();
                gas.add(new SimpleGrantedAuthority("ROLE_USER"));
                return new org.springframework.security.core.userdetails.User(
                        user.getEmail(), user.getPassword(), true, true, true, true, gas);
            } catch (Exception e) {
                throw new UsernameNotFoundException("user role select fail");
            }
        }
		
	}

}
