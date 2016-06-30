package tw.com.queautiful.product.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.ProdIngreListDao;
import tw.com.queautiful.product.entity.Ingredient;
import tw.com.queautiful.product.entity.ProdIngreList;

@Service
public class ProdIngreListService {
	@Resource(name = "ProdIngreListDao")
	private ProdIngreListDao prodIngreListDao;

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

}
