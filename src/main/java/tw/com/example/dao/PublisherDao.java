package tw.com.example.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.example.entity.Publisher;

public interface PublisherDao extends JpaRepository<Publisher, Long> {

}
