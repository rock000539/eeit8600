package tw.com.queautiful.product.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import tw.com.queautiful.commons.enums.ArticleType;
import tw.com.queautiful.product.entity.Article;
import tw.com.queautiful.product.entity.Member;

public interface ArticleDao extends JpaRepository<Article, Long>, JpaSpecificationExecutor<Article> {

//	List<Article> findByOrderByArticleTimeDesc();
//	Page<Article> findByOrderByArticleTimeDesc(Pageable pageable);
//	Page<Article> findByOrderByArticleTimeDesc(Specification<Article> spec, Pageable pageable);
	
	List<Article> findByMember(Member member);
	List<Article> findTop5ByOrderByArticleTimeDesc();
	
	Long countByMemberAndArticleType(Member member, ArticleType articleType);
}
