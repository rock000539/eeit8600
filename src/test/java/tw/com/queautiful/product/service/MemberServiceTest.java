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
		assertEquals(false, service.accountCheck("jenny@gmail.com"));
		assertEquals(true, service.accountCheck("test@gmail.com"));
		assertEquals(true, service.accountCheck(null));
	}
	
//	@Test
//	public void testChangePassword(){
//		service.changePassword(1L, "test1");
//		assertEquals("test1", service.getById(1L).getPassword());
//	}

	@Test
	public void testMemberSuspend(){
		assertEquals(Integer.valueOf(0), service.getById(1L).getMemberSuspendDays());
		service.memberSuspend(1L, 60);
		Member member = service.getById(1L);
		assertEquals(Integer.valueOf(60), service.getById(1L).getMemberSuspendDays());
		System.out.println(member);
	}
	

}
