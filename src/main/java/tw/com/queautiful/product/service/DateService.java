package tw.com.queautiful.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.DateDao;
import tw.com.queautiful.product.entity.Date;

@Service
public class DateService {
	@Autowired
	private DateDao DateDao;
	
	public Date getById(Long dateId){
		
		return DateDao.findOne(dateId);
	}
	public List<Date> getAll(){
		return DateDao.findAll();
	}
	public void update(Date date){
		DateDao.save(date);
	}
	public void delete(Long dateId){
		DateDao.delete(dateId);
	}
}
