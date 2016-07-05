package tw.com.queautiful.product.service;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import tw.com.queautiful.commons.util.EmailSender;
import tw.com.queautiful.product.dao.MemberDao;
import tw.com.queautiful.product.entity.Member;

@Service
public class MemberService {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private EmailSender mailSender;
	
	public Member getById(Long memberId){
		return memberDao.findOne(memberId);
	}
	
	public List<Member> getAll(){
		return memberDao.findAll();
	}
	
	public Page<Member> getAll(Pageable pageable){
		return memberDao.findAll(pageable);
	}
	
	public void insert(Member member){
		//password encode
//		member.setPassword(new BCryptPasswordEncoder().encode(member.getPassword()));
		
		//memberimg set default_img
		if(member.getMemberImg()==null){
			member.setMemberImg("src/main/webapp/WEB-INF/img/member/member_default.png");
		}
		memberDao.save(member);
	}
	
	public void update(Member member){
		memberDao.save(member);
	}
	
	public void delete(Long memberId){
		memberDao.delete(memberId);
	}
	
	public void requestForResetPassword(String email, HttpServletRequest req){
		String resetPswUrl = createPswResetUrl(email, req);
		log.debug("URL: {}", resetPswUrl);
		mailSender.sendResetPsw(email, resetPswUrl);
	}
	
	//產生reset-password URL
	public String createPswResetUrl(String email, HttpServletRequest req){
	    String path = req.getServerName()+":"+req.getServerPort()+req.getContextPath();
	    return "http://"+path + "/members/resetpassword?token="+createPswResetToken(email);
	}
	
	//產生reset-password Token及reset-password ExpDate
	public String createPswResetToken(String email){
		Member member = memberDao.findByEmailIs(email);
		String token = UUID.randomUUID().toString();
	    member.setResetPswToken(token);
	    java.sql.Date expDate = new java.sql.Date(new java.util.Date().getTime()+7*24*60*60*1000);
	    member.setResetPswExp(expDate);
	    memberDao.save(member);
	    log.debug(token);
	    log.debug(expDate.toString());
	    return token;
	}
	
//	public void changePassword(Long memberId, String newPassword){
//		Member member = memberDao.getOne(memberId);
//		member.setPassword(new BCryptPasswordEncoder().encode(member.getPassword()));
//		memberDao.save(member);
//	}
	
	public Boolean accountCheck(String email){
		Member member = memberDao.findByEmailIs(email);
		if(member!=null){
			return false;
		}else{
			return true;
		}
	}
	
	public Member getByEmail(String email){
		return memberDao.findByEmailIs(email);
	}
	
	//    要改成傳Member，且前端可以傳特定日期
	public void memberSuspend(Long id, Integer memberSuspendDays){
		log.debug("inside service{}, {}", id, memberSuspendDays); //test
		Member member = memberDao.findOne(id);
		Long milliToday = new java.util.Date().getTime();
		java.sql.Date today = new java.sql.Date(milliToday);
		Long milliSuspend = memberSuspendDays*24*60*60*1000L;
		new java.sql.Date(milliToday+milliSuspend);
		member.setMemberSuspend(true);
		member.setMemberSuspendStart(today);
		member.setMemberSuspendDays(memberSuspendDays);
		member.setMemberSuspendCount(member.getMemberSuspendCount()+1);
		member.setMemberSuspendExp(new java.sql.Date(milliToday+milliSuspend));
		memberDao.save(member);
	}
	
}
