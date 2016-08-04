package tw.com.queautiful.product.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.queautiful.product.entity.Brand;
import tw.com.queautiful.product.entity.Category;
import tw.com.queautiful.product.entity.ExpDate;
import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.service.BrandService;
import tw.com.queautiful.product.service.CategoryService;
import tw.com.queautiful.product.service.ExpDateSearchService;
import tw.com.queautiful.product.service.ExpDateService;
import tw.com.queautiful.product.service.ProductService;

@Controller
@RequestMapping("/expdate")
public class ExpDateController
{

    @Autowired
    private ExpDateService expDateService;
    @Autowired
    private ProductService productService;
    @Autowired
    private BrandService brandService;
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ExpDateSearchService expDateSearchService;

    @RequestMapping("/search")
    public String search(Model model)
    {

        List<Brand> brands = new ArrayList<Brand>();
        List<Category> categorys = new ArrayList<Category>();
        brands = brandService.getAll();
        categorys= categoryService.getAll();
        model.addAttribute("Brands", brands);
        model.addAttribute("categorys", categorys);
        return "/expDate/expDateSearch";
    }
    
    @RequestMapping("/reloadsearch")
    public String reloadSearch(Model model,String reloadBatchCode,
    		String brandId,@RequestParam long pd,@RequestParam String mfdStr,@RequestParam String expStr,
    		HttpServletRequest request)
    {
    	List<Category> categorys = new ArrayList<Category>();
        List<Brand> brands = new ArrayList<Brand>();
        brands = brandService.getAll();
        categorys= categoryService.getAll();
        model.addAttribute("Brands", brands);
        model.addAttribute("reloadBrandId", brandId);
        model.addAttribute("reloadBatchCode", reloadBatchCode);
        model.addAttribute("categorys", categorys);
        
        
        long memberId=(long) request.getSession().getAttribute("memberId");
        ExpDate date=new ExpDate();
        date.setBatchCode(reloadBatchCode);
        date.setMemberId(memberId);
        
        java.sql.Date exp;
		java.sql.Date Mfd;
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
			java.util.Date formatDate = dateFormat.parse(expStr);
			exp = new java.sql.Date(formatDate.getTime());
			formatDate = dateFormat.parse(mfdStr);
			Mfd = new java.sql.Date(formatDate.getTime());
	        date.setMfd(Mfd);
	        date.setExp(exp);
		} catch (ParseException e) {
			e.printStackTrace();
		}
        date.setProId(pd);

        expDateService.update(date);
        return "/expDate/expDateSearch";
    }

    @RequestMapping("/batchCodeController")
    @ResponseBody
    public Map<String, Object> searchResult(Model model, @RequestParam String brandIdstr,
            @RequestParam String batchCode)
    {

        int brandId = Integer.valueOf(brandIdstr);

        Map<String, Object> result = expDateSearchService.compute(brandId, batchCode);

        return result;
    }

    @RequestMapping("/list")
    public String listPage(Model model, HttpServletRequest request)
    {

    	 String username = SecurityContextHolder.getContext().getAuthentication().getName();
        

        List<Map> result = new ArrayList<Map>();

        List<ExpDate> expDates = expDateService.getAll();
        
        long memberId= 0;
        
        if(request.getSession().getAttribute("memberId")!= null){
            
        memberId = (long) request.getSession().getAttribute("memberId");
        
        }
        

        for (int i = 0; i < expDates.size(); i++)
        {

            ExpDate expDate = expDates.get(i);

            if (expDate.getMemberId() == memberId)
            {
                Map<String, Object> beansMap = new HashMap<String, Object>();
                long j = expDate.getProId();
                Product product = productService.getById(j);

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
                String mfd = dateFormat.format(expDate.getMfd());
                String exp = dateFormat.format(expDate.getExp());

                beansMap.put("expDate", expDate);
                beansMap.put("product", product);
                beansMap.put("mfd", mfd);
                beansMap.put("exp", exp);

                result.add(beansMap);

                System.out.println(result);
            }

        }

        model.addAttribute("beans", result);

        return "/expDate/expDateList";
    }
    
    

    @RequestMapping("/add")
    public String addPage()
    {
        return "/expDate/expDateAdd";
    }

    @RequestMapping(value = "/post", method = RequestMethod.POST)
    @ResponseBody
    public String post(Model model, HttpServletRequest request, @RequestParam String proIdStr,
            @RequestParam String mfdStr, @RequestParam String expStr,@RequestParam String batchCode)
    {

        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println("username is " + username);
        long memberId = (long) request.getSession().getAttribute("memberId");
        System.out.println("in post");

        try
        {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
            java.util.Date formatDate = dateFormat.parse(expStr);
            java.sql.Date exp = new java.sql.Date(formatDate.getTime());
            formatDate = dateFormat.parse(mfdStr);
            java.sql.Date Mfd = new java.sql.Date(formatDate.getTime());

            long proId = Long.valueOf(proIdStr);
            Product product = productService.getById(proId);
            ExpDate expDate = new ExpDate();
            expDate.setProId(proId);
            expDate.setExp(exp);
            expDate.setMfd(Mfd);
            expDate.setBatchCode(batchCode);
            expDate.setMemberId(memberId);
            expDateService.insert(expDate);
            //*---------------------------------
            System.out.println("finish insert");
            System.out.println(expDateService.getAll());
            //-----------------------------------
            String successMSG = "成功新增一筆產品: " + product.getProdName() + "到您的收藏清單";
            return successMSG;
        }
        catch (NumberFormatException e)
        {
            String successMSG = "發生不可預期的錯誤1";
            e.printStackTrace();
            return successMSG;
        }
        catch (ParseException e)
        {
            String successMSG = "發生不可預期的錯誤2";
            e.printStackTrace();
            return successMSG;
        }

    }

    @RequestMapping("/edit")
    public String editPage()
    {
        return "/expDate/expDateEdit";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(String dateIdStr)
    {
        System.out.println("start delete");
        long dateId = Long.parseLong(dateIdStr);
        expDateService.delete(dateId);
        String successMSG = "success";
        return successMSG;
    }

}
