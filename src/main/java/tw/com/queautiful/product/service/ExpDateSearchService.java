package tw.com.queautiful.product.service;

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
import tw.com.queautiful.product.vo.product.productVoForIngredient;

@Service
public class ExpDateSearchService {

	private String mfdStr;
	private String expStr;
	boolean expState=false;

	@Autowired
	private ProductService productServ;

	public Map<String, Object> compute(int brandId, String batchCode) {

		Map<String, Object> result = new HashMap<String, Object>();

		List<Product> products = new ArrayList<Product>();

		List<Product> productList = new ArrayList<Product>();
		
		List<productVoForIngredient> productVoForIngredientList=new ArrayList<productVoForIngredient>();
		
		
		
		products = productServ.getAll();
		for (int i = 0; i < products.size(); i++) {

			if (products.get(i).getBrand().getBrandId() == brandId) {
				
				productList.add(products.get(i));
			
			}
		}
		
		productVoForIngredientList=productServ.copyByIdGetVoViews(productList);
		try {
			if (brandId == 1) {
				Biore(batchCode);
				result.put("mfdDate", mfdStr);
				result.put("expDate", expStr);
				result.put("productList", productVoForIngredientList);
				

			} else if (brandId == 2) {
				Clinique(batchCode);
				result.put("mfdDate", mfdStr);
				result.put("expDate", expStr);
				result.put("productList", productVoForIngredientList);
			} else if (brandId == 3) {
				MAC(batchCode);
				result.put("mfdDate", mfdStr);
				result.put("expDate", expStr);
				result.put("productList", productVoForIngredientList);
			} else if (brandId == 4) {
				Lancome(batchCode);
				result.put("mfdDate", mfdStr);
				result.put("expDate", expStr);
				result.put("productList", productVoForIngredientList);
			} else if(brandId ==5){
				lOreal(batchCode);
				result.put("mfdDate", mfdStr);
				result.put("expDate", expStr);
				result.put("productList", productVoForIngredientList);
			}
			else {
				System.out.println("Exception2");
				result.put("mfdDate", "Your input is wrong.");
				result.put("expDate", "Your input is wrong.");
				result.put("productList", productVoForIngredientList);
			}

		} catch (Exception e) {
			System.out.println("Exception 1");
			result.put("mfdDate", "Your input is wrong.");
			result.put("expDate", "Your input is wrong.");
			result.put("productList", "Your input is wrong.");
			return result;
		}
		result.put("expState", expState);
		
		return result;
	}

	//-各家廠牌Code號--------------------------------------------------------------
	private void Biore(String batchCode) throws Exception{
		if(batchCode.length()==8){
			String patternStr = "[a-zA-Z|\\.]*";
			if(batchCode.substring(0, 1).matches(patternStr)){
				int day=Integer.parseInt(batchCode.substring(4, 7));
				if(day<=365){
				int year=Integer.parseInt(batchCode.substring(7))+2010;
				Calendar date= Calendar.getInstance();
				date.set(Calendar.DAY_OF_YEAR,day);
				date.set(Calendar.YEAR,year);
				int month=date.get(Calendar.MONTH)+1;
				
				Calendar now=Calendar.getInstance();
				now.getTime();
				date.set(Calendar.YEAR,(year+3));
				if(date.before(now)){
					expState=true;
				}
				
				mfdStr= year + "-" + month;
				expStr = (year + 3) + "-" + month;
				}else{
					throw new NumberFormatException();
				}
			}else{
				throw new NumberFormatException();
			}
		}else{
			throw new NumberFormatException();
		}
	}
	
	
	
	private void MAC(String batchCode) throws Exception {
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
		
		
		Calendar date= Calendar.getInstance();
		date.set(Calendar.MONTH,month);
		date.set(Calendar.YEAR,year);
		
		Calendar now=Calendar.getInstance();
		now.getTime();
		date.set(Calendar.YEAR,(year+3));
		if(date.before(now)){
			expState=true;
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
		int year = Integer.valueOf(yearStr) + 2010;
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
		
		Calendar date= Calendar.getInstance();
		date.set(Calendar.MONTH,month);
		date.set(Calendar.YEAR,year);
		
		Calendar now=Calendar.getInstance();
		now.getTime();
		date.set(Calendar.YEAR,(year+3));
		if(date.before(now)){
			expState=true;
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
		int month=tempDay.get(Calendar.MONTH) + 1;
		
		Calendar date= Calendar.getInstance();
		date.set(Calendar.MONTH,month);
		date.set(Calendar.YEAR,year);
		
		Calendar now=Calendar.getInstance();
		now.getTime();
		date.set(Calendar.YEAR,(year+3));
		if(date.before(now)){
			expState=true;
		}
		
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
		int month=tempDay.get(Calendar.MONTH) + 1;
		
		Calendar date= Calendar.getInstance();
		date.set(Calendar.MONTH,month);
		date.set(Calendar.YEAR,year);
		
		Calendar now=Calendar.getInstance();
		now.getTime();
		date.set(Calendar.YEAR,(year+3));
		if(date.before(now)){
			expState=true;
		}
		
		mfdStr = year + "-" + month;
		expStr = (year + 3) + "-" + month;
		
	}

}
