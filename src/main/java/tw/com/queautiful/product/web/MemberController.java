package tw.com.queautiful.product.web;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
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

import tw.com.queautiful.commons.enums.ArticleType;
import tw.com.queautiful.commons.util.EmailSender;
import tw.com.queautiful.commons.util.FileProcessing;
import tw.com.queautiful.product.entity.Article;
import tw.com.queautiful.product.entity.ExpDate;
import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.entity.Review;
import tw.com.queautiful.product.entity.ReviewCM;
import tw.com.queautiful.product.service.ArticleService;
import tw.com.queautiful.product.service.ExpDateService;
import tw.com.queautiful.product.service.MemberService;
import tw.com.queautiful.product.service.ProductService;
import tw.com.queautiful.product.service.ReviewService;
import tw.com.queautiful.product.vo.member.MemberEditVO;
import tw.com.queautiful.product.vo.product.ProductView;

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
	@Autowired
	private ReviewService reviewService;
	
	//overview頁面
	@RequestMapping("/overview/{memberId}")
	public String memberOverviewPage(@PathVariable Long memberId, HttpServletRequest request, Model model){
		Member member = memberService.getById(memberId);
		
		java.sql.Date regiDate = member.getMemberRegiDate();
		SimpleDateFormat sDateFormat = new SimpleDateFormat("MMM d, yyyy", Locale.US);
		Calendar date = Calendar.getInstance(); 
		date.setTime(regiDate);
		String memberRegiDate = sDateFormat.format(date.getTime());
		
		model.addAttribute("member", member);
		model.addAttribute("memberRegiDate", memberRegiDate);
		model.addAttribute("expDates", expDateService.getByMemberId(memberId).size());
		model.addAttribute("postedReviews", member.getReviewsWorteByAuthor().size());
		model.addAttribute("postedArticles", member.getArticlesWorteByAuthor().size());
		model.addAttribute("wishlist", member.getProductSavedByMember().size());
		model.addAttribute("member", member);
		model.addAttribute("likedReviews", member.getReviewsSavedByMember().size());
		model.addAttribute("likedArticles", member.getArticlesSavedByMember().size());
		return "/member/memberOverview"; 
	}
	
	//profile頁面
	@RequestMapping("/profile")
	public String memberPersonalPage(HttpServletRequest request, Model model){
		Long memberId = (Long)request.getSession().getAttribute("memberId");
		Member member = memberService.getById(memberId);
		try {
			member.setAge(memberService.getMemberAge(member.getBirthDay()));
		} catch (ParseException e) {
			log.error(e.getMessage());
		}
		model.addAttribute("member", member);
		return "/member/memberProfile";
	}
	
	//profile-edit頁面
	@RequestMapping("/profile/edit")
	public String memberPersonalEditPage(HttpServletRequest request, Model model){
		Long memberId = (Long)request.getSession().getAttribute("memberId");
		Member member = memberService.getById(memberId);
		try {
			member.setAge(memberService.getMemberAge(member.getBirthDay()));
		} catch (ParseException e) {
			log.error(e.getMessage());
		}
		model.addAttribute("member", member);
		return "/member/memberProfile-edit";
	}
	
	//member update
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseBody
	public Boolean update(@RequestPart(name="member") MemberEditVO memberEditVO, 
			@RequestPart(value="memberImgFile", required = false) MultipartFile memberImgFile,
			HttpServletRequest request){
		Long memberId = (Long)request.getSession().getAttribute("memberId");
		Member member = memberService.getById(memberId);
		
		if(memberImgFile!=null){
			String mId = "member"+memberEditVO.getMemberId();
			String memberImg = FileProcessing.saveImg(mId, "member", memberImgFile);
			memberEditVO.setMemberImg(memberImg);
		}
		
		request.getSession().setAttribute("MemberNickname", memberEditVO.getNickname());
		
		try {
			BeanUtils.copyProperties(memberEditVO, member);
			memberService.update(member);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
		
	
	// WishList頁面
	@RequestMapping("/wishlist")
	public String wishListPage(HttpServletRequest request, Model model){
		Long memberId = (Long)request.getSession().getAttribute("memberId");
		Member member = memberService.getById(memberId);
		Set<Product> products = member.getProductSavedByMember();
		model.addAttribute("products", products);
		model.addAttribute("member", member);
		return "/member/memberWishList";
	}
	
	
	//insert wishlist
	@RequestMapping("/like/product/{prodId}")
	@ResponseBody
	public Boolean wishListInsert(@PathVariable Long prodId, HttpServletRequest request, Model model){
		Long memberId = (Long)request.getSession().getAttribute("memberId");
		Member member = memberService.getById(memberId);
		Product product = productService.getById(prodId);
		Set<Product> products = member.getProductSavedByMember();
		if(products.contains(product)){
			return false;
		}
		products.add(product);
		member.setProductSavedByMember(products);
		memberService.update(member);
		return true;
	}
	
	//delete wishlist
	@RequestMapping("/like/product/delete")
	@ResponseBody
	public Boolean wishListDelete(@RequestParam Long prodId, HttpServletRequest request, Model model){
		Long memberId = (Long)request.getSession().getAttribute("memberId");
		Member member = memberService.getById(memberId);
		log.debug("{} wishlist", memberId.toString());
		Set<Product> products = member.getProductSavedByMember();
		Product product = productService.getById(prodId);
		
		if(products.contains(product)){
			products.remove(product);
			member.setProductSavedByMember(products);
			memberService.update(member);
		}
		if(products.contains(product)){
			return false;
		}
		return true;
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
        Member member = memberService.getById(memberId);
        model.addAttribute("member", member);
        model.addAttribute("beans", result);
        return "/member/memberExpDate";
    }
    
    //member收藏心得/文章頁面
    @RequestMapping("/like")
    public String memberLikePage(HttpServletRequest request, Model model){
    	Long memberId = (Long)request.getSession().getAttribute("memberId");
		Member member = memberService.getById(memberId);
		Set<Article> articles = member.getArticlesSavedByMember();
		Set<Review> reviews = member.getReviewsSavedByMember();
		List<String> dates = formatDate(reviews);
		model.addAttribute("articles", articles);
		model.addAttribute("reviews", reviews);
		model.addAttribute("dates", dates);
		model.addAttribute("member", member);
    	return "/member/memberLike";
    }
    
	//新增心得收藏
	@RequestMapping("/like/review/{reviewId}")
	@ResponseBody
	public Boolean reviewLikedInsert(@PathVariable Long reviewId, HttpServletRequest request, Model model){
		Long memberId = (Long) request.getSession().getAttribute("memberId");
		Member member = memberService.getById(memberId);
		log.debug("memberId {} saved review {}", memberId.toString(), reviewId.toString());
		Set<Review> reviews = member.getReviewsSavedByMember();
		Review review = reviewService.getById(reviewId);
		if(reviews.contains(review)){
			return false;
		}
		reviews.add(review);
		member.setReviewsSavedByMember(reviews);
		memberService.update(member);
		return true;
	}
	
	//取消心得收藏
	@RequestMapping("/like/review/delete")
	@ResponseBody
	public Integer memberLikedDelete(@RequestParam Long reviewId, HttpServletRequest request, Model model){
		Long memberId = (Long) request.getSession().getAttribute("memberId");
		Member member = memberService.getById(memberId);
		Set<Review> reviews = member.getReviewsSavedByMember();
		Review review = reviewService.getById(reviewId);
		if(reviews.contains(review)){
			reviews.remove(review);
			member.setReviewsSavedByMember(reviews);
			memberService.update(member);
		}
		return reviews.size();
	}
    
	//新增文章收藏
	@RequestMapping("/like/article/{articleId}")
	@ResponseBody
	public Boolean articleLikedInsert(@PathVariable Long articleId, HttpServletRequest request, Model model){
		Long memberId = (Long) request.getSession().getAttribute("memberId");
		Member member = memberService.getById(memberId);
		Set<Article> articles = member.getArticlesSavedByMember();
		Article article = articleService.getById(articleId);
		if(articles.contains(article)){
			return false;
		}
		articles.add(article);
		member.setArticlesSavedByMember(articles);
		memberService.update(member);
		return true;
	}
	
	//取消文章收藏
	@RequestMapping("/like/article/delete")
	@ResponseBody
	public Integer articleLikedDelete(@RequestParam Long articleId, HttpServletRequest request, Model model){
		Long memberId = (Long) request.getSession().getAttribute("memberId");
		Member member = memberService.getById(memberId);
		Set<Article> articles = member.getArticlesSavedByMember();
		Article article = articleService.getById(articleId);
		log.debug("before delete: {}", articles.contains(article));
		if(articles.contains(article)){
			articles.remove(article);
			member.setArticlesSavedByMember(articles);
			memberService.update(member);
		}
		log.debug("after delete: {} ,target: {}", articles.contains(article), article.getArticleId().toString());
		return articles.size();
	}
		
	//review n article - post頁面
	@RequestMapping("/post/{memberId}")
	public String memberPostedReviewPage(@PathVariable Long memberId, Model model, HttpServletRequest request){
		Member member = memberService.getById(memberId);
		
		Page<Review> pages = 
				memberService.getReviewsPaging("", memberId, 0, null, null);
		List<Review> reviews = pages.getContent();
		
		model.addAttribute("reviews", pages.getContent());
		model.addAttribute("reviewsPageNum", pages.getNumber());
		model.addAttribute("reviewsTotalPages", pages.getTotalPages());
		model.addAttribute("reviewsTotalElement", pages.getTotalElements());
		
		Page<Article> articlePages =
				memberService.getArticlesPaging(memberId, null, 0, null, null);
		
		model.addAttribute("articles", articlePages.getContent());
		model.addAttribute("articlesPageNum", articlePages.getNumber());
		model.addAttribute("articlesTotalPages", articlePages.getTotalPages());
		model.addAttribute("articlesTotalElement", articlePages.getTotalElements());
		model.addAttribute("member", member);
		log.debug("page number = {}", articlePages.getNumber()); //num of current slice(starting 0)
		log.debug("page size = {}", articlePages.getSize()); //size of the slice
		log.debug("page numberOfElements = {}", articlePages.getNumberOfElements()); //elements on this slice
		log.debug("totalPages() = {}", articlePages.getTotalPages()); 
		log.debug("totalElements = {}", articlePages.getTotalElements()); 
		
		return "/member/memberPost";
	}
		
	//article 分頁, 分類(news,solicit,question,chat), 排序(articleTime)
	@RequestMapping(value="/post/article/{pageNum}")
	@ResponseBody
	public  List<Map> memberPostArticlePageSort(
			@PathVariable(value="pageNum") Integer pageNum,
			@RequestParam(required=false) ArticleType articleType,
			@RequestParam(value="sortProperty", defaultValue="articleTime") String sortProperty, 
			@RequestParam(value="direction", defaultValue="DESC") String direction,
			HttpServletRequest request, Model model){
		log.debug("page: {}",pageNum);
		Long memberId = (Long) request.getSession().getAttribute("memberId");
		
		Page<Article> pages = 
				memberService.getArticlesPaging(memberId, articleType, pageNum, sortProperty, direction);
		
		List<Map> result = new ArrayList<Map>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("articles", pages.getContent());
		map.put("articlesPageNum", pages.getNumber());
		map.put("member", memberService.getById(memberId));
		map.put("articlesTotalPages", pages.getTotalPages());
		result.add(map);
		log.debug("page number = {}", pages.getNumber()); //num of current slice(starting 0)
		log.debug("page size = {}", pages.getSize()); //size of the slice
		log.debug("page numberOfElements = {}", pages.getNumberOfElements()); //elements on this slice
		log.debug("totalPages() = {}", pages.getTotalPages()); 
		log.debug("totalElements = {}", pages.getTotalElements()); 
		
		return result;
	}
	
	//review 分頁(3/page), 分類(none), 排序(reviewTime,reviewRating,rewCollect)
	@RequestMapping(value="/post/review/{pageNum}")
	@ResponseBody
	public  List<Map> memberPostReviewPageSort(
			@PathVariable(value="pageNum") Integer pageNum,
			@RequestParam(value="sortProperty", defaultValue="reviewTime") String sortProperty, 
			@RequestParam(value="direction", defaultValue="DESC") String direction,
			HttpServletRequest request, Model model){
		log.debug("page: {}",pageNum);
		Long memberId = (Long) request.getSession().getAttribute("memberId");
		
		Page<Review> pages = 
				memberService.getReviewsPaging("", memberId, pageNum, sortProperty, direction);
		
		List<Review> reviews = pages.getContent();
		List<String> dates = formatDate(reviews);
		List<ProductView> products = new ArrayList();
		for(Review review:reviews){
			Long prodId = review.getProduct().getProdId();
			ProductView productView = new ProductView();
			BeanUtils.copyProperties(productService.getById(prodId), productView);
			products.add(productView);
		}
		
		List<Map> result = new ArrayList<Map>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reviews", reviews);
		map.put("dates", dates);
		map.put("products", products);
		map.put("reviewsPageNum", pages.getNumber());
		map.put("reviewsTotalPages", pages.getTotalPages());
		map.put("member", memberService.getById(memberId));
		result.add(map);
		log.debug("page number = {}", pages.getNumber()); //num of current slice(starting 0)
		log.debug("page size = {}", pages.getSize()); //size of the slice
		log.debug("page numberOfElements = {}", pages.getNumberOfElements()); //elements on this slice
		log.debug("totalPages() = {}", pages.getTotalPages()); 
		log.debug("totalElements = {}", pages.getTotalElements()); 
		
		return result;
	}
	

	
	//format date
	private List<String> formatDate(Collection<Review> reviews){
		List<String> dates = new ArrayList();
		for(Review review: reviews){
			Timestamp reviewTime = review.getReviewTime();
			SimpleDateFormat sDateFormat = new SimpleDateFormat("MMM,d,yyyy", Locale.US);
			Calendar date = Calendar.getInstance();
			date.setTime(reviewTime);
			String datef = sDateFormat.format(date.getTime());
			dates.add(datef);
		}
		return dates;
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
		memberService.memberSuspend(memberId);
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
	public Member insert(HttpServletRequest request, @RequestPart(name="member") Member member, 
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
	
	//後台edit頁面
	@RequestMapping("/edit")
	public String editPage(@RequestParam Long memberId, Model model){
		model.addAttribute("member", memberService.getById(memberId));
		return "/member/memberEdit";
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
