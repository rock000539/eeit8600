package tw.com.annotation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.annotation.dao.DetailDao;
import tw.com.annotation.entity.Detail;

@Service
public class DetailService {
	
	@Autowired
	private DetailDao dao;
	
	public Detail getById(Integer detailId) {
		return dao.findOne(detailId);
	}
	
	public List<Detail> getAll() {
		return dao.findAll();
	}
	
}
