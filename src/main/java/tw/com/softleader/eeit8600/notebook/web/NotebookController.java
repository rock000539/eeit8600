package tw.com.softleader.eeit8600.notebook.web;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tw.com.softleader.eeit8600.notebook.entity.Notebook;
import tw.com.softleader.eeit8600.notebook.service.NotebookService;

@Controller
@RequestMapping("/notebooks")
public class NotebookController {

	@Autowired  //new一個物件注入進來
	private NotebookService notebookService;
	 
	
	
	
		//http://**.**.**/notebooks/list
		@RequestMapping("/list")
		public String listPage(Model model){
			//prefix +string +suffix;
			//"WEB-INF/jsp/notebook/notebookList.jsp"
			
			model.addAttribute("notebooks", notebookService.getAll());
			return "/notebook/notebookList";
		}
		
		
		@RequestMapping(value="/edit")
		public String editPage(@RequestParam Long id,Model model){
			model.addAttribute("notebook", notebookService.getById(id));
			return "/notebook/notebookEdit";
		}
		
		@RequestMapping(value="/update",method = RequestMethod.POST)
		public String update(@RequestParam Long id,@RequestParam String brand,@RequestParam String name,
				@RequestParam String cpu,@RequestParam Integer price,Model model,RedirectAttributes attr){
			
			System.out.println(id);
			
			Map<String,String> errorMsg = verifyData(brand,name,cpu, price);
			if(!errorMsg.isEmpty()){
				System.out.println("error");
				model.addAttribute("errorMsg", errorMsg);
				model.addAttribute("result", "Fail");
				return "forward:/notebooks/edit?id"+id;
			}
			
			Notebook notebook =new Notebook();
			notebook.setId(id);
			notebook.setBrand(brand);
			notebook.setName(name);
			notebook.setCpu(cpu);
			notebook.setPrice(price);
			
			
			notebookService.update(notebook);

			
			attr.addAttribute("id", notebook.getId());
			attr.addFlashAttribute("notebook", notebook);
			attr.addFlashAttribute("result", "Success");
			
			return "redirect:/notebooks/edit";
		}
		
		
		private Map<String, String> verifyData(String brand, String name,
				String cpu, Integer price) {
		
			Map<String,String> errorMsg = new HashMap<String,String>();
			if(brand == null||brand.trim().length()==0){
				errorMsg.put("brandError", "請填入品牌欄位");
			}
			if(name == null||name.trim().length()==0){
				errorMsg.put("nameError", "請填入品名欄位");
			}
			if(cpu == null||cpu.trim().length()==0){
				errorMsg.put("cpuError", "請填入中央處理器欄位");
			}
			if(price==null){
				errorMsg.put("priceError", "請填入價格欄位");
			}
			return errorMsg;
		}

		@RequestMapping("/delete")
		public String delete(Long id, Model model){
			notebookService.delete(id);
			return "redirect:/notebooks/list";
		}
		
		
		@RequestMapping("/add")
		public String addPage(){
			return "/notebook/notebookAdd";
		}
		
		@RequestMapping(value= "/insert", method = RequestMethod.POST)
		public String insert(@RequestParam String brand,@RequestParam String name,@RequestParam String cpu,
				@RequestParam Integer price,Model model,RedirectAttributes attr){
			
				// 驗證資料	
			Map<String,String> errorMsg = verifyData(brand,name,cpu, price);
			if(!errorMsg.isEmpty()){  
		
				model.addAttribute("errorMsg", errorMsg);
				model.addAttribute("result", "Fail");
				return "forward:/notebooks/add";
			}
			
			// 轉換並封裝資料
			Notebook notebook =new Notebook();
			notebook.setBrand(brand);
			notebook.setName(name);
			notebook.setCpu(cpu);
			notebook.setPrice(price);
			
			// 新增到資料庫
			notebookService.insert(notebook);
			
			// 傳回成功的相關訊息
			attr.addFlashAttribute("notebook",notebook);
			attr.addFlashAttribute("result", "Success");
			
			return "redirect:/notebooks/add";
		}
		
}
