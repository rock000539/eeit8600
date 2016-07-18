package tw.com.queautiful.product.service;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.dao.MemberDao;
import tw.com.queautiful.product.entity.Member;

@Service
public class MemberService {
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private MemberDao memberDao;

	public Member getById(Long memberId) {
		return memberDao.findOne(memberId);
	}

	public List<Member> getAll() {
		return memberDao.findAll();
	}

	public Page<Member> getAll(Pageable pageable) {
		return memberDao.findAll(pageable);
	}

	public void insert(Member member) {
		// password encode
		// member.setPassword(new
		// BCryptPasswordEncoder().encode(member.getPassword()));

		// memberimg set default_img
		if (member.getMemberImg() == null) {
			member.setMemberImg("src/main/webapp/WEB-INF/img/member/member_default.png");
		}
		memberDao.save(member);
	}

	public void update(Member member) {
		memberDao.save(member);
	}

	public void delete(Long memberId) {
		memberDao.delete(memberId);
	}

	// 產生reset-password URL
	public String createPswResetUrl(String email, HttpServletRequest req) {
		String path = req.getServerName() + ":" + req.getServerPort()
				+ req.getContextPath();
		return "http://" + path + "/members/resetpassword?token="
				+ createPswResetToken(email);
	}

	// 產生reset-password Token及reset-password ExpDate
	public String createPswResetToken(String email) {
		Member member = memberDao.findByEmailIs(email);
		String token = UUID.randomUUID().toString();
		member.setResetPswToken(token);
		java.sql.Date expDate = new java.sql.Date(
				new java.util.Date().getTime() + 7 * 24 * 60 * 60 * 1000);
		member.setResetPswExp(expDate);
		memberDao.save(member);
		log.debug("token saved: {}", member.getResetPswToken());
		log.debug("expDate saved: {}", member.getResetPswExp().toString());
		return token;
	}

	// 驗證token及token期限
	public String validateResetPswToken(String token) {
		Member member = memberDao.findByResetPswToken(token);
		java.util.Date today = new java.util.Date();
		if (member == null) {
			return "invalid token";
		} else if ((member.getResetPswExp().getTime() - today.getTime()) <= 0) {
			return "token expired";
		}
		return null;
	}

	public Member getByResetPswToken(String resetPswToken) {
		return memberDao.findByResetPswToken(resetPswToken);
	}

	public void updatePassword(Member member, String newPassword) {
		member.setPassword(newPassword);
		member.setResetPswToken(null);
		member.setResetPswExp(null);
		log.debug("after-reset-psw member clear token:{}, token-exp: {}",
				member.getResetPswToken(), member.getResetPswExp());
		memberDao.save(member);
	}

	public Boolean accountCheck(String email) {
		Member member = memberDao.findByEmailIs(email);
		if (member != null) {
			return false;
		} else {
			return true;
		}
	}

	public Member getByEmail(String email) {
		return memberDao.findByEmailIs(email);
	}

	// 要改成傳Member，且前端可以傳特定日期
	public void memberSuspend(Long id, Integer memberSuspendDays) {
		log.debug("inside service{}, {}", id, memberSuspendDays); // test
		Member member = memberDao.findOne(id);
		Long milliToday = new java.util.Date().getTime();
		java.sql.Date today = new java.sql.Date(milliToday);
		Long milliSuspend = memberSuspendDays * 24 * 60 * 60 * 1000L;
		new java.sql.Date(milliToday + milliSuspend);
		member.setMemberSuspend(true);
		member.setMemberSuspendStart(today);
		member.setMemberSuspendDays(memberSuspendDays);
		member.setMemberSuspendCount(member.getMemberSuspendCount() + 1);
		member.setMemberSuspendExp(new java.sql.Date(milliToday + milliSuspend));
		memberDao.save(member);
	}
		// 計算年齡
	public Integer getMemberAge(java.sql.Date memberBirthday) throws ParseException {
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date birthday = df.parse(memberBirthday.toString());
		Calendar nowCal = Calendar.getInstance();
		Calendar birthdayCal = Calendar.getInstance();
		birthdayCal.setTime(birthday);
		Integer age = nowCal.get(Calendar.YEAR) - birthdayCal.get(Calendar.YEAR);
		log.debug("age {}", age);
		
		// 判斷年紀只有這裡要注意，就是今年的生日過了沒，沒過就少算一歲。
		birthdayCal.set(Calendar.YEAR, nowCal.get(Calendar.YEAR));
		if (nowCal.getTime().getTime() < birthdayCal.getTime().getTime()) {
			age--;
		}
		log.debug("{}=years old", age);
		return age;
	}


}
