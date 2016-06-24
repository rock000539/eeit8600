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
	
	public String accountCheck(String email){
		Member member = memberDao.findByEmailIs(email);
		if(member!=null){
			return "此帳號已經有人使用";
		}else{
			return "此帳號可以使用";
		}
	}
	
}
