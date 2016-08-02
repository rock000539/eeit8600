package tw.com.queautiful.commons.util;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import tw.com.queautiful.product.entity.ExpDate;
import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.service.MemberService;
import tw.com.queautiful.product.service.ProductService;

@Component
public class EmailSender {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProductService prodService;
	
	public void sendResetPsw(String email, String resetPswUrl){
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
	
	public void sendExpDateRemind(String email, String prodName, String date){
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
	
}
