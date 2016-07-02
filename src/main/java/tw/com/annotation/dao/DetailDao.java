package tw.com.annotation.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.annotation.entity.Detail;

public interface DetailDao extends JpaRepository<Detail, Integer>{
	
}
