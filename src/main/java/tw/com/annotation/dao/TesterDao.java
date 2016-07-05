package tw.com.annotation.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.annotation.entity.Tester;

public interface TesterDao extends JpaRepository<Tester, Integer>{

}
