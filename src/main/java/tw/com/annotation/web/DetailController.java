package tw.com.annotation.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.annotation.entity.Detail;
import tw.com.annotation.service.DetailService;

@Controller
@RequestMapping("/details")
public class DetailController {

	@Autowired
	private DetailService service;
	
	@RequestMapping("/select")
	@ResponseBody
	public List<Detail> select() {
		return service.getAll();
	}
	
}
