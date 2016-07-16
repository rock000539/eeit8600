package tw.com.queautiful.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BmsController {
	
	@RequestMapping("/bms")
	public String bmsPage(){
		return "/bms";
	}
	@RequestMapping("/bms3")
	public String bms3Page(){
		return "/bms_v3/bms_v3";
	}
}
