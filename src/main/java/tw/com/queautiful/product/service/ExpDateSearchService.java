package tw.com.queautiful.product.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.entity.Product;

@Service
public class ExpDateSearchService {

	private String mfdStr;
	private String expStr;

	@Autowired
	private ProductService productServ;

	public Map<String, Object> compute(int brandId, String batchCode) {

		Map<String, Object> result = new HashMap<String, Object>();

		List<Product> products = new ArrayList<Product>();

		List<Product> productList = new ArrayList<Product>();

		try {
			if (brandId == 1) {
				Biore(batchCode);
				result.put("mfdDate", mfdStr);
				result.put("expDate", expStr);
				result.put("productList", productList);

			} else if (brandId == 2) {
				Clinique(batchCode);
				result.put("mfdDate", mfdStr);
				result.put("expDate", expStr);
				result.put("productList", productList);
			} else if (brandId == 3) {
			} else if (brandId == 4) {
				Lancome(batchCode);
				result.put("mfdDate", mfdStr);
				result.put("expDate", expStr);
				result.put("productList", productList);
			} else if(brandId ==5){
				lOreal(batchCode);
				result.put("mfdDate", mfdStr);
				result.put("expDate", expStr);
				result.put("productList", productList);
			}
			else {
				System.out.println("Exception2");
				result.put("mfdDate", "抱歉請檢察序號是否輸入正確");
				result.put("expDate", "抱歉請檢察序號是否輸入正確");
				result.put("productList", productList);
			}

		} catch (Exception e) {
			System.out.println("Exception 1");
			result.put("mfdDate", "抱歉請檢察序號是否輸入正確");
			result.put("expDate", "抱歉請檢察序號是否輸入正確");
			result.put("productList", "抱歉請檢察序號是否輸入正確");
			return result;
		}

		products = productServ.getAll();
		for (int i = 0; i < products.size(); i++) {

			if (products.get(i).getBrand().getBrandId() == brandId) {

				productList.add(products.get(i));
			}
		}

		return result;
	}

	private void Biore(String batchCode) throws Exception {
		String patternStr = "[a-zA-Z|\\.]*";

		if (batchCode.length() > 3 || !(batchCode.substring(0, 1).matches(patternStr))) {
			throw new NumberFormatException();
		}

		String yearStr = batchCode.substring(2);

		int year = Integer.valueOf(yearStr) + 2010;

		String monthStr = batchCode.substring(1, 2);

		int month = 0;

		Pattern pattern = Pattern.compile("[0-9]*");
		Matcher isNum = pattern.matcher(monthStr);

		if (isNum.matches()) {
			month = Integer.valueOf(monthStr);
		} else {// non number

			monthStr.toUpperCase();

			switch (monthStr) {
			case "A":
				month = 10;
				break;
			case "B":
				month = 11;
				break;
			case "C":
				month = 12;
				break;
			}
		}

		mfdStr = year + "-" + month;
		expStr = (year + 3) + "-" + month;

	}

	private void Clinique(String batchCode) {
		String patternStr = "[a-zA-Z|\\.]*";

		if (batchCode.length() > 3 || !(batchCode.substring(0, 1).matches(patternStr))) {
			throw new NumberFormatException();
		}
		
		String monthStr = batchCode.substring(1, 2);
		String yearStr = batchCode.substring(2, 3);
		int year = Integer.valueOf(yearStr) + 2000;
		Pattern pattern = Pattern.compile("[0-9]*");
		Matcher isNum = pattern.matcher(monthStr);
		int month = 0;
		if (isNum.matches()) {
			month = Integer.valueOf(monthStr);
		} else {// non number

			monthStr.toUpperCase();

			switch (monthStr) {
			case "A":
				month = 10;
				break;
			case "B":
				month = 11;
				break;
			case "C":
				month = 12;
				break;
			}
		}
		mfdStr = year + "-" + month;
		expStr = (year + 3) + "-" + month;

	}
	
	private void Lancome(String batchCode){
		String patternNum = "[0-9]*";

	
		if (batchCode.length() > 5 ||(batchCode.substring(0,2).matches(patternNum))) {
			System.out.println("in Exception");
			throw new NumberFormatException();
		}
		
		String yearStr=batchCode.substring(1,2).toUpperCase();
		String daysStr=batchCode.substring(2);
		int year=0;

		switch(yearStr){
		case "A": 
			year=2004;
			break;
		case "B":
			year=2005;
			break;
		case "C":
			year=2006;
			break;
		case "D":
			year=2007;
			break;
		case "E":
			year=2008;
			break;
		case "F":
			year=2009;
			break;
		case "G":
			year=2010;
			break;
		case "H":
			year=2011;
			break;
		case "I":
			year=2012;
			break;
		case "J":
			year=2013;
			break;
		case "K":
			year=2014;
			break;
		case "L":
			year=2015;
			break;
		case "M":
			year=2016;
			break;
		}
		
		int day=Integer.valueOf(daysStr);

		Calendar tempDay=Calendar.getInstance();
		
		tempDay.set(Calendar.DAY_OF_YEAR,day);
		int month=tempDay.MONTH;
		mfdStr = year + "-" + month;
		expStr = (year + 3) + "-" + month;
		
	}
	
	
	private void lOreal(String batchCode){
		String patternNum = "[0-9]*";

		
		if (batchCode.length() > 5 ||(batchCode.substring(0,2).matches(patternNum))) {
			System.out.println("in Exception");
			throw new NumberFormatException();
		}
		
		String yearStr=batchCode.substring(1,2).toUpperCase();
		String daysStr=batchCode.substring(2);
		int year=0;

		switch(yearStr){
		case "A": 
			year=2004;
			break;
		case "B":
			year=2005;
			break;
		case "C":
			year=2006;
			break;
		case "D":
			year=2007;
			break;
		case "E":
			year=2008;
			break;
		case "F":
			year=2009;
			break;
		case "G":
			year=2010;
			break;
		case "H":
			year=2011;
			break;
		case "I":
			year=2012;
			break;
		case "J":
			year=2013;
			break;
		case "K":
			year=2014;
			break;
		case "L":
			year=2015;
			break;
		case "M":
			year=2016;
			break;
		}
		
		int day=Integer.valueOf(daysStr);

		Calendar tempDay=Calendar.getInstance();
		
		tempDay.set(Calendar.DAY_OF_YEAR,day);
		int month=tempDay.MONTH;
		mfdStr = year + "-" + month;
		expStr = (year + 3) + "-" + month;
		
	}

}
