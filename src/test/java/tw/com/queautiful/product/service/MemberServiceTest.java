package tw.com.queautiful.product.service;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.queautiful.App;
import tw.com.queautiful.product.entity.Member;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(App.class)
public class MemberServiceTest {
	@Autowired
	MemberService service;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Test
	public void testAccountCheck() {
		assertEquals("此帳號已經有人使用", service.accountCheck("jenny@gmail.com"));
		assertEquals("此帳號可以使用", service.accountCheck("test@gmail.com"));
		assertEquals("此帳號可以使用", service.accountCheck(null));
	}

}
