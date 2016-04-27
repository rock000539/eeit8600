package tw.com.softleader.eeit8600.music.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.softleader.eeit8600.music.service.MusicService;


@Controller
@RequestMapping("/musics")
public class MusicController{

	@Autowired
	private MusicService musicService;

	// http://**.**.**/muiscs/list
	@RequestMapping("/list")
	public String listPage(Model model) {
	
		model.addAttribute("musics", musicService.getAll() );
		
		return "/music/musicList"; 
	}

}
