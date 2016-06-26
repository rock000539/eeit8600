package tw.com.queautiful.product.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;

import tw.com.queautiful.product.dao.MemberDao;
import tw.com.queautiful.product.entity.Member;

@Service
public class MemberService {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MemberDao memberDao;
	
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
//		member.setPassword(Base64Utils.encodeToString(member.getPassword().getBytes()));
		if(member.getMemberImg()==null){
			member.setMemberImg("src/main/webapp/WEB-INF/img/member/member_default.png");
		}
		memberDao.save(member);
	}
	
	public void update(Member member){
//		Member memberInDB =  memberDao.findOne(member.getMemberId());
//		log.debug("psw in DB: {}",memberInDB.getPassword());//test
//		log.debug("member new password: {}",member.getPassword());//test
//		if(memberInDB!=null)
//			if(!memberInDB.getPassword().equals(member.getPassword())){
//				member.setPassword(Base64Utils.encodeToString(member.getPassword().getBytes()));
//				log.debug("member update encode: {}", member.getPassword().toString());//test
//			}
		memberDao.save(member);
	}
	
	public void delete(Long memberId){
		memberDao.delete(memberId);
	}
	
	public Boolean accountCheck(String email){
		Member member = memberDao.findByEmailIs(email);
		if(member!=null){
			return false;
		}else{
			return true;
		}
	}
	
	//    要改成傳Member，且前端可以傳特定日期
	public void memberSuspend(Long id, Integer memberSuspendDays){
		Member member = memberDao.findOne(id);
		Long milliToday = new java.util.Date().getTime();
		java.sql.Date today = new java.sql.Date(milliToday);
		Long milliSuspend = memberSuspendDays*24*60*60*1000L;
		new java.sql.Date(milliToday+milliSuspend);
		member.setMemberSuspendStart(today);
//		member.setMemberSuspendDays(memberSuspendDays);
		member.setMemberSuspendNum(member.getMemberSuspendNum()+1);
		member.setMemberSuspendExp(new java.sql.Date(milliToday+milliSuspend));
		
	}
	
}
