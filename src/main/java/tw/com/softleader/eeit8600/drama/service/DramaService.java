package tw.com.softleader.eeit8600.drama.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.eeit8600.drama.dao.DramaDao;
import tw.com.softleader.eeit8600.drama.entity.Drama;

@Service
public class DramaService {

	@Autowired
	private DramaDao dramaDao;

	public Drama getById(Long id) {
		return dramaDao.findOne(id);
	}

	public List<Drama> getAll() {
//		List<Drama> dramas = dramaDao.findAll();
//		if (dramas.isEmpty()) {
//			Drama d1 = new Drama("The Walking Dead", 16, "Andrew Lincoln", "Horror");
//			Drama d2 = new Drama("Ally McBeal", 50, "Audrey Tautou", "Drama");
//			Drama d3 = new Drama("Agents of S.H.I.E.L.D", 22, "Clark Gregg", "Action");
//			Drama d4 = new Drama("Drop Dead Diva", 13, "Brooke Elliott", "Comedy");
//			Drama d5 = new Drama("True Blood", 12, "Anna Paquin", "Supernatural");
//			Drama d6 = new Drama("Revenge", 22, "Emily VanCamp", "Mystery");
//			Drama d7 = new Drama("The Newsroom", 10, "Jeffrey Warren", "Drama");
//			Drama d8 = new Drama("The big bang theory", 17, "Jim Parsons", "Comedy");
//			Drama d9 = new Drama("Once Upon a Time", 22, "Jennifer Michelle Goodwin", "Drama");
//			Drama d10 = new Drama("How to Get Away with Murder", 15, "Viola Davis", "Mystery");		
//			dramaDao.save(d1);
//			dramaDao.save(d2);
//			dramaDao.save(d3);
//			dramaDao.save(d4);
//			dramaDao.save(d5);
//			dramaDao.save(d6);
//			dramaDao.save(d7);
//			dramaDao.save(d8);
//			dramaDao.save(d9);
//			dramaDao.save(d10);
//		}
		return dramaDao.findAll();
	}

	public void insert(Drama drama) {
		dramaDao.save(drama);
	}

	public void update(Drama drama) {
		dramaDao.save(drama);
	}

	public void delete(Long id) {
		dramaDao.delete(id);
	}
	
	public Set<Drama> getByName(String inputbox){
		Set<Drama> dramas = dramaDao.findByNameIgnoreCase(inputbox.trim());
		dramas.addAll(dramaDao.findByNameIgnoreCaseContaining(inputbox.trim()));
		return dramas;
	}
	
	public Set<Drama> getByActor(String inputbox){
		Set<Drama> dramas =  dramaDao.findByActorIgnoreCase(inputbox.trim());
		dramas.addAll(dramaDao.findByActorIgnoreCaseContaining(inputbox.trim()));
		return dramas;
	}
	
	public List<Drama> getByEpisodesLessThan(Integer episodes){
		return dramaDao.findByEpisodesLessThan(episodes);
	}
	
	public List<Drama> getByGenre(String genresel){
		return dramaDao.findByGenre(genresel);
	}
	
//	public static void main(String[] args) {
//		DramaService ds = new DramaService();
//		System.out.println(ds.getByName("The Walking Dead"));
//    	System.out.println(ds.getByActor("Andrew Lincoln"));
//		System.out.println(ds.getById(1L));
//	}

}
