package tw.com.queautiful.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FmsController {
	
	@RequestMapping("/fms")
	public String fmsPage(){
		return "/fms";
	}
	@RequestMapping("/indexfms")
	public String indexfmsPage(){
		return "/indexfms";
	}
	
	@RequestMapping("/indexjr")
	public String indexjrPage(){
		return "/indexjr";
	}
	
}
