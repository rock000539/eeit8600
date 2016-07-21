package tw.com.queautiful.commons.util;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.queautiful.App;
import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.service.MemberService;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(App.class)
public class EmailSenderTest {

	@Autowired
	private MemberService service;
	
	
	@Test
	public void testSendResetPsw() {
//		Member member = service.getById(1L);
//		member.setEmail("katesong0204@gmail");
//		EmailUtil emailUtil = new EmailUtil();
//		emailUtil.sendResetPsw(member);
	}

}
