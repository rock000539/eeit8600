package tw.com.queautiful.product.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
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
		
		Pageable pageable = new PageRequest(page-1, rows);
		Page<CategoryTitle> titlePage = service.getAll(pageable);
		
		for(CategoryTitle categoryTitle : titlePage.getContent()) {
			log.debug("{}", categoryTitle);
		}
		
		return titlePage;
	}
	
	@RequestMapping("/add")
	public String addPage() {
		return "/categoryTitle/categoryTitleAdd";
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public CategoryTitle insert(@RequestBody CategoryTitle title) {
		System.out.println("insert");
		service.insert(title);
		return title;
	}
	
	@RequestMapping("/edit")
	public String editPage(@RequestParam Long titleId, Model model) {
		model.addAttribute("title", service.getById(titleId));
		return "/categoryTitle/categoryTitleEdit";
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public CategoryTitle update(@RequestBody CategoryTitle title) {
		System.out.println("update");
		service.update(title);
		return title;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(@RequestBody CategoryTitle title) {
		service.delete(title.getTitleId());
	}  
}
