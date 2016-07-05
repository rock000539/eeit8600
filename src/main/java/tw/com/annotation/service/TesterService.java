package tw.com.annotation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.annotation.dao.TesterDao;
import tw.com.annotation.entity.Tester;

@Service
public class TesterService {
	
	@Autowired
	private TesterDao dao;
	
	public Tester getById(Integer id) {
		return dao.findOne(id);
	}
	
	public List<Tester> getAll() {
		return dao.findAll();
	}
	
}
