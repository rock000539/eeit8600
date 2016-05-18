package tw.com.softleader.eeit8600.game.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@ResponseBody
	public Map<String, String> insert(@RequestBody Game game) {
		
		// 接收資料
		String[] data = { 
				game.getName(), 
				game.getEvaluation().toString(), 
				game.getDownload().toString(),
				game.getUrl() 
		};

		// 驗證資料
		Map<String, String> errorMsg = verifyData(data);
		if (!errorMsg.isEmpty()) { // 傳回失敗的相關訊息
			errorMsg.put("result", "Fail");
			return errorMsg;
		}

		// 轉換並封裝資料
		Game temp = new Game();
		temp.setName(game.getName());
		temp.setEvaluation(game.getEvaluation());
		temp.setDownload(game.getDownload());
		temp.setUrl(game.getUrl());

		// 新增到資料庫
		gameService.insert(temp);

		// 傳回成功的相關訊息
		Map<String, String> successMsg = new HashMap<>();
		successMsg.put("id", temp.getId().toString());
		successMsg.put("name", temp.getName());
		successMsg.put("evalu", temp.getEvaluation().toString());
		successMsg.put("dl", temp.getDownload().toString());
		successMsg.put("url", temp.getUrl());
		successMsg.put("result", "Success");
		
		return successMsg;
	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam Long id, Model model) {
		model.addAttribute("game", gameService.getById(id));
		return "/game/gameEdit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> update(@RequestBody Game game) {

		// 接收資料
		String[] data = { 
				game.getName(), 
				game.getEvaluation().toString(),
				game.getDownload().toString(),
				game.getUrl()
		};

		// 驗證資料
		Map<String, String> errorMsg = verifyData(data);
		if (!errorMsg.isEmpty()) {
			return errorMsg;
		}

		// 轉換並封裝資料
		Game temp = new Game();
		temp.setId(game.getId());
		temp.setName(game.getName());
		temp.setEvaluation(game.getEvaluation());
		temp.setDownload(game.getDownload());
		temp.setUrl(game.getUrl());

		// 更新到資料庫
		gameService.update(temp);

		// 傳回成功的相關訊息
		Map<String, String> successMsg = new HashMap<>();
		successMsg.put("id", temp.getId().toString());
		successMsg.put("name", temp.getName());
		successMsg.put("evalu", temp.getEvaluation().toString());
		successMsg.put("dl", temp.getDownload().toString());
		successMsg.put("url", temp.getUrl());
		successMsg.put("result", "Success");

		return successMsg;
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam Long id) {
		gameService.delete(id);
		return "redirect:/games/list";
	}

	private Map<String, String> verifyData(String data[]) {

		Map<String, String> errorMsg = new HashMap<>();

		if (data[0] == null || data[0].trim().length() == 0) {
			errorMsg.put("name", "請輸入正確的名稱 (不可空白)");
		}

		try {
			Integer.parseInt(data[1]);
		} catch (NumberFormatException e) {
			errorMsg.put("evalu", "請輸入正確的評價 (不可空白或非數字)");
		}

		try {
			Integer.parseInt(data[2]);
		} catch (NumberFormatException e) {
			errorMsg.put("dl", "請輸入正確的下載量 (不可空白或非數字)");
		}

		if (data[3].trim().length() == 0) {
			errorMsg.put("url", "請輸入正確的連結 (不可空白)");
		}

		return errorMsg;
	}
}
