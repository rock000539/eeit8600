package tw.com.softleader.eeit8600.coffee.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import tw.com.softleader.eeit8600.coffee.dao.CoffeeDAO;
import tw.com.softleader.eeit8600.coffee.entity.CoffeeByParker;
public class testSpace {

	public static void main(String[] args) throws ParseException {
		CoffeeDAO dao=new CoffeeDAO();
		CoffeeByParker bean=new CoffeeByParker(); 
		bean.setId(1);
		bean.setName("first");
		bean.setLocal("JP");
		bean.setPrice(200);
		bean.setTesting("not bad");
		
		dao.insert(bean);
	}

}
