package tw.com.softleader.eeit8600.game.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.softleader.eeit8600.App;
import tw.com.softleader.eeit8600.game.entity.Game;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(App.class)
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // 讓JUnit的執行順序依照程式撰寫順序
public class GameDaoTest {
	@Autowired
	private GameDao gameDao;

	@Test
	public void test01Init() {

		// find all
		List<Game> games = gameDao.findAll();
		int originalSize = games.size();
		assertEquals(originalSize, 0);

		// insert data
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
		game3.setEvaluation(3);
		game3.setDownload(2000000);
		game3.setUrl("www.tos.com.tw");
		gameDao.save(game3);

		Game game4 = new Game();
		game4.setName("爐石戰記");
		game4.setEvaluation(2);
		game4.setDownload(4000000);
		game4.setUrl("www.heartstone.com.tw");
		gameDao.save(game4);

		Game game5 = new Game();
		game5.setName("列王的紛爭");
		game5.setEvaluation(1);
		game5.setDownload(5000000);
		game5.setUrl("www.cok.com.tw");
		gameDao.save(game5);

		// find all
		games = gameDao.findAll();
		originalSize = games.size();
		assertEquals(originalSize, 5);
	}

	@Test
	public void test01findByName() {
		List<Game> games = gameDao.findByName("部落衝突");
		for (Game game : games)
			System.out.println("game.name = 部落衝突  => " + game.getName());
	}

	@Test
	public void test02findByNameLike() {
		List<Game> games = gameDao.findByNameLike("部落衝突");
		for (Game game : games)
			System.out.println("game.name(Like) = 部落衝突  => " + game.getName());
	}

	@Test
	public void test03findByUrlStartingWith() {
		List<Game> games = gameDao.findByUrlStartingWith("www");
		for (Game game : games)
			System.out.println("game.url = startwith'www'  => " + game.getUrl());
	}

	@Test
	public void test04findByNameContaining() {
		List<Game> games = gameDao.findByNameContaining("爭");
		for (Game game : games)
			System.out.println("game.name contain '爭' => " + game.getName());
	}

	@Test
	public void test05findByUrlContainingIgnoreCase() {
		List<Game> games = gameDao.findByUrlContainingIgnoreCase("TOS");
		for (Game game : games)
			System.out.println("game.url ignoreCase and contain 'TOS' => " + game.getUrl());
	}

	@Test
	public void test06findByEvaluationAndDownload() {
		List<Game> games = gameDao.findByEvaluationAndDownload(4, 1000000);
		for (Game game : games)
			System.out.println("evalu = " + game.getEvaluation() + " and dl = " + game.getDownload());
	}

	@Test
	public void test07findByUrlContainingOrUrlContaining() {
		List<Game> games = gameDao.findByUrlContainingOrUrlContaining("coc", "tos");
		for (Game game : games)
			System.out.println("url contain tos/coc => " + game.getUrl());
	}

	@Test
	public void test08findByEvaluationBetween() {
		List<Game> games = gameDao.findByEvaluationBetween(3, 5);
		for (Game game : games)
			System.out.println("evalu between 3-5 => " + game.getEvaluation());
	}

	@Test
	public void test09findByDownloadLessThan() {
		List<Game> games = gameDao.findByDownloadLessThan(2500000);
		for (Game game : games)
			System.out.println("download < 2500000 => " + game.getDownload());
	}

	@Test
	public void test10findByDownloadGreaterThan() {
		List<Game> games = gameDao.findByDownloadGreaterThan(2500000);
		for (Game game : games)
			System.out.println("download > 2500000 => " + game.getDownload());
	}

	@Test
	public void test11findByNameNotNull() {
		List<Game> games = gameDao.findByNameNotNull();
		for (Game game : games)
			System.out.println("game.name NotNull => " + game.getName());
	}
	
	@Test
	public void test12findByNameNot() {
		List<Game> games = gameDao.findByNameNot("部落衝突");
		for (Game game : games)
			System.out.println("game.name not '部落衝突' => " + game.getName());
	}
	
	@Test
	public void test13findByEvaluationIn() {
		List<Game> games = gameDao.findByEvaluationIn(3);
		for (Game game : games)
			System.out.println("game.evalu = 3 => " + game.getEvaluation());
	}
	
	@Test
	public void test14findAllOrderByEvaluationDesc() {
		List<Game> games = gameDao.findAllByOrderByEvaluationAsc();
		for (Game game : games)
			System.out.println("game(orderbyEvalu) => " + game);
	}
}
