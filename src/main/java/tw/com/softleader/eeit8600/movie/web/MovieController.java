package tw.com.softleader.eeit8600.movie.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.softleader.eeit8600.movie.service.MovieService;
@Controller
@RequestMapping("/movies")
public class MovieController {
	@Autowired
	private MovieService movieService;
	
	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("movies", movieService.getAll());
		
		return "/movie/movieList";
	}
}
