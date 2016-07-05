package tw.com.queautiful.commons.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.service.MemberService;

@Component
public class EmailSender {
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberService service;
	
	public void sendResetPsw(String email){
		Member member = service.getByEmail(email);
		SimpleMailMessage simpleMsg = new SimpleMailMessage();
		simpleMsg.setFrom("queatiful.eeit@gmail.com");
		simpleMsg.setTo(email);
		simpleMsg.setSubject("Reset Password");
		simpleMsg.setText("Dear "+ member.getNickname()+", Please reset your password by click the Link.");
		mailSender.send(simpleMsg);
	}
	
}
