package tw.com.queautiful.commons.util;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

public class QutieQueryPattern<T> implements Specification<T> {

	@Override
	public Predicate toPredicate(Root<T> arg0, CriteriaQuery<?> arg1, CriteriaBuilder arg2) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
