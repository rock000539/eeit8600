package tw.com.softleader.eeit8600.game.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.softleader.eeit8600.game.service.GameService;

@Controller // 成為Controller
@RequestMapping("/games")
public class GameController {
	
	@Autowired
	private GameService gameService;
	
	// http://***/games/list
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("games", gameService.getAll());
		// 自動在前後加上resources/application.properties中的prefix和suffix成為完整路徑
		// /WEB-INF/jsp/game/gameList.jsp
		return "/game/gameList";
	}
	
	@RequestMapping("/add")
	public String addPage(){
		return "/game/gameAdd";
	}
	
	//@RequestMapping("/add")
	public String insert(){
		return "/game/gameAdd";
	}
	
	@RequestMapping("/edit")
	public String editPage(){
		return "/game/gameEdit";
	}
	
	//@RequestMapping("/edit")
	public String update(){
		return "/game/gameEdit";
	}
	
	//@RequestMapping("/list")
	public String delete(){
		return "/game/gameList";
	}
}
