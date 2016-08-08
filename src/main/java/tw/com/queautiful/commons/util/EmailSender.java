package tw.com.queautiful.commons.util;

import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.ServletRequestEvent;
import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.jni.File;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;

import tw.com.queautiful.product.entity.ExpDate;
import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.service.MemberService;
import tw.com.queautiful.product.service.ProductService;

@Component
public class EmailSender implements ServletContextAware{
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProductService prodService;
	@Autowired
	private ServletContext servletContext;

	public void sendResetPsw (String email, String resetPswUrl){
		Date sendDate = new Date();
		Member member = memberService.getByEmail(email);
		
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		try {
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true,"UTF-8");//multipart
				
			mimeMessageHelper.setFrom("qutie2016@hotmail.com");
			mimeMessageHelper.setTo(email);
			mimeMessageHelper.setSubject("密碼相關通知");
			mimeMessageHelper.setText(
				"Hi "+member.getNickname()+"<br><br>"+
				"我們獲知您想更改您的密碼。"+
				"您只要按以下連結，再按照提示操作即可。 別忘了密碼請使用英文及數字。<br><br>"+
				resetPswUrl+"<br>"+
				"此連結將會在7天后之效。<br>您沒有要求更改密碼嗎？ 那麼請忽略這封電郵。<br><br><br><br>"+
				"您的 Qutie 團隊<br><br>" +
				"<img src='cid:logo'><br>" + "&copy;Qutie " +sendDate
				, true);
			String path = servletContext.getRealPath("/images");
			log.debug(path);
			Resource file = new FileSystemResource(path+"/logo_qutie-02.png");
			mimeMessageHelper.addInline("logo", file);
			mailSender.send(mimeMessage);
			log.debug("ResetPsw mail sent to {}", email);	
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	     
	}
	
	public void sendExpDateRemind(String email, String prodName, String date){
		
		Date sendDate = new Date();
		Member member = memberService.getByEmail(email);
		
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		try {
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true,"UTF-8");
			mimeMessageHelper.setFrom("qutie2016@hotmail.com");
			mimeMessageHelper.setTo(email);
			mimeMessageHelper.setSubject("產品到期提醒");
			mimeMessageHelper.setText(
					"Hi "+ member.getNickname() +" <br><br>"+
					"您的<b>"+ prodName + "</b> 即將在 <b>"+ date +"</b>到期<br><br>"+
					"提醒您盡快用完，別讓"+ prodName +"過期了！<br><br><br><br>"+
					"您的 Qutie 團隊<br><br>"+
					"<img src='cid:logo'><br>" + "&copy;Qutie " +sendDate
					, true);
			String path = servletContext.getRealPath("/images");
			log.debug(path);
			Resource file = new FileSystemResource(path+"/logo_qutie-02.png");
			mimeMessageHelper.addInline("logo", file);
			mailSender.send(mimeMessage);
			log.debug("ResetPsw mail sent to {}", email);	
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	@Override
	public void setServletContext(ServletContext servletContext) {
		// TODO Auto-generated method stub
	}
	
}
