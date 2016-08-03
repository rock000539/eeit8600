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
				
			mimeMessageHelper.setFrom("queatiful.eeit@gmail.com");
			mimeMessageHelper.setTo(email);
			mimeMessageHelper.setSubject("Reset Password");
			mimeMessageHelper.setText(
				""+
				"Dear "+ member.getNickname()+",<br><br>"+
				"You're receiving this because you (or someone else) have requested for reseting password for your account.<br>"+
				"Please click the Link, or paste it into your browser to complete the reset password process : <br><br>"+
				resetPswUrl+"<br>"+
				"This link will be expired after 7 days <br><br>"+
				"<hr>Best Regards,<br><br>" + "Qutie Team <br><br>" +
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
			mimeMessageHelper.setFrom("queatiful.eeit@gmail.com");
			mimeMessageHelper.setTo(email);
			mimeMessageHelper.setSubject("Product Expired Date Reminder");
			mimeMessageHelper.setText(
					"Dear "+ member.getNickname() +", <br><br>"+
					"Your <b>"+ prodName + "</b> will be expired on <b>"+ date +"</b><br><br><br><br>"+
					"<hr>Best Regards,<br><br>" + "Qutie Team <br><br>" +
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
	
	public void sendResetPsw2 (String email, String resetPswUrl){
		Date sendDate = new Date();
		Member member = memberService.getByEmail(email);
		SimpleMailMessage simpleMsg = new SimpleMailMessage();
		simpleMsg.setFrom("queatiful.eeit@gmail.com");
		simpleMsg.setTo(email);
		simpleMsg.setSubject("Reset Password");
		simpleMsg.setText("Dear "+ member.getNickname()+", \n"+
			"You're receiving this because you (or someone else) have requested the reset of password for your account.\n"+
			"Please click the Link, or paste into your browser to complete the reset password process :\n\n"+
			resetPswUrl+"\n\n"+
			"This link will be expired after 7 days"+"\n\n\n\n"+
			"Best Regards,\n\n" + "Qutie Team \n\n" + sendDate
		);
		mailSender.send(simpleMsg);
		log.debug("ResetPsw mail sent to {}", email);
	}
	
	public void sendExpDateRemind2(String email, String prodName, String date){
		
		Date sendDate = new Date();
		Member member = memberService.getByEmail(email);
		SimpleMailMessage simpleMsg = new SimpleMailMessage();
//		simpleMsg.setFrom("queatiful.eeit@gmail.com");
		simpleMsg.setTo(email);
		simpleMsg.setSubject("Product Expired Date Reminder");
		simpleMsg.setText("Dear "+ member.getNickname()+", \n"+
			"Your "+ prodName + " will be expired on "+ date+"\n\n\n\n"
			+"Best Regards,\n\n" + "Qutie Team \n\n" + sendDate
		);
		mailSender.send(simpleMsg);
		log.debug("ExpDateReminder mail sent to {}", email);
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		// TODO Auto-generated method stub
	}
	
}
