package tw.com.queautiful.product.service;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import tw.com.queautiful.commons.enums.ArticleType;
import tw.com.queautiful.commons.enums.CategoryTitle;
import tw.com.queautiful.commons.util.Spec;
import tw.com.queautiful.product.dao.MemberDao;
import tw.com.queautiful.product.entity.Article;
import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.entity.Review;
import tw.com.queautiful.product.vo.review.ReviewVO;

@Service
public class MemberService {
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private MemberDao memberDao;
	@PersistenceContext
	private EntityManager em;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;

	public Member getById(Long memberId) {
		return memberDao.findOne(memberId);
	}

	public List<Member> getAll() {
		return memberDao.findAll();
	}

	public Page<Member> getAll(Pageable pageable) {
		return memberDao.findAll(pageable);
	}

	public void insert(Member member) {
		// password encode
		// member.setPassword(new
		// BCryptPasswordEncoder().encode(member.getPassword()));

		// memberimg set default_img
		if (member.getMemberImg() == null) {
			member.setMemberImg("src/main/webapp/WEB-INF/img/member/member_default.png");
		}
		memberDao.save(member);
	}

	public void update(Member member) {
		if (member.getMemberImg() == null) {
			member.setMemberImg("src/main/webapp/WEB-INF/img/member/member_default.png");
		}
		memberDao.save(member);
	}

	public void delete(Long memberId) {
		memberDao.delete(memberId);
	}
	
	//reviews Saved/Wroted ByMember
	public List<Review> getReviewsPaging(String findby, Long memberId, Integer pageNum,
			CategoryTitle categoryTitle, String sortProperty, String direction){
		
		Review review = new Review();
		review.setMember(getById(memberId));
		Specification<Review> spec = Spec.byAuto(em, review);
		
		if(sortProperty==null)
			sortProperty = "reviewTime";
		
		Direction sortDirection = Sort.Direction.DESC;
		if("ASC".equals(direction)){
			sortDirection = Sort.Direction.ASC;		
		}
		
		//PageRequest(int page, int size, Sort.Direction direction, String... properties)
//		Pageable pageable = new PageRequest(pageNum, 3, new Sort(sortDirection, sortProperty));
		return reviewService.getAll(spec);
	}

//	public Integer getReviewCategoryNum(Long memberId, CategoryTitle categoryTitle){
//		Review review = new Review();
//		review.setMember(getById(memberId));
//		
//		Product product = productService.getById(review.getProdId());
//		review.setProduct(product);
//		
//		Specification<Review> spec1 = Spec.byAuto(em, review);
//		
//		Product product = new Product();
//		product.setCategory();
//		
//		Specification<Product> spec2 = Spec.byAuto(em, product);
//		log.debug(reviewService.getAll(spec1, spec2).toString());
//		
//		return reviewService.getAll(spec1).size();
//	}
	
	
	//articlesSavedByMember pagination and sorted
	public Page<Article> getArticlesPaging(Long memberId, ArticleType articleType, Integer pageNum,
			String sortProperty, String direction){
		log.debug("input: {} {} {} {} {}", memberId,articleType,pageNum,sortProperty,direction);
		
		Article article = new Article();
		article.setMember(getById(memberId));
		
		if(articleType!=null){ 
			article.setArticleType(articleType);
		}
		
		Specification<Article> spec = Spec.byAuto(em, article);
		
		Direction sortDirection = Sort.Direction.DESC;
		if("ASC".equals(direction)){
			sortDirection = Sort.Direction.ASC;		
		}
		
		if(sortProperty==null)
			sortProperty = "articleTime";
		
		//PageRequest(int page, int size, Sort.Direction direction, String... properties)
		Pageable pageable = new PageRequest(pageNum, 3, new Sort(sortDirection, sortProperty));
		return articleService.getAll(spec, pageable);
	}

	// 產生reset-password URL
	public String createPswResetUrl(String email, HttpServletRequest req) {
		String path = req.getServerName() + ":" + req.getServerPort()
				+ req.getContextPath();
		return "http://" + path + "/members/resetpassword?token="
				+ createPswResetToken(email);
	}

	// 產生reset-password Token及reset-password ExpDate
	public String createPswResetToken(String email) {
		Member member = memberDao.findByEmailIs(email);
		String token = UUID.randomUUID().toString();
		member.setResetPswToken(token);
		Calendar today = Calendar.getInstance();
		today.add(Calendar.DATE, +7);
		java.sql.Date expDate = new java.sql.Date(today.getTimeInMillis());
		member.setResetPswExp(expDate);
		memberDao.save(member);
		log.debug("token saved: {}", member.getResetPswToken());
		log.debug("expDate saved: {}", member.getResetPswExp().toString());
		return token;
	}

	// 驗證token及token期限
	public Boolean validateResetPswToken(String token) {
		Member member = memberDao.findByResetPswToken(token);
		java.util.Date today = new java.util.Date();
		if (member == null) {
			return false; //invalid token
		} else if ((member.getResetPswExp().getTime() - today.getTime()) <= 0) {
			return false; //token expired
		}
		return true;
	}

	public Member getByResetPswToken(String resetPswToken) {
		return memberDao.findByResetPswToken(resetPswToken);
	}
	
	public List<Member> getByResetPswExp(java.sql.Date resetPswExp){
		return memberDao.findByResetPswExp(resetPswExp);
	}

	public void updatePassword(Member member, String newPassword) {
		member.setPassword(newPassword);
		member.setResetPswToken(null);
		member.setResetPswExp(null);
		log.debug("after-reset-psw member clear token:{}, token-exp: {}",
				member.getResetPswToken(), member.getResetPswExp());
		memberDao.save(member);
	}

	public Boolean accountCheck(String email) {
		Member member = memberDao.findByEmailIs(email);
		if (member != null) {
			return false;
		} else {
			return true;
		}
	}

	public Member getByEmail(String email) {
		return memberDao.findByEmailIs(email);
	}

	// member停權, 天數:30天
	public void memberSuspend(Long memberId) {
		Integer memberSuspendDays = 30;
		Member member = memberDao.findOne(memberId);
		Calendar suspending = Calendar.getInstance();
		suspending.add(Calendar.DATE, memberSuspendDays);
		java.sql.Date memberSuspendExp = new java.sql.Date(suspending.getTimeInMillis());
		member.setMemberSuspend(true);
		member.setMemberSuspendStart(new java.sql.Date(new java.util.Date().getTime()));
		member.setMemberSuspendDays(memberSuspendDays);
		member.setMemberSuspendCount(member.getMemberSuspendCount() + 1);
		member.setMemberSuspendExp(memberSuspendExp);
		log.debug("memberSuspendExp: {}", memberSuspendExp);
		memberDao.save(member);
	}
		// 計算年齡
	public Integer getMemberAge(java.sql.Date memberBirthday)  {
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date birthday=null;
		try {
			birthday = df.parse(memberBirthday.toString());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar nowCal = Calendar.getInstance();
		Calendar birthdayCal = Calendar.getInstance();
		birthdayCal.setTime(birthday);
		Integer age = nowCal.get(Calendar.YEAR) - birthdayCal.get(Calendar.YEAR);
		log.debug("age {}", age);
		
		// 判斷年紀只有這裡要注意，就是今年的生日過了沒，沒過就少算一歲。
		birthdayCal.set(Calendar.YEAR, nowCal.get(Calendar.YEAR));
		if (nowCal.getTime().getTime() < birthdayCal.getTime().getTime()) {
			age--;
		}
		log.debug("{}=years old", age);
		return age;
	}
	
	//Review-post sort and category
	public Map getReviewByCategory(Long memberId, CategoryTitle categoryTitle,
			String sortProperty, String direction){
		
		log.debug("input: {}, {}, {}, {}", memberId, categoryTitle, sortProperty, direction);
		
		String categoryTitleQuery = "";
		if(categoryTitle!=null){
			categoryTitleQuery = "where c.categorytitle ='"+categoryTitle+"'";
		}

		if(direction==null){
			direction = "DESC";
		}
		
		String orderby = "";
		if(sortProperty == null){
			log.debug("null");
			orderby = "r.reviewtime "+direction;
		}
		if(sortProperty!=null){
			orderby = "r."+sortProperty+" "+direction;
//			if("reviewTime".equals(sortProperty)){
//				orderby = "r."+sortProperty+" "+direction;
//			}else{
//				orderby = "r."+sortProperty+" "+direction+", r.reviewtime DESC";
//			}
		}
		
		String findReviewByCategory=
		"select reviewid,t.prodid, t.categoryId from review r join " 
		+"(select p.prodid, c.categoryid from product p join category c on p.categoryid = c.categoryid "
		+ categoryTitleQuery+") t "
		+"on r.prodid = t.prodid where r.memberid = "+memberId+" order by "+ orderby;
		
		List<Object[]> resultList = em.createNativeQuery(findReviewByCategory).getResultList();
		List<ReviewVO> reviews = new ArrayList<ReviewVO>();
		
		Integer countMakeUp = 0;
		Integer countSkinCare = 0;
		Integer countBathBody = 0;
		Integer countHair = 0;
		
		for(int i=0;i<resultList.size();i++){
			Object[] datas = resultList.get(i);
			
			Long reviewId=0L;
			try{
			BigInteger rId = (BigInteger) datas[0];
			 reviewId = rId.longValue();
			}catch(Exception e){
				reviewId= ((BigDecimal) datas[0]).longValue();
			}
			ReviewVO reviewVO = new ReviewVO();
			BeanUtils.copyProperties(reviewService.getById(reviewId), reviewVO);

			Long prodId =0L;
			Long categoryId=0L;
			try{	
			BigInteger pId= (BigInteger) datas[1];
			prodId = pId.longValue();
			
			BigInteger cId = (BigInteger) datas[2];
			categoryId = cId.longValue();
			}catch(Exception e){
				prodId=((BigDecimal) datas[1]).longValue();
				categoryId=((BigDecimal) datas[2]).longValue();
			}
			BeanUtils.copyProperties(productService.getById(prodId), reviewVO);
			BeanUtils.copyProperties(categoryService.getById(categoryId), reviewVO);
			if(CategoryTitle.MAKEUP.equals(reviewVO.getCategoryTitle())){
				countMakeUp++;
			}
			if(CategoryTitle.SKINCARE.equals(reviewVO.getCategoryTitle())){
				countSkinCare++;
			}
			if(CategoryTitle.BATHBODY.equals(reviewVO.getCategoryTitle())){
				countBathBody++;
			}
			if(CategoryTitle.HAIR.equals(reviewVO.getCategoryTitle())){
				countHair++;
			}
			
			reviews.add(reviewVO);
		}
		Map map = new HashMap();
		map.put("reviews", reviews);
		map.put("countMakeUp", countMakeUp);
		map.put("countSkinCare", countSkinCare);
		map.put("countBathBody", countBathBody);
		map.put("countHair", countHair);
		return map;
	}
}