package tw.com.queautiful.product.service;

import java.sql.Date;
import java.util.ArrayList;
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
	private Date mfd = null;
	private Date exp = null;
	
	@Autowired
	private ProductService productServ;


	public Map<String, Object> compute(int brandId, String batchCode) {
		
		Map<String, Object> result = new HashMap<String, Object>();	
		List<Product> products=new ArrayList<Product>();
		List<Product> productList=new ArrayList<Product>();
		
		if(brandId==1){
		try {
			cacular(batchCode);
			result.put("mfd", mfd);
			result.put("exp", exp);
			
			products=productServ.getAll();
			
			for(int i=0;i<products.size();i++){
				if(products.get(i).getBrandId()==brandId){
					 productList.add(products.get(i));
				}
			   					
			}
			result.put("productList",productList);
			
		} catch (Exception e) {
			System.out.println("Exception 1");
			result.put("mfd","抱歉請檢察序號是否輸入正確");
			result.put("exp","抱歉請檢察序號是否輸入正確");
			result.put("productList","抱歉請檢察序號是否輸入正確");
		}
		
		}else{
			System.out.println("Exception2");
			result.put("mfd","抱歉請檢察序號是否輸入正確");
			result.put("exp","抱歉請檢察序號是否輸入正確");
			result.put("productList", productList);
		}
		
		return result;
	}

	@SuppressWarnings("deprecation")
	private void cacular(String batchCode) throws Exception{
		String patternStr = "[a-zA-Z|\\.]*";		
		
			if(batchCode.length()>3||!(batchCode.substring(0,1).matches(patternStr))){
				throw new NumberFormatException();
			}
			
			String yearStr=batchCode.substring(2);
			
			int year=Integer.valueOf(yearStr)+100;
			
			String monthStr=batchCode.substring(1, 2);
			
			int month=0;
			
			Pattern pattern = Pattern.compile("[0-9]*");
			Matcher isNum = pattern.matcher(monthStr);
			

			if(isNum.matches()){
				month=Integer.valueOf(monthStr);
			}else{//non number
				
				monthStr.toUpperCase();
				
				switch(monthStr){
				case "A":
					month=10;
					break;
				case "B":
					month=11;
					break;
				case "C":
					month=12;
					break;
				}
				}
			
			mfd=new java.sql.Date(year,month-1,1);

			exp=new java.sql.Date((year+3), month-1,1);

		
	}

}
