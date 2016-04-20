package tw.com.softleader.eeit8600.coffee.service;

import java.text.ParseException;

import tw.com.softleader.eeit8600.coffee.dao.CoffeeDAO;
import tw.com.softleader.eeit8600.coffee.entity.Coffee;
public class testSpace {

	public static void main(String[] args) throws ParseException {
		CoffeeDAO dao=new CoffeeDAO();
		Coffee bean=new Coffee(); 
//		bean.setId(1);
//		bean.setName("first");
//		bean.setLocal("JP");
//		bean.setPrice(200);
//		bean.setTesting("not bad");	
//		dao.insert(bean);
//		
////		dao.delete(1);
//		bean.setPrice(900);
//		dao.update(bean);
//		
		dao.select();
	}

}
