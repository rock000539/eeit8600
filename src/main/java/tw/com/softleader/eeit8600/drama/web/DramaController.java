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
	public String insert(String name, String episodes, String actor, String channel) {

		return "/drama/dramaAdd";
	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam Long id, Model model) {
		model.addAttribute("drama", dramaService.getById(id));
		return "/drama/dramaEdit";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update() {
		return "/drama/dramaEdit";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam Long id) {
		dramaService.delete(dramaService.getById(id));
		return "redirect:/dramas/list";
	}

	public Map<String, String> validateData(Drama drama) {
		Map<String, String> errorMsg = new HashMap<String, String>();

		return errorMsg;
	}

}
