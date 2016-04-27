package tw.com.softleader.eeit8600.drama.service;

import java.util.List;

import org.springframework.stereotype.Service;

import tw.com.softleader.eeit8600.drama.dao.DramaDao;
import tw.com.softleader.eeit8600.drama.entity.Drama;
@Service
public class DramaService {

	
private DramaDao dramaDao;
	
	public DramaService() {
		dramaDao = new DramaDao();
	}
	
	public Drama getById(int id) {
		return dramaDao.findById(id);		
	}
	
	public List<Drama> getAll() {
		return dramaDao.findAll();
	}
	
	public void insert(Drama drama) {
		dramaDao.insert(drama);
	}
	
	public void update(Drama drama) {
		dramaDao.update(drama);
	}
	
	public void delete(int id) {
		dramaDao.delete(id);
	}
}
