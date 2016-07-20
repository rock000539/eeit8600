package tw.com.queautiful.product.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.queautiful.product.dao.IngredientDao;
import tw.com.queautiful.product.dao.ProdIngreListDao;
import tw.com.queautiful.product.entity.Ingredient;
import tw.com.queautiful.product.entity.ProdIngreList;

@Service
public class ProdIngreListService {
	@Resource(name = "ProdIngreListDao")
	private ProdIngreListDao prodIngreListDao;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private IngredientDao ingredientDao;

	@PersistenceContext
	private EntityManager manager;

	public List<ProdIngreList> getAll() {
		return prodIngreListDao.findAll();
	}

	public List<Ingredient> findByProdIdEndsWith(long prodId) {
		String FIND_BY_PROID_QUERY = "select i.ingredid  , i.ingredName , i.ingredChName , i.ingredChar , i.ingredIrritant, i.ingredAcne , i.ingredSafety from proingrelist p inner join ingredient i on p.ingredid=i.ingredid where prodid=";

		List<Object[]> resultList = manager.createNativeQuery(FIND_BY_PROID_QUERY + prodId).getResultList();

		List<Ingredient> dataList = new ArrayList<Ingredient>();
		for (Object[] datas : resultList) {
			Ingredient ingredient = new Ingredient();
			BigInteger bigId= (BigInteger) datas[0];
			long BigInteger=bigId.longValue();
			ingredient.setIngredId(BigInteger);
			ingredient.setIngredName((String) datas[1]);
			ingredient.setIngredChName((String) datas[2]);
			ingredient.setIngredChar((String) datas[3]);
			ingredient.setIngredIrritant((Integer) datas[4]);
			ingredient.setIngredAcne((Integer) datas[5]);
			ingredient.setIngredSafety((Integer) datas[6]);

			dataList.add(ingredient);
		}

		return dataList;

	}

	public void insert(Long prodId, Long ingredId) {
		ProdIngreList prodIngreList = new ProdIngreList();
		prodIngreList.setIngredId(ingredId);
		prodIngreList.setProdId(prodId);
		prodIngreListDao.save(prodIngreList);
	}

	public void delete(Long prodId) {
		prodIngreListDao.delete(prodId);
	}
//---後台修改資料用----------------------------------------------------------------	
	@Transactional
	public ProdIngreList findOneByProidAndIngredientName(String proid ,String IngredientName){


		ProdIngreList result = new ProdIngreList();		
		Ingredient ingredient =ingredientDao.findByIngredCorrectName(IngredientName);
		Ingredient ingredientCh=ingredientDao.findByIngredChCorrectName(IngredientName);
		Long ingredId=null;
		
		if(ingredient!=null){
			ingredId=ingredient.getIngredId();
		}
		if(ingredientCh!=null){
			ingredId=ingredient.getIngredId();
		}
		//case2 有成份但還沒建立關聯性-------------------------------------------------------
				
		if(ingredId!=null){
		
		String findOneByProidAndIngredientName 
		= "select p.prodId,p.ingredId from proingrelist p where p.ingredid="+ingredId+" and p.prodid="+proid;
		String insertNewProductAndIngerdientRelative=
				"insert into [proingrelist] ([prodid],[ingredid]) values ("+proid+","+ingredId+")";
		
		List<Object[]> resultList = manager.createNativeQuery(findOneByProidAndIngredientName).getResultList();
		
		
		if(resultList.size()==1){// case3--現有相同資料-------------------------------------------

			for (int i=0;i<resultList.size();i++) {
			Object[] datas=resultList.get(i);
			BigInteger bigId= (BigInteger) datas[0];
			long BigInteger=bigId.longValue();
			result.setProdId(BigInteger);
			
			bigId= (BigInteger) datas[1];
			BigInteger=bigId.longValue();
			result.setIngredId(BigInteger);			
		}//end of for loop
		}else{//case2 ----有成份，但還沒關聯性資料
			
			System.out.println("start insert");
			
//			EntityTransaction et = manager.getTransaction();//要考慮交易的位置
			manager.createNativeQuery(insertNewProductAndIngerdientRelative).executeUpdate();
//			et.commit();		
			
			result.setProdId(Long.parseLong(proid));
			result.setIngredId(ingredId);
		}
		
		}//end of if(ingredId!=null){
		
		System.out.println(result);
		return result;// case1回傳null 不對result作處理
	}

	//前台成分找產品用	
	public List<Map<String, Object>> IngredientFindProducts(String IngredientId){
		List<Map<String, Object>> result=new ArrayList<Map<String, Object>>();
		String findProductsByIngredientId=
"  select t.prodname,b.brandcname,t.mainigdt,t.prodid,t.concentration,t.prodimg from brand b  join (select p.prodid,p.prodname,p.mainigdt,p.brandid,p.concentration,p.[prodimg] from [proingrelist] pl join product p  on pl.prodid=p.prodid  where pl.ingredid="
		+IngredientId+
") t   on b.brandid=t.brandid";
		List<Object[]> resultList = manager.createNativeQuery(findProductsByIngredientId).getResultList();
		
		for (int i=0;i<resultList.size();i++) {
			Map<String, Object> resultMap=new HashMap<String, Object>();
			Object[] datas=resultList.get(i);
			resultMap.put("prodname",datas[0]);
			resultMap.put("brandcname",datas[1]);
			resultMap.put("mainigdt",datas[2]);
			resultMap.put("prodId",datas[3]);
			resultMap.put("concentration",datas[4]);
			resultMap.put("prodimg",datas[5]);
			result.add(resultMap);
		}

		return result;
	}
}
