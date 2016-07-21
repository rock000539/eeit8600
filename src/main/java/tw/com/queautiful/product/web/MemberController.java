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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.com.queautiful.commons.enumeration.ArticleType;
import tw.com.queautiful.commons.util.EmailSender;
import tw.com.queautiful.commons.util.FileProcessing;
import tw.com.queautiful.product.entity.Article;
import tw.com.queautiful.product.entity.ExpDate;
import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.entity.Review;
import tw.com.queautiful.product.service.ArticleService;
import tw.com.queautiful.product.service.ExpDateService;
import tw.com.queautiful.product.service.MemberService;
import tw.com.queautiful.product.service.ProductService;

@Controller
@RequestMapping("/members")
public class MemberController {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private EmailSender mailSender;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ExpDateService expDateService;
	@Autowired
	private ProductService productService;
	
	
	@RequestMapping("/profile")
	public String memberPersonalPage(HttpServletRequest request, Model model){
		Long memberId = (Long)request.getSession().getAttribute("memberId");
		Member member = memberService.getById(memberId);
		model.addAttribute("member", member);
		log.debug(member.toString());
		return "/member/memberPersonal";
	}

	//保存期限頁面
    @RequestMapping("/product-exp")
    public String listPage(Model model, HttpServletRequest request)
    {
//      String username = SecurityContextHolder.getContext().getAuthentication().getName();
        List<Map> result = new ArrayList<Map>();
        long memberId= 0;
        if(request.getSession().getAttribute("memberId")!= null){
        	memberId = (long) request.getSession().getAttribute("memberId");
        }
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
	public String memberLikeArticlePage(HttpServletRequest request, Model model){
		Long memberId = (Long)request.getSession().getAttribute("memberId");
		Member member = memberService.getById(memberId);
		Set<Article> articles = member.getArticlesSavedByMember();
		model.addAttribute("articles", articles);
		model.addAttribute("member", member);
		return "/member/memberLike-article";
	}
	
	//取消文章收藏
	@RequestMapping("/like/article/delete")
	@ResponseBody
	public Boolean memberLikedDelete(@RequestParam Long articleId, Model model){
		Long memberId = 1L;//test
		Member member = memberService.getById(memberId); //test
		Set<Article> articles = member.getArticlesSavedByMember();
		Article article = articleService.getById(articleId);
		log.debug("before delete: {}", articles.contains(article));
		if(articles.contains(article)){
			articles.remove(article);
			member.setArticlesSavedByMember(articles);
			memberService.update(member);
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
		Member member = memberService.getById(memberId);
		Set<Article> articles = member.getArticlesSavedByMember();
		Article article = articleService.getById(articleId);
		articles.add(article);
		member.setArticlesSavedByMember(articles);
		memberService.update(member);
		return true;
	}
	
	//member文章收藏頁面
	@RequestMapping("/like/review")
	public String memberLikedReviewPage(Model model){
		
		return "/member/memberLike-review";
	}
	
	
	//member-post文章頁面
	@RequestMapping("/post/article")
	public String memberPostedArticlePage(HttpServletRequest request, Model model){
		Long memberId = (Long) request.getSession().getAttribute("memberId");
		Member member = memberService.getById(memberId);
		Page<Article> pages = memberService.getArticlesPaging(memberId, null, 0, null, null);
			log.debug("page number = {}", pages.getNumber()); //num of current slice(starting 0)
			log.debug("page size = {}", pages.getSize()); //size of the slice
			log.debug("page numberOfElements = {}", pages.getNumberOfElements()); //elements on this slice
			log.debug("totalPages() = {}", pages.getTotalPages()); 
			log.debug("totalElements = {}", pages.getTotalElements()); 
		model.addAttribute("articles", pages.getContent());
		model.addAttribute("pageNum", pages.getNumber());
		model.addAttribute("member", member);
		model.addAttribute("totalPages", pages.getTotalPages());
		return "/member/memberPost-article";
	}
	
	//分頁, 分類, 排序
	@RequestMapping(value="/post/article/{pageNum}")
	@ResponseBody
	public  List<Map> memberLikeArticlePageSort(
			@PathVariable(value="pageNum") Integer pageNum,
			@RequestParam(required=false) ArticleType articleType,
			@RequestParam(value="sortProperty", defaultValue="articleTime") String sortProperty, 
			@RequestParam(value="direction", defaultValue="DESC") String direction,
			HttpServletRequest request, Model model){
		log.debug("page: {}",pageNum);
		Long memberId = (Long) request.getSession().getAttribute("memberId");
		
		Page<Article> pages = 
				memberService.getArticlesPaging(memberId, articleType, pageNum, sortProperty, direction);
		
		//pass to front-end
		List<Map> result = new ArrayList<Map>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("articles", pages.getContent());
		map.put("pageNum", pages.getNumber());
		map.put("totalPages", pages.getTotalPages());
		map.put("member", memberService.getById(memberId));
		result.add(map);
		log.debug("page number = {}", pages.getNumber()); //num of current slice(starting 0)
		log.debug("page size = {}", pages.getSize()); //size of the slice
		log.debug("page numberOfElements = {}", pages.getNumberOfElements()); //elements on this slice
		log.debug("totalPages() = {}", pages.getTotalPages()); 
		log.debug("totalElements = {}", pages.getTotalElements()); 
		
		return result;
	}
	
	//review-post頁面
	@RequestMapping("/post/review")
	public String memberPostedReviewPage(Model model){
		Member member = memberService.getById(1L); //test
		Set<Review> reviews = memberService.getById(1L).getReviewsWorteByAuthor();
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
		Page<Member> pages = memberService.getAll(pageable);
		log.debug(pages.toString());
		log.debug("page number = {}", pages.getNumber()); //num of current slice(starting 0)
		log.debug("page size = {}", pages.getSize()); //size of the slice
		log.debug("page numberOfElements = {}", pages.getNumberOfElements()); //elements on this slice
		log.debug("totalPages() = {}", pages.getTotalPages()); 
		log.debug("totalElements = {}", pages.getTotalElements()); 
		log.debug("----------------------------------------------------------"); // 測試
		return pages;
	}
	
	//check whether the account has been taken
	@RequestMapping("/check_email")
	@ResponseBody
	public Boolean accountCheck(String email){
		return memberService.accountCheck(email);
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
		String resetPswUrl = memberService.createPswResetUrl(email, req);
		log.debug("URL: {}", resetPswUrl);
		mailSender.sendResetPsw(email, resetPswUrl);
		return "Please check your email and follow the instructions.";
	}
	
	//return reset-password Page
	@RequestMapping("/resetpassword")
	public String changePswPage(@RequestParam String token, Model model){ 
		Member member = memberService.getByResetPswToken(token);
		log.debug("email token: {}", token);
		String validToken = memberService.validateResetPswToken(token);
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
		Member member = memberService.getByEmail(email);
		if(member != null){
			memberService.updatePassword(member, password);
			return "success";
		}
		return "failure";
	}
	
	@RequestMapping("/check_emailexist")
	@ResponseBody
	public Boolean emailCheck(String email){
		return !memberService.accountCheck(email);
	}
	
	//設定停權天數
	@RequestMapping("/suspend")
	public void memberSuspending(@RequestParam Long memberId, @RequestParam Integer memberSuspendDays){
		log.debug("inside controller");//test
		memberService.memberSuspend(memberId, memberSuspendDays);
	}
	
	@RequestMapping("/list")
	public String listPage(Model model){
		model.addAttribute("members", memberService.getAll());
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
		memberService.insert(member);
		if(memberImgFile!=null){
			String mId = "member"+member.getMemberId().toString();
			String memberImg = FileProcessing.saveImg(mId, "member", memberImgFile);
			member.setMemberImg(memberImg);
		}
		log.debug("memberImg: {}", member.getMemberImg());//test
		member.setMemberRegiDate(new java.sql.Date(new java.util.Date().getTime()));
		memberService.update(member);
		return memberService.getById(member.getMemberId());
	}
	
	@RequestMapping("/edit")
	public String editPage(@RequestParam Long memberId, Model model){
		model.addAttribute("member", memberService.getById(memberId));
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
		memberService.update(member);
		return memberService.getById(member.getMemberId());
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	@ResponseBody
	public void delete(@RequestBody Member member){
		log.debug(member.toString());
		memberService.delete(member.getMemberId());
	}
	
	@RequestMapping("/show")
	public void show(HttpServletResponse resp, @RequestParam Long memberId) {
		Member member = memberService.getById(memberId);
		String memberImg = member.getMemberImg();
		FileProcessing.showImg(resp, memberImg);
	}
	
	// 提供一般抓取資料使用
	@RequestMapping("/select")
	@ResponseBody
	public List<Member> select() {
		return memberService.getAll();
	}

}
