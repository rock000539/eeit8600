package tw.com.queautiful.product.specification;

import static com.google.common.collect.Iterables.toArray;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.jpa.domain.Specification;

import tw.com.queautiful.product.entity.Product;

public class ProductSpecification implements Specification<Product> {

	private Product filter;

	public ProductSpecification(Product filter) {
		this.filter = filter;
	}

	@Override
	public Predicate toPredicate(Root<Product> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

		List<Predicate> predicates = new ArrayList<>();

		if (filter.getProdId() != null) {
			predicates.add(cb.equal(root.get("prodId"), filter.getProdId()));
		}

		if (StringUtils.isNotBlank(filter.getProdName())) {
			predicates.add(cb.equal(root.get("prodName"), filter.getProdName()));
		}

		if (filter.getBrand().getBrandId() != null) {
			predicates.add(cb.equal(root.get("brandId"), filter.getBrand().getBrandId()));
		}

		if (filter.getCategoryId() != null) {
			predicates.add(cb.equal(root.get("categoryId"), filter.getCategoryId()));
		}

		if (filter.getWeight() != null) {
			predicates.add(cb.equal(root.get("weight"), filter.getWeight()));
		}

		if (filter.getScore() != null) {
			predicates.add(cb.equal(root.get("score"), filter.getScore()));
		}

		if (filter.getPrice() != null) {
			predicates.add(cb.equal(root.get("price"), filter.getPrice()));
		}

		if (filter.getCapacity() != null) {
			predicates.add(cb.equal(root.get("capacity"), filter.getCapacity()));
		}

		if (StringUtils.isNotBlank(filter.getProdDesc())) {
			predicates.add(cb.like(root.get("prodDesc"), "%" + filter.getProdDesc() + "%"));
		}

		if (filter.getMainIgdt() != null) {
			predicates.add(cb.equal(root.get("mainIgdt"), filter.getMainIgdt()));
		}

		if (filter.getConcentration() != null) {
			predicates.add(cb.equal(root.get("concentration"), filter.getConcentration()));
		}

		if (StringUtils.isNotBlank(filter.getProdImg())) {
			predicates.add(cb.like(root.get("prodImg"), "%" + filter.getProdImg() + "%"));
		}

		return predicates.isEmpty() ? cb.conjunction() : cb.and(toArray(predicates, Predicate.class));
	}

}
