package tw.com.queautiful.product.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.queautiful.product.entity.ExpDate;
import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.service.ExpDateService;
import tw.com.queautiful.product.service.ProductService;

@Controller
@RequestMapping("/expdate")
public class ExpDateController {

	
	@Autowired
	private ExpDateService expDateService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ExpDate expDate;
	
	@RequestMapping("/list")
	public String listPage(Model model,int MemberId) {
		
		List <Map> Dates =new ArrayList<Map>();

		List <Product> products =new ArrayList<Product>();
		
		
		List expDates=new ArrayList<ExpDate>();
		
		expDates=expDateService.getAll();
		
		for(int i=0;i<expDates.size();i++){

			
			Product product=products.get(i);
			products.add(product);
			//model.addAttribute("ProdName",product.getProdName());
			//model.addAttribute("ProdImg",product.getProdImg());
			
		}
		model.addAttribute("expDates",expDateService.getAll());
		//---------------------------------------------------------
		
		return "/expDate/expDateList";
	}
	
	@RequestMapping("/add")
	public String addPage() {
		return "/expDate/expDateAdd";
	}

	@RequestMapping("/edit")
	public String editPage() {
		return "/expDate/expDateEdit";
	}

	@RequestMapping("/delete")
	public String delete() {
		return "/list";
	}

}
