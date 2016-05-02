package tw.com.softleader.eeit8600.drama.service;

import java.util.List;

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
		List<Drama> dramas = dramaDao.findAll();
		if (dramas.isEmpty()) {
			Drama d1 = new Drama("The Walking Dead", 16, "Andrew Lincoln", 78);
			Drama d2 = new Drama("Ally McBeal", 50, "Audrey Tautou", 45);
			Drama d3 = new Drama("Agents of S.H.I.E.L.D", 22, "Clark Gregg", 78);
			Drama d4 = new Drama("Drop Dead Diva", 13, "Brooke Elliott", 67);
			Drama d5 = new Drama("True Blood", 12, "Anna Paquin", 65);
			dramaDao.save(d1);
			dramaDao.save(d2);
			dramaDao.save(d3);
			dramaDao.save(d4);
			dramaDao.save(d5);
		}
		return dramaDao.findAll();
	}

	public void insert(Drama drama) {
		dramaDao.save(drama);
	}

	public void update(Drama drama) {
		dramaDao.save(drama);
	}

	public void delete(Drama drama) {
		dramaDao.delete(drama);
	}

}
