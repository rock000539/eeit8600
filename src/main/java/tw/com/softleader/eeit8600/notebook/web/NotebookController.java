package tw.com.softleader.eeit8600.notebook.web;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.softleader.eeit8600.notebook.service.NotebookService;

@Controller
@RequestMapping("/notebooks")
public class NotebookController {

	@Autowired  //??
	private NotebookService notebookService;
	
		//http://**.**.**/notebooks/list
		@RequestMapping("/list")
		public String listPage(Model model){
			//prefix +string +suffix;
			//"WEB-INF/jsp/notebook/notebookList.jsp"
			
			model.addAttribute("notebooks", notebookService.getAll());
		
			return "/notebooks/notebooklist";
		}
}
