package tw.com.queautiful.commons.util;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.metamodel.Attribute;
import javax.persistence.metamodel.EntityType;
import javax.persistence.metamodel.SingularAttribute;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.ReflectionUtils;

public class Spec {

	public static <T> Specification<T> byAuto(final EntityManager entityManager, final T example) {

		final Class<T> type = (Class<T>) example.getClass();

		return new Specification<T>() {

			@Override
			public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

				List<Predicate> predicates = new ArrayList<>();
				EntityType<T> entityType = entityManager.getMetamodel().entity(type);
				
				for (Attribute<T, ?> attr : entityType.getDeclaredAttributes()) {
					Object attrValue = getValue(example, attr);
					
					if (attrValue != null) {
						if (attr.getJavaType() == String.class) {
							if (StringUtils.isNotEmpty(attrValue.toString())) {
								predicates.add(cb.like(root.get(attribute(entityType, attr.getName(), String.class)),
										pattern((String) attrValue)));
							}
						} else {
							predicates.add(cb.equal(
									root.get(attribute(entityType, attr.getName(), attrValue.getClass())), attrValue));
						}
					}
				}

				return cb.and(predicates.toArray(new Predicate[predicates.size()]));
			}

			private <T> Object getValue(T example, Attribute<T, ?> attr) {
				return ReflectionUtils.getField((Field) attr.getJavaMember(), example);
			}

			private <E, T> SingularAttribute<T, E> attribute(EntityType<T> entityType, String fieldName,
					Class<E> fieldClass) {
				return entityType.getDeclaredSingularAttribute(fieldName, fieldClass);
			}

		};

	}

	static private String pattern(String str) {
		return "%" + str + "%";
	}

}
