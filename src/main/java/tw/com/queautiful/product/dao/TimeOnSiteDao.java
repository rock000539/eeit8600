package tw.com.queautiful.product.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.queautiful.product.entity.TimeOnSiteEnity;

public interface TimeOnSiteDao extends JpaRepository<TimeOnSiteEnity, Long> {

	public List<TimeOnSiteEnity> findByPageUrlContaining(String url);
}
