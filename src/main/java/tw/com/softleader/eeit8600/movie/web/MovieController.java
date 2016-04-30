package tw.com.softleader.eeit8600.movie.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.com.softleader.eeit8600.movie.entity.Movie;
import tw.com.softleader.eeit8600.movie.service.MovieService;

@Controller
@RequestMapping("/movies")
public class MovieController {
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private Movie movie;
	
	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("movies", movieService.getAll());
		return "/movie/movieList";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String addPage(){
		return "/movie/movieAdd";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String insert(Model model){
		//model.addAttribute("insert", movieService.insert(movie);)
		return "/movie/movieAdd";
	}
	
	@RequestMapping("/edit")
	public String editPage(Model model){
		
		return "movie/movieEdit";
	}
	
	@RequestMapping("/update")
	public String update(Model model){
		
		return "movie/movieEdit";
	}
	
	@RequestMapping("/delete")
	public String delete(Model model){
		
		return "movie/movieList";
	}
	
}
