package tw.com.queautiful.commons.util;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.queautiful.product.entity.WebViewAndVisitorData;
import tw.com.queautiful.product.service.WebViewAndVisitorDataService; 
@WebListener
public class SessionCounter implements HttpSessionListener, ServletRequestListener {
	private static Logger log = Logger.getLogger(SessionCounter.class);
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
    private static int activeSessions = 0;
    private HttpServletRequest request;
    private static ArrayList list = new ArrayList();
    
    @Autowired
    private WebViewAndVisitorDataService webViewAndVisitorDataService;
    
    public void init() throws ServletException {
        log.info("SessionCounter init!"); 

    } 

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        log.info("SessionCounter doGet!");
        response.setContentType(CONTENT_TYPE);
        HttpSession session = request.getSession();
		Cookie[] cookies=request.getCookies();
		
		System.out.println("p1");
	       if(cookies != null) {
	    	   System.out.println("p2");
	    	   for(Cookie cookie : cookies) {
	    		   System.out.println("p3");
	                String name = cookie.getName();
	                String value = cookie.getValue();
	                if("qutie".equals(name) && "qutie".equals(value)) {
	                	System.out.println("pAA");
	                }else{
	                	System.out.println("p4");
	                	setCrunchifyCookie(request,response);
	                }
	            }
	        }
        
    }
    
	public void setCrunchifyCookie(HttpServletRequest request, HttpServletResponse response){
	    Cookie crunchifyCookie = new Cookie("qutie", "qutie");
	    crunchifyCookie.setMaxAge(6 * 4 * 7 * 24 * 60 * 60);
	    response.addCookie(crunchifyCookie);
	    System.out.println("p5");
		}

    public void destroy() {
        log.info("SessionCounter destroy!");
    } 

    public void requestDestroyed(ServletRequestEvent event) {
        //To change body of implemented methods use File | Settings | File Templates.
//        log.info("SessionCounter requestDestroyed!");
    } 

    public void requestInitialized(ServletRequestEvent sre){
        request=(HttpServletRequest)sre.getServletRequest();
//        log.info("SessionCounter requestInitialized!");
        
    } 

    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        log.info("SessionCounter sessionCreater!");
        String sessionId = httpSessionEvent.getSession().getId();
        Timestamp createTime = new Timestamp(System.currentTimeMillis());
        String loginIp = request.getRemoteAddr();
        boolean rs = true;
        if(list.size() > 0){
            for(int i = 0;i < list.size(); i ++){
                if(loginIp.equals(list.get(i))){
                    rs = false;
                }
            }
        }
        if(rs){ 
        	WebViewAndVisitorData webViewAndVisitorData =webViewAndVisitorDataService.findOne();
        	webViewAndVisitorData.setTotalVisitors(webViewAndVisitorData.getTotalVisitors()+1);
        	webViewAndVisitorDataService.update(webViewAndVisitorData);
        	
        	list.add(loginIp);
        	log.info("ipList新增ip: "+loginIp);
            activeSessions++;
            log.info("新增SESSION,sessionId = " + sessionId +"; createTime = " + createTime
                             + "; loginIp = " + loginIp +"; SESSION值 "+activeSessions);
        }
        
    } 

    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        log.info("SessionCounter sessionDestroyedXXX!");
        String sessionId = httpSessionEvent.getSession().getId();
        Timestamp overTime = new Timestamp(System.currentTimeMillis());
        String loginIp = request.getRemoteAddr();
        if(activeSessions>0){
            if(list.size() > 0){
                for(int i = 0;i < list.size(); i ++){
                    if(loginIp.equals(list.get(i))){
                        list.remove(i);  
                        log.info("ipList移除ip: "+loginIp);
                    }
                }
            }
            activeSessions--;                   
            log.info("銷毀SESSION,sessionId = " + sessionId +"; overTime = " + overTime
                             + "; loginIp = " + loginIp +"; SESSION值 "+activeSessions);
        }
    } 

    public static int getActiveSessions() {
        log.info("SessionCounter getActiveSessions!");
        return activeSessions;
    } 

    public void setActiveSessions(int i) {
        log.info("SessionCounter setActiveSessions!");
        activeSessions = i;
    } 
}
