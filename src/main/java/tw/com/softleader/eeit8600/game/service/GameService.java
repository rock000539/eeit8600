package tw.com.softleader.eeit8600.game.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.eeit8600.game.dao.GameDao;
import tw.com.softleader.eeit8600.game.entity.Game;

@Service // 成為Service
public class GameService {

	@Autowired
	private GameDao gameDao;
	
	public Game getById(Long id){
		return gameDao.findOne(id);
	}
	
	public List<Game> getAll(){
		return gameDao.findAll();
	}
	
	public void insert(Game game){
		gameDao.save(game);
	}
	
	public void update(Game game){
		gameDao.save(game);
	}
	
	public void delete(Long id){
		gameDao.delete(id);
	}
	
	// 由於ddl-auto=create-drop, 暫時手動新增資料 
	public void initData(){
		Game game1 = new Game();
		game1.setName("部落衝突");
		game1.setEvaluation(5);
		game1.setDownload(3000000);
		game1.setUrl("www.coc.com.tw");
		gameDao.save(game1);
		
		Game game2 = new Game();
		game2.setName("皇室戰爭");
		game2.setEvaluation(4);
		game2.setDownload(1000000);
		game2.setUrl("www.cor.com.tw");
		gameDao.save(game2);
		
		Game game3 = new Game();
		game3.setName("神魔之塔");
		game3.setEvaluation(5);
		game3.setDownload(4000000);
		game3.setUrl("www.tos.com.tw");
		gameDao.save(game3);
		
		Game game4 = new Game();
		game4.setName("爐石戰記");
		game4.setEvaluation(4);
		game4.setDownload(6000000);
		game4.setUrl("www.heartstone.com.tw");
		gameDao.save(game4);
		
		Game game5 = new Game();
		game5.setName("列王的紛爭");
		game5.setEvaluation(3);
		game5.setDownload(2000000);
		game5.setUrl("www.cok.com.tw");
		gameDao.save(game5);
	}
}
