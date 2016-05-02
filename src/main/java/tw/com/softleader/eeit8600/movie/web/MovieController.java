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
	
	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("movies", movieService.getAll());
		return "/movie/movieList";
	}
	
	@RequestMapping("/add")
	public String addPage(){
		return "/movie/movieAdd";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String insert(Movie movie, Model model){
		movieService.insert(movie);
		model.addAttribute("msg", "added : ");
		model.addAttribute("result", movieService.getById(movie.getId()));
		return "/movie/movieAdd";
	}
	
	@RequestMapping(value="/edit")
	public String editPage(Long id, Model model){
		model.addAttribute("movie", movieService.getById(id));
		System.out.println(movieService.getById(id));
		return "/movie/movieEdit";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(Movie movie, Model model){
		movieService.update(movie);
		model.addAttribute("msg", "update : ");
		model.addAttribute("result", movieService.getById(movie.getId()));
		return "/movie/movieEdit";
	}
	
	@RequestMapping("/delete")
	public String delete(Long id, Model model){
		movieService.delete(id);
		return "redirect:/movies/list";
	}
	
	@RequestMapping("/loadData")
	public String loadData(){
		movieService.addSomeData();
		return "redirect:/movies/list";
	}
}