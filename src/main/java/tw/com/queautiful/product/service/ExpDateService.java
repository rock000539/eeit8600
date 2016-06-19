package tw.com.queautiful.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.ExpDateDao;
import tw.com.queautiful.product.entity.ExpDate;

@Service
public class ExpDateService {
	@Autowired
	private ExpDateDao DateDao;

	public ExpDate getById(Long dateId) {

		return DateDao.findOne(dateId);
	}

	public List<ExpDate> getAll() {
		return DateDao.findAll();
	}

	public void update(ExpDate date) {
		DateDao.save(date);
	}
	
	public void insert(ExpDate date){
		DateDao.save(date);
	}

	public void delete(Long dateId) {
		DateDao.delete(dateId);
	}
}
