package tw.com.queautiful.product.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.queautiful.product.entity.WebMail;

public interface WebMailDao extends JpaRepository<WebMail, Long> {

	public List<WebMail> findByMailReadTypeIs(boolean mailReadType);
	
}
