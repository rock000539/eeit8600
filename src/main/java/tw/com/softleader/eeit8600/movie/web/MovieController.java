package tw.com.softleader.eeit8600.movie.web;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	public String insert(@RequestParam String name,@RequestParam String actor,
			@RequestParam String genre, @RequestParam String rating, Model model){
		Map<String, String> errorMsg = validateData(name, actor, genre, rating); 
		if(!errorMsg.isEmpty()){
			model.addAttribute("errorMsg", errorMsg);
			return "/movie/movieAdd";
		}
		Movie movie = new Movie(name, actor, genre, Double.parseDouble(rating));
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
	public String update(@RequestParam Long id, @RequestParam String name,
			@RequestParam String actor, @RequestParam String genre, 
			@RequestParam String rating, Model model){
		System.out.println(id);
		Map<String, String> errorMsg = validateData(name, actor, genre, rating); 
		if(!errorMsg.isEmpty()){
			model.addAttribute("errorMsg", errorMsg);
			System.out.println(id);
			return "forward:/movies/edit?id="+id;
		}
		Movie movie = movieService.getById(id);
		movie.setActor(actor);
		movie.setGenre(genre);
		movie.setName(name);
		movie.setRating(Double.parseDouble(rating));
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
	
	@RequestMapping("/name")
	public String findByName(@RequestParam String data, Model model){
		Collection<Movie> movies = movieService.findByName(data);
		if(movies.isEmpty()){
			String msg = "sorry, we find nothing";
			model.addAttribute("result", msg);
			return "/movie/movieList";
		}else{
			model.addAttribute("movies", movies);
			return "/movie/movieList";
		}
	}
	
	@RequestMapping("/actor")
	public String findByActor(@RequestParam String data, Model model){
		Collection<Movie> movies = movieService.findByActor(data);
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
		if(movies.isEmpty()){
			String msg = "sorry, we find nothing";
			model.addAttribute("result", msg);
			return "/movie/movieList";
		}else{
			model.addAttribute("movies", movies);
			return "/movie/movieList";
		}
	}
	
	@RequestMapping("/loadData")
	public String loadData(){
		movieService.addSomeData();
		return "redirect:/movies/list";
	}
	
	private Map<String, String> validateData(String name, String actor, 
			String genre, String rating){
		Map<String, String> errorMsg = new HashMap<String, String>();
		
		if(name==null || name.trim().length()==0){
			errorMsg.put("nameError", "請填入電影名稱");
		}
		if(actor==null || actor.trim().length()==0){
			errorMsg.put("actorError", "請填入演員欄位");
		}
		if(genre==null || genre.trim().length()==0){
			errorMsg.put("genreError", "請填入類型欄位");
		}
		if(rating==null || rating.trim().length()==0 || 
				!rating.matches("^(10|\\d)(\\.\\d{1,2})?$")){
			errorMsg.put("ratingError", "評分欄位錯誤(0-10數字，小數點1位)");
		}
		return errorMsg;
	}
}
