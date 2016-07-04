package tw.com.annotation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.annotation.dao.PublisherDao;
import tw.com.annotation.entity.Publisher;

@Service
public class PublisherService {
	
	@Autowired
	private PublisherDao dao;

	public Publisher getById(Long publisherId) {
		return dao.findOne(publisherId);
	}
	
	public List<Publisher> getAll() {
		return dao.findAll();
	}
	
}
