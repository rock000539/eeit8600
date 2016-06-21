package tw.com.example.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.example.entity.Detail;

public interface DetailDao extends JpaRepository<Detail, Integer>{
	
}
