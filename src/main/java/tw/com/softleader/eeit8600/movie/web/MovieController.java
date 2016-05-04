package tw.com.softleader.eeit8600.movie.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		Map<String, String> errorMsg = validateData(movie); 
		if(!errorMsg.isEmpty()){
			model.addAttribute("errorMsg", errorMsg);
			model.addAttribute("movie", movie);
			return "/movie/movieAdd";
		}
		movieService.insert(movie);
		model.addAttribute("msg", "added : ");
		model.addAttribute("result", movieService.getById(movie.getId()));
		return "/movie/movieAdd";
	}
	
	@RequestMapping(value="/edit")
	public String editPage(Long id, Model model){
		model.addAttribute("movie", movieService.getById(id));
		return "/movie/movieEdit";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(Movie movie, Model model){
		Map<String, String> errorMsg = validateData(movie); 
		if(!errorMsg.isEmpty()){
			model.addAttribute("errorMsg", errorMsg);
			model.addAttribute("movie", movie);
			return "/movie/movieEdit";
		}
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
	
	
	@RequestMapping("/actor")
	public String findByActor(@RequestParam String data, Model model){
		List<Movie> movies = movieService.findByActor(data);
		System.out.println(data);
		if(movies.isEmpty()){
			String msg = "sorry, we find nothing";
			model.addAttribute("result", msg);
			return "/movie/movieList";
		}else{
			model.addAttribute("movies", movies);
			return "/movie/movieList";
		}
	}
	
	@RequestMapping("/genre")
	public String findByGenre(@RequestParam String data, Model model){
		List<Movie> movies = movieService.findByGenre(data);
		System.out.println(data);
		if(movies.isEmpty()){
			String msg = "sorry, we find nothing";
			model.addAttribute("result", msg);
			System.out.println("no result");
			return "/movie/movieList";
		}else{
			model.addAttribute("movies", movies);
			System.out.println("find");
			return "/movie/movieList";
		}
	}
	
	@RequestMapping("/loadData")
	public String loadData(){
		movieService.addSomeData();
		return "redirect:/movies/list";
	}
	
	private Map<String, String> validateData(Movie movie){
		Map<String, String> errorMsg = new HashMap<String, String>();
		System.out.println(movie);
		String name = movie.getName();
		String actor = movie.getActor();
		String genre = movie.getGenre();
		if(name==null || name.trim().length()==0){
			errorMsg.put("nameError", "請填入電影名稱");
		}
		if(actor==null || actor.trim().length()==0){
			errorMsg.put("actorError", "請填入演員欄位");
		}
		if(genre==null || genre.trim().length()==0){
			errorMsg.put("genreError", "請填入類型欄位");
		}
		System.out.println(errorMsg.values());
		return errorMsg;
	}
}
