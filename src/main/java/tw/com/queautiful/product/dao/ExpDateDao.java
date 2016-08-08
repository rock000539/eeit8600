package tw.com.queautiful.product.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.queautiful.product.entity.ExpDate;
import tw.com.queautiful.product.entity.Member;

public interface ExpDateDao extends JpaRepository<ExpDate, Long>{

	public List<ExpDate> findByExpIs(java.sql.Date date);

	public ExpDate findByMemberIdAndExp(Long memberId, java.sql.Date exp);
	
	public List<ExpDate> findByMemberIdIs(Long memberId);
	
}
