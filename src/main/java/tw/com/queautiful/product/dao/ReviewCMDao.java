package tw.com.queautiful.product.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import tw.com.queautiful.product.entity.ReviewCM;

public interface ReviewCMDao extends JpaRepository<ReviewCM,Long>, JpaSpecificationExecutor<ReviewCM>{

}
