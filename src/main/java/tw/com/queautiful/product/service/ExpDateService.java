package tw.com.queautiful.product.service;

import java.util.Calendar;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.ExpDateDao;
import tw.com.queautiful.product.entity.ExpDate;

@Service
public class ExpDateService {
	private Logger log = LoggerFactory.getLogger(this.getClass());
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
	
	public List<ExpDate> getByMemberId(Long memberId){
		return DateDao.findByMemberIdIs(memberId);
	}
	
	//check expDate will be expired after one month
	public List<ExpDate> expDateAfterOneMonth(){
		Calendar exp = Calendar.getInstance();
		exp.add(Calendar.MONTH, +1);
		java.sql.Date expAfterOneMonth = new java.sql.Date(exp.getTimeInMillis());
		log.debug("expAfterOneMonth: {}", expAfterOneMonth);
		return DateDao.findByExpIs(expAfterOneMonth);
	}
}
