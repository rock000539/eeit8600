package tw.com.queautiful.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BmsController {
	
	@RequestMapping("/bms")
	public String bmsPage(){
		return "/bms/bms";
	}
}
