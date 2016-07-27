package tw.com.queautiful.product.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.queautiful.product.entity.TimeOnSiteEnity;

public interface TimeOnSiteDao extends JpaRepository<TimeOnSiteEnity, Long> {

}
