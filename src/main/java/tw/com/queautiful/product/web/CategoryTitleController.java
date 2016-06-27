package tw.com.queautiful.product.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.product.entity.CategoryTitle;
import tw.com.queautiful.product.service.CategoryTitleService;

@Controller
@RequestMapping("/categorytitles")
public class CategoryTitleController {
	
	@Autowired
	private CategoryTitleService service;
	
	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("categorytitles", service.getAll());
		return "/categoryTitle/categoryTitleList";
	}
	
	@RequestMapping("/select")
	@ResponseBody
	public List<CategoryTitle> select() {
		return service.getAll();
	}
	
	@RequestMapping("/select_jqgrid")
	@ResponseBody
	public Page<CategoryTitle> select(@RequestParam Integer page, @RequestParam Integer rows) {
		Pageable pageable = new PageRequest(page, rows);
		Page<CategoryTitle> titlePage = service.getAll(pageable);
		return titlePage;
	}
	
	@RequestMapping("/add")
	public String addPage() {
		return "/categoryTitle/categoryTitleAdd";
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public CategoryTitle insert(@RequestBody CategoryTitle title) {
		service.insert(title);
		return title;
	}
	
	@RequestMapping("/edit")
	public String editPage() {
		return "/categoryTitle/categoryTitleEdit";
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public CategoryTitle update(@RequestBody CategoryTitle title) {
		service.update(title);
		return title;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(@RequestBody CategoryTitle title) {
		service.delete(title.getTitleId());
	}  
}
