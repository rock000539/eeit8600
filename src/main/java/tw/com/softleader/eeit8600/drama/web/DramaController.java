package tw.com.softleader.eeit8600.drama.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.softleader.eeit8600.drama.entity.Drama;
import tw.com.softleader.eeit8600.drama.service.DramaService;

@Controller
@RequestMapping("/dramas")
public class DramaController {
	@Autowired
	private DramaService dramaService;

	// http://**.**.**/dramas/list
	@RequestMapping("/list")
	public String listPage(Model model) {
		// prefix + string + suffix;
		// "/WEB-INF/jsp/drama/dramaList.jsp
		model.addAttribute("dramas", dramaService.getAll());
		return "/drama/dramaList";
	}

	@RequestMapping("/add")
	public String addPage() {
		return "/drama/dramaAdd";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(@RequestParam String name, @RequestParam String episodes, @RequestParam String actor,
			@RequestParam String channel, Model model) {

		String[] data = { name, episodes, actor, channel };
		Map<String, String> errorMsg = validateData(data);
		if (!errorMsg.isEmpty()) {
			model.addAttribute("errorMsg", errorMsg);
			return "forward:/dramas/add";
		}
		Drama drama = new Drama(name, Integer.valueOf(episodes), actor, Integer.valueOf(channel));
		dramaService.insert(drama);
		return "redirect:/dramas/add";
	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam Long id, Model model) {
		model.addAttribute("drama", dramaService.getById(id));
		return "/drama/dramaEdit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(
			@RequestParam Long id, @RequestParam String name, @RequestParam String episodes,
			@RequestParam String actor, @RequestParam String channel, Model model
			) {

		String[] data = { name, episodes, actor, channel };
		Map<String, String> errorMsg = validateData(data);
		if (!errorMsg.isEmpty()) {
			model.addAttribute("errorMsg", errorMsg);
			return "forward:/dramas/edit?id="+id;
		}
		Drama drama = new Drama();
		drama.setId(id);
		drama.setName(name);
		drama.setEpisodes(Integer.valueOf(episodes));
		drama.setActor(actor);
		drama.setChannel(Integer.valueOf(channel));
		dramaService.update(drama);
		model.addAttribute("drama",drama);

		return "redirect:/dramas/list";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam Long id) {
		dramaService.delete(dramaService.getById(id));
		return "redirect:/dramas/list";
	}

	public Map<String, String> validateData(String[] data) {
		Map<String, String> errorMsg = new HashMap<String, String>();

		if (data[0] == null || data[0].trim().length() == 0) {
			errorMsg.put("name", "請輸入劇名");
		}
		if (data[1] == null || data[1].trim().length() == 0) {
			errorMsg.put("episodes", "請輸入集數");
		} else {
			try {
				int epis = Integer.parseInt(data[1].trim());
			} catch (NumberFormatException e) {
				errorMsg.put("episodes", "集數必須為數字");
			}
		}
		if (data[2] == null || data[2].trim().length() == 0) {
			errorMsg.put("actor", "請輸入主演");
		}
		if (data[3] == null || data[3].trim().length() == 0) {
			errorMsg.put("channel", "請輸入頻道");
		} else {
			try {
				int chan = Integer.parseInt(data[3].trim());
			} catch (NumberFormatException e) {
				errorMsg.put("channel", "頻道必須為數字");
			}
		}
		return errorMsg;
	}

}
