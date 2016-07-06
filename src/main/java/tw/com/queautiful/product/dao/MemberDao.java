package tw.com.queautiful.product.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.queautiful.product.entity.Member;

public interface MemberDao extends JpaRepository<Member, Long> {
	
	public Member findByEmailIs(String email);
	
	public Member findByResetPswToken(String resetPswToken);
	
}
