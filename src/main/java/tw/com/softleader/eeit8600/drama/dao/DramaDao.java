package tw.com.softleader.eeit8600.drama.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.eeit8600.drama.entity.Drama;

public interface DramaDao extends JpaRepository<Drama, Long> {
	                              
}
