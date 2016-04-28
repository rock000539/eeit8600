package tw.com.softleader.eeit8600.game.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.eeit8600.game.entity.Game;

public interface GameDao extends JpaRepository<Game, Long>{
	
}
