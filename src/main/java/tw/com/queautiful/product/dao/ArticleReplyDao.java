package tw.com.queautiful.product.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import tw.com.queautiful.product.entity.ArticleReply;

public interface ArticleReplyDao extends JpaRepository<ArticleReply, Long>, JpaSpecificationExecutor<ArticleReply>{

}

