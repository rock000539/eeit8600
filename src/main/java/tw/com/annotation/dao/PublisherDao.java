package tw.com.annotation.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.annotation.entity.Publisher;

public interface PublisherDao extends JpaRepository<Publisher, Long> {

}
