package tw.com.queautiful.commons.util;

import org.crsh.console.jline.internal.Log;
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
	
	public void sendResetPsw(String email, String resetPswUrl){
		Member member = service.getByEmail(email);
		SimpleMailMessage simpleMsg = new SimpleMailMessage();
		simpleMsg.setFrom("queatiful.eeit@gmail.com");
		simpleMsg.setTo(email);
		simpleMsg.setSubject("Reset Password");
		simpleMsg.setText("Dear "+ member.getNickname()+", \n"+
			"You're receiving this becausebecause you (or someone else) have requested the reset of the password for your account.\n"+
			"Please click the Link, or paste into your browser to complete the reset password process :\n\n"+
			resetPswUrl
				);
		mailSender.send(simpleMsg);
		Log.debug("mail sent");
	}
	
}
