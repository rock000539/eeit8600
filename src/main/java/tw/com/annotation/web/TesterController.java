package tw.com.annotation.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.annotation.entity.Tester;
import tw.com.annotation.service.TesterService;

@Controller
@RequestMapping("/testers")
public class TesterController {
	
	@Autowired
	private TesterService service;
	
	@RequestMapping("/select")
	@ResponseBody
	public List<Tester> select() {
		return service.getAll();
	}
}
