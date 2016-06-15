package tw.com.queautiful.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.MemberDao;
import tw.com.queautiful.product.entity.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	
	public Member getById(Long memberId){
		return memberDao.findOne(memberId);
	}
	
	public List<Member> getAll(){
		return memberDao.findAll();
	}
	
	public void insert(Member member){
		memberDao.save(member);
	}
	
	public void update(Member member){
		memberDao.save(member);
	}
	
	public void delete(Member member){
		memberDao.delete(member);
	}
	
}
