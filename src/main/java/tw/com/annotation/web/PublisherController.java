package tw.com.annotation.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.annotation.entity.Book;
import tw.com.annotation.entity.Publisher;
import tw.com.annotation.service.PublisherService;

@Controller
@RequestMapping("/publishers")
public class PublisherController {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PublisherService service;
	
	@RequestMapping("/select")
	@ResponseBody
	public List<Publisher> select() {
		List<Publisher> list = service.getAll();
		for(Publisher publisher : list) {
			log.info("{}", publisher.getBooks());
		}
		return list;
	}
	
}
