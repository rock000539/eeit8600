package tw.com.softleader.eeit8600.game.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tw.com.softleader.eeit8600.game.entity.Game;
import tw.com.softleader.eeit8600.game.service.GameService;

@Controller
@RequestMapping("/games")
public class GameController {

	@Autowired
	private GameService gameService;

	// http://***/games/list
	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("games", gameService.getAll());
		// 自動在前後加上resources/application.properties中的prefix和suffix成為完整路徑
		// /WEB-INF/jsp/game/gameList.jsp
		return "/game/gameList";
	}

	@RequestMapping("/add")
	public String addPage() {
		return "/game/gameAdd";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(@RequestParam String name, @RequestParam String evalu, @RequestParam String dl,
			@RequestParam String url, Model model, RedirectAttributes attr) {
		
		// 接收資料
		String[] data = { name, evalu, dl, url };

		// 驗證資料
		Map<String, String> errorMsg = verifyData(data);
		if (!errorMsg.isEmpty()) { // 傳回失敗的相關訊息
			model.addAttribute("errorMsg", errorMsg);
			model.addAttribute("result", "Fail");
			return "forward:/games/add";
		}

		// 轉換並封裝資料
		Game game = new Game();
		game.setName(name);
		game.setEvaluation(Integer.parseInt(evalu));
		game.setDownload(Integer.parseInt(dl));
		game.setUrl(url);

		// 新增到資料庫
		gameService.insert(game);

		// 傳回成功的相關訊息
		attr.addFlashAttribute("game", game);
		attr.addFlashAttribute("result", "Success");

		return "redirect:/games/add";
	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam Long id, Model model) {
		model.addAttribute("game", gameService.getById(id));
		return "/game/gameEdit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@RequestParam Long id, @RequestParam String name, @RequestParam String evalu,
			@RequestParam String dl, @RequestParam String url, Model model, RedirectAttributes attr) {

		// 接收資料
		String[] data = { name, evalu, dl, url };

		// 驗證資料
		Map<String, String> errorMsg = verifyData(data);
		if (!errorMsg.isEmpty()) {
			System.out.println("error");
			model.addAttribute("errorMsg", errorMsg);
			model.addAttribute("result", "Fail");
			return "forward:/games/edit?id="+id;
		}

		// 轉換並封裝資料
		Game game = new Game();
		game.setId(id);
		game.setName(name);
		game.setEvaluation(Integer.parseInt(evalu));
		game.setDownload(Integer.parseInt(dl));
		game.setUrl(url);

		// 更新到資料庫
		gameService.update(game);

		// 傳回成功的相關訊息
		attr.addAttribute("id", game.getId());
		attr.addFlashAttribute("game", game);
		attr.addFlashAttribute("result", "Success");
		
		return "redirect:/games/edit";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam Long id) {
		gameService.delete(id);
		return "redirect:/games/list";
	}
	
	@RequestMapping("/init")
	public String init(){
		if(gameService.getAll().isEmpty()){
			gameService.initData();
		}
		return "redirect:/games/list";
	}

	private Map<String, String> verifyData(String[] data) {

		Map<String, String> errorMsg = new HashMap<>();

		if (data[0].trim().length() == 0) {
			errorMsg.put("name", "請輸入正確的名稱 (不可空白)");
		}

		if (data[1].trim().length() == 0 || !data[1].matches("^[0-9]*$")) {
			errorMsg.put("evalu", "請輸入正確的評價 (不可空白或非數字)");
		}

		if (data[2].trim().length() == 0 || !data[2].matches("^[0-9]*$")) {
			errorMsg.put("dl", "請輸入正確的下載量 (不可空白或非數字)");
		}

		if (data[3].trim().length() == 0) {
			errorMsg.put("url", "請輸入正確的連結 (不可空白)");
		}

		return errorMsg;
	}
}
