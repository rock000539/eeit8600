package tw.com.softleader.eeit8600.drama.dao;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.eeit8600.drama.entity.Drama;

public interface DramaDao extends JpaRepository<Drama, Long> {
	public Set<Drama> findByNameIgnoreCase(String name); 
	public Set<Drama> findByNameIgnoreCaseContaining(String name);

	public Set<Drama> findByActorIgnoreCase(String actor);
	public Set<Drama> findByActorIgnoreCaseContaining(String actor);
	
	public List<Drama> findByEpisodesLessThan(Integer episodes);
	
	public List<Drama> findByGenre(String genre);
	                              
}
