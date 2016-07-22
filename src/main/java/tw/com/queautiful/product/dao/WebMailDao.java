package tw.com.queautiful.product.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.queautiful.product.entity.WebMail;

public interface WebMailDao extends JpaRepository<WebMail, Long> {

}
