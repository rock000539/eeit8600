package tw.com.annotation.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.annotation.entity.Publisher;
import tw.com.annotation.service.PublisherService;

@Controller
@RequestMapping("/publishers")
public class PublisherController {
	
	@Autowired
	private PublisherService service;
	
	@RequestMapping("/select")
	@ResponseBody
	public List<Publisher> select() {
		return service.getAll();
	}
	
}
