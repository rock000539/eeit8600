package tw.com.softleader.eeit8600.game.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.softleader.eeit8600.game.entity.Game;

public interface GameDao extends JpaRepository<Game, Long>{
	
	// Query methods
	
	// 查詢名稱完全相符的資料 (也可用 findByNameIs or findByNameEquals)
	public List<Game> findByName(String name);
	
	// 查詢名稱完全相符或完全不符的資料 (Like / NotLike)
	public List<Game> findByNameLike(String name);
	
	// 查詢URL開頭為某字串的資料 (StartingWith / EndingWith) (%)
	public List<Game> findByUrlStartingWith(String name);
	
	// 查詢名稱包含某字串的資料 (%)
	public List<Game> findByNameContaining(String name);
	
	// 查詢URL包含某字串並忽略大小寫 (IgnoreCase (UPPER))
	public List<Game> findByUrlContainingIgnoreCase(String name);
	
	// 查詢評價和下載量皆相符的資料 (And)
	public List<Game> findByEvaluationAndDownload(Integer evaluation, Integer download);
	
	// 查詢url包含任一字串的資料 (Or)
	public List<Game> findByUrlContainingOrUrlContaining(String url1, String url2);
	
	// 查詢評價介於兩整數之間的資料 (Between)
	public List<Game> findByEvaluationBetween(Integer evalu1, Integer evalu2);
	
	// 查詢下載量小於某整數的資料 (LessThan < , LessThanEqual <=)
	public List<Game> findByDownloadLessThan(Integer dl);
	
	// 查詢下載量大於某整數的資料 (GreaterThan > , GreaterThanEqual >=)
	public List<Game> findByDownloadGreaterThan(Integer dl);
	
	// 查詢名稱是否為null(IsNull)或not null(IsNotNull, NotNull)
	public List<Game> findByNameNotNull();
	
	// 查詢名稱是否不為某字串 (Not)
	public List<Game> findByNameNot(String name);
	
	// 查詢評價在/不在某整數的資料 (In / NotIn)
	public List<Game> findByEvaluationIn(Integer evalu);
	
	// 查詢所有資料並依照評價排序 (OrderBy)
	public List<Game> findAllByOrderByEvaluationAsc();
	
	// After / Before / True / False
	
}
