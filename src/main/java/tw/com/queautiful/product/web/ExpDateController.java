package tw.com.queautiful.product.web;

import java.text.*;
import java.util.*;

import javax.annotation.security.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.security.config.annotation.method.configuration.*;
import org.springframework.security.core.context.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.util.*;
import org.springframework.web.bind.annotation.*;

import tw.com.queautiful.product.entity.*;
import tw.com.queautiful.product.service.*;

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
    private MemberService memberService;

    @Autowired
    private ExpDateSearchService expDateSearchService;

    @RequestMapping("/search")
    public String search(Model model)
    {
        List<Brand> brands = new ArrayList<Brand>();
        brands = brandService.getAll();
        System.out.println(brands);
        model.addAttribute("Brands", brands);
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
        System.out.println("username is " + username);


        List<Map> result = new ArrayList<Map>();

        List<ExpDate> expDates = expDateService.getAll();
        
        long memberId= 0;
        
        if(request.getSession().getAttribute("memberId")!= null){
            
        memberId = (long) request.getSession().getAttribute("memberId");
        
        }else{
        //        if(memberId==null){
        //            System.out.println("in cookie");
        //            List<Member> members = memberService.getAll();
        //            Cookie[] cookies = request.getCookies();
        //            System.out.println(cookies);//----------------------------
        //            for (Cookie cookie : cookies) {
        //                System.out.println("cookie.getName()=="+cookie.getValue());
        //                for(int i=0;i<members.size();i++){
        //                   Member member = members.get(i);
        //                if (cookie.getValue().equals(member.getEmail())) {
        //                    System.out.println("222cookie.getName()=="+cookie.getName());//-------------------
        //                    memberId=member.getMemberId();
        //                    System.out.println(member.getMemberId());//---------------------------------
        //                    break;
        //                }
        //                }
        //            }
        //        }
        }
        
        System.out.println(expDates.size() + " " + expDates);

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
            @RequestParam String mfdStr, @RequestParam String expStr)
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

    @PostAuthorize("hasPermission('USER', 'parker')")
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(String dateIdStr)
    {
        System.out.println("start delete");
        long dateId = Long.parseLong(dateIdStr);
        expDateService.delete(dateId);
        String successMSG = "刪除資料成功";
        return successMSG;
    }

}
