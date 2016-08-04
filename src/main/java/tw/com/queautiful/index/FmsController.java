package tw.com.queautiful.index;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.queautiful.product.entity.WebViewAndVisitorData;
import tw.com.queautiful.product.service.ArticleService;
import tw.com.queautiful.product.service.ProductService;
import tw.com.queautiful.product.service.WebViewAndVisitorDataService;

@Controller
public class FmsController {

	private static boolean cookieVerification = false;
	@Autowired
	private WebViewAndVisitorDataService webViewAndVisitorDataService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ArticleService articleService;

	@RequestMapping("/fms")
	public String fmsPage(HttpServletRequest request, HttpServletResponse response, Model model) {

		Cookie[] cookies = request.getCookies();

		if (cookies != null && !cookieVerification) {
			for (Cookie cookie : cookies) {
				String name = cookie.getName();
				String value = cookie.getValue();
				if ("qutie".equals(name) && "qutie".equals(value)) {
				} else {
					setCrunchifyCookie(request, response);
				}
			}
			cookieVerification = true;
		}
		
		model.addAttribute("prodTop10",productService.findTop10ByOrderByScoreDesc());
		model.addAttribute("articles",articleService.findTop5ByOrderByArticleTimeDesc());
		return "/fms";
	}

	@RequestMapping("/indexfms")
	public String indexfmsPage() {
		return "/indexfms";
	}

	@RequestMapping("/indexjr")
	public String indexjrPage() {
		return "/indexjr";
	}

	@RequestMapping("/contact")
	public String contactPage() {
		return "/product/contact";
	}

	@RequestMapping("/fmslogin")
	public String loginPage(Model model) {
		model.addAttribute("prodTop10",productService.findTop10ByOrderByScoreDesc());
		model.addAttribute("articles",articleService.findTop5ByOrderByArticleTimeDesc());
		return "/fms";
	}

	public void setCrunchifyCookie(HttpServletRequest request, HttpServletResponse response) {
		Cookie crunchifyCookie = new Cookie("qutie", "qutie");
		crunchifyCookie.setMaxAge(6 * 4 * 7 * 24 * 60 * 60);
		response.addCookie(crunchifyCookie);
		WebViewAndVisitorData webViewAndVisitorData = webViewAndVisitorDataService.findOne();
		long UniqueVisitors = webViewAndVisitorData.getUniqueVisitors();
		webViewAndVisitorData.setUniqueVisitors(UniqueVisitors + 1);
		webViewAndVisitorDataService.update(webViewAndVisitorData);
	}
}
