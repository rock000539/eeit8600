package tw.com.queautiful.product.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.com.queautiful.commons.util.EmailSender;
import tw.com.queautiful.commons.util.FileProcessing;
import tw.com.queautiful.product.entity.Article;
import tw.com.queautiful.product.entity.ExpDate;
import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.entity.Review;
import tw.com.queautiful.product.service.ArticleService;
import tw.com.queautiful.product.service.BrandService;
import tw.com.queautiful.product.service.ExpDateService;
import tw.com.queautiful.product.service.MemberService;
import tw.com.queautiful.product.service.ProductService;

@Controller
@RequestMapping("/members")
public class MemberController {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MemberService service;
	@Autowired
	private EmailSender mailSender;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ExpDateService expDateService;
	@Autowired
	private ProductService productService;
	@Autowired
	private BrandService brandService;
	
	@RequestMapping("/personal")
	public String memberPersonalPage(Model model){
		Long memberId = 1L; //test
		Member member = service.getById(memberId);
		model.addAttribute("member", member);
		log.debug(member.toString());
		return "/member/memberPersonal2";
	}

	//保存期限頁面
    @RequestMapping("/product-exp")
    public String listPage(Model model, HttpServletRequest request)
    {
//      String username = SecurityContextHolder.getContext().getAuthentication().getName();
        List<Map> result = new ArrayList<Map>();
//        long memberId= 0;
//        if(request.getSession().getAttribute("memberId")!= null){
//        memberId = (long) request.getSession().getAttribute("memberId");
//        }
    	Long memberId = 1L;//test
    	List<ExpDate> expDates = expDateService.getAll();
        for (int i = 0; i < expDates.size(); i++){
            ExpDate expDate = expDates.get(i);
            if (expDate.getMemberId() == memberId){
                Map<String, Object> beansMap = new HashMap<String, Object>();
                long j = expDate.getProId();
                Product product = productService.getById(j);

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
                String mfd = dateFormat.format(expDate.getMfd());
                String exp = dateFormat.format(expDate.getExp());
                
                String brandName = product.getBrand().getBrandName();
                
                long todaySec= new Date().getTime();
                long expSec = expDate.getExp().getTime();
                long lastTime = expSec - todaySec;
                long lastsDay = lastTime / (24*60*60*1000);

                beansMap.put("expDate", expDate);
                beansMap.put("product", product);
                beansMap.put("mfd", mfd);
                beansMap.put("exp", exp);
                beansMap.put("brandName", brandName);
                beansMap.put("lastsDay", lastsDay);

                result.add(beansMap);
                log.debug("todaySec: {}, expSec: {}", todaySec, expSec);
                log.debug("brandName: {}, lastDay: {}", brandName, lastsDay);
                log.debug(result.toString());
            }
        }
        model.addAttribute("beans", result);
        return "/expDate/expDateList";
    }
	
	//member文章收藏頁面
	@RequestMapping("/like/article")
	public String memberLikeArticlePage(Model model){
		Member member = service.getById(1L); //test
		Set<Article> articles = service.getById(1L).getArticlesSavedByMember();
		model.addAttribute("articles", articles);
		model.addAttribute("member", member);
		log.debug(member.toString());
		return "/member/memberLike-article";
	}
	
	//取消文章收藏
	@RequestMapping("/like/article/delete")
	@ResponseBody
	public Boolean memberLikedDelete(@RequestParam Long articleId, Model model){
		Long memberId = 1L;//test
		Member member = service.getById(memberId); //test
		Set<Article> articles = member.getArticlesSavedByMember();
		Article article = articleService.getById(articleId);
		log.debug("before delete: {}", articles.contains(article));
		if(articles.contains(article)){
			articles.remove(article);
			member.setArticlesSavedByMember(articles);
			service.update(member);
		}
		log.debug("after delete: {} ,target: {}", articles.contains(article), article.getArticleId().toString());
		if(articles.contains(article)){
			return false;
		}
		return true;
	}
	
	//新增文章收藏
	@RequestMapping("/like/article/insert")
	@ResponseBody
	public Boolean memberLikedInsert(@RequestParam Long articleId){
		Long memberId = 1L;//test
		Member member = service.getById(memberId);
		Set<Article> articles = member.getArticlesSavedByMember();
		Article article = articleService.getById(articleId);
		articles.add(article);
		member.setArticlesSavedByMember(articles);
		service.update(member);
		return true;
	}
	
	//member文章收藏頁面
	@RequestMapping("/like/review")
	public String memberLikedReviewPage(Model model){
		
		return "/member/memberLike-review";
	}
	
	
	//member-post文章頁面
	@RequestMapping("/post/article")
	public String memberPostedArticlePage(Model model){
		Member member = service.getById(1L); //test
		Set<Article> articles = service.getById(1L).getArticlesWorteByAuthor();
		model.addAttribute("articles", articles);
		model.addAttribute("member", member);
		log.debug(member.toString());
		return "/member/memberPost-article";
	}
	
	//review-post頁面
	@RequestMapping("/post/review")
	public String memberPostedReviewPage(Model model){
		Member member = service.getById(1L); //test
		Set<Review> reviews = service.getById(1L).getReviews();
		model.addAttribute("reviews", reviews);
		model.addAttribute("member", member);
		log.debug("memberId: {}, reviews: {}", member.getMemberId().toString(), reviews);
		return "/member/memberPost-review";
	}
	
	// 提供jqGrid抓取資料使用
	@RequestMapping("/select_jqgrid")
	@ResponseBody
	public Page<Member> select(@RequestParam(required = false) Integer page,
			@RequestParam(required = false) Integer rows) {

		log.debug("page = {}", page);
		log.debug("rows = {}", rows);
		
		Pageable pageable = new PageRequest(page - 1, rows);
		Page<Member> memberPage = service.getAll(pageable);
		log.debug(memberPage.toString());
		log.debug("getSize = {}", memberPage.getSize()); // 列數(資料筆數)
		log.debug("getNumber = {}", memberPage.getNumber()); // 頁數-1
		log.debug("getTotalPages() = {}", memberPage.getTotalPages()); // 總共幾頁
		log.debug("getTotalElements = {}", memberPage.getTotalElements()); // 全部有幾筆資料
		log.debug("getNumberOfElements = {}", memberPage.getNumberOfElements()); // 列數(資料筆數)
		log.debug("----------------------------------------------------------"); // 測試
		return memberPage;
	}
	
	//check whether the account has been taken
	@RequestMapping("/check_email")
	@ResponseBody
	public Boolean accountCheck(String email){
		return service.accountCheck(email);
	}

	//return signUp page
	@RequestMapping("/register")
	public String memberRegister(){
		return "/member/memberRegister";
	}
	
	//return forgotPassword page
	@RequestMapping("/forgotpsw")
	public String forgotPswPage(){
		return "/member/memberPsw-forgot";
	}
	
	//send reset-psw email
	@RequestMapping("/requestforpsw")
	@ResponseBody
	public String requestForResetPsw(@RequestParam String email, HttpServletRequest req){
		String resetPswUrl = service.createPswResetUrl(email, req);
		log.debug("URL: {}", resetPswUrl);
		mailSender.sendResetPsw(email, resetPswUrl);
		return "Please check your email and follow the instructions.";
	}
	
	//return reset-password Page
	@RequestMapping("/resetpassword")
	public String changePswPage(@RequestParam String token, Model model){ 
		Member member = service.getByResetPswToken(token);
		log.debug("email token: {}", token);
		String validToken = service.validateResetPswToken(token);
		log.debug("validToken: {}", validToken);
		if(validToken==null){
			model.addAttribute("email", member.getEmail());
			return "/member/memberPsw-reset";
		}
		//xxxxxxxxxx   回傳validToken訊息
		return "/fms";
	}
	
	//update password
	@RequestMapping(value="/updatepassword", method=RequestMethod.POST)
	@ResponseBody
	public String resetPassword(@RequestParam String email, @RequestParam String password){
		Member member = service.getByEmail(email);
		if(member != null){
			service.updatePassword(member, password);
			return "success";
		}
		return "failure";
	}
	
	@RequestMapping("/check_emailexist")
	@ResponseBody
	public Boolean emailCheck(String email){
		return !service.accountCheck(email);
	}
	
	//設定停權天數
	@RequestMapping("/suspend")
	public void memberSuspending(@RequestParam Long memberId, @RequestParam Integer memberSuspendDays){
		log.debug("inside controller");//test
		service.memberSuspend(memberId, memberSuspendDays);
	}
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("members", service.getAll());
		return "/member/memberList";
	}
	
	@RequestMapping("/add")
	public String addPage(){
		return "/member/memberAdd";//
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	@ResponseBody
	public Member insert(@RequestPart(name="member") Member member, 
			@RequestPart(value="memberImgFile", required = false) MultipartFile memberImgFile){
		service.insert(member);
		if(memberImgFile!=null){
			String mId = "member"+member.getMemberId().toString();
			String memberImg = FileProcessing.saveImg(mId, "member", memberImgFile);
			member.setMemberImg(memberImg);
		}
		log.debug("memberImg: {}", member.getMemberImg());//test
		member.setMemberRegiDate(new java.sql.Date(new java.util.Date().getTime()));
		service.update(member);
		return service.getById(member.getMemberId());
	}
	
	@RequestMapping("/edit")
	public String editPage(@RequestParam Long memberId, Model model){
		model.addAttribute("member", service.getById(memberId));
		return "/member/memberEdit";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseBody
	public Member update(@RequestPart(name="member") Member member, 
			@RequestPart(value="memberImgFile", required = false) MultipartFile memberImgFile){
		
		if(memberImgFile!=null){
			String mId = "member"+member.getMemberId();
			String memberImg = FileProcessing.saveImg(mId, "member", memberImgFile);
			member.setMemberImg(memberImg);
		}
		log.debug(member.getMemberImg());//test
		service.update(member);
		return service.getById(member.getMemberId());
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	@ResponseBody
	public void delete(@RequestBody Member member){
		log.debug(member.toString());
		service.delete(member.getMemberId());
	}
	
	@RequestMapping("/show")
	public void show(HttpServletResponse resp, @RequestParam Long memberId) {
		Member member = service.getById(memberId);
		String memberImg = member.getMemberImg();
		FileProcessing.showImg(resp, memberImg);
	}
	
	// 提供一般抓取資料使用
	@RequestMapping("/select")
	@ResponseBody
	public List<Member> select() {
		return service.getAll();
	}

}
