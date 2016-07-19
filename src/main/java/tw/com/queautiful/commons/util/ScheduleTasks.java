package tw.com.queautiful.commons.util;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import tw.com.queautiful.product.entity.ExpDate;
import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.service.ExpDateService;
import tw.com.queautiful.product.service.MemberService;
import tw.com.queautiful.product.service.ProductService;

@Configuration
@EnableScheduling
public class ScheduleTasks {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ExpDateService expDateService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProductService prodService;
	@Autowired
	private EmailSender emailSender;
	
	@Scheduled(cron="0 0 9 * * ?")   // 9 AM everyDay
	public void expDateReminder(){
		List<ExpDate> expDate = expDateService.expDateAfterOneMonth(); //check Exp expired after 1 month
		if(!expDate.isEmpty()){
			for(ExpDate exp: expDate){
				String email = memberService.getById(exp.getMemberId()).getEmail();
				String prodName = prodService.getById(exp.getProId()).getProdName();
				String date = exp.getExp().toString();
				emailSender.sendExpDateRemind(email, prodName, date);
			}
		}else {
			log.debug("Schedule - ExpDateReminder checked: no result");
		}
	}
	
	@Scheduled(cron="0 0 10 * * ?")	  // 10 AM everyDay
	public void deleteRestPswToken(){
		java.sql.Date today = new java.sql.Date(new java.util.Date().getTime());
		List<Member> memberPswTokenExpired = memberService.getByResetPswExp(today);
		if(!memberPswTokenExpired.isEmpty()){
			for(Member member: memberPswTokenExpired){
				member.setResetPswToken(null);
				member.setResetPswExp(null);
				memberService.update(member);
			}
		} else{
			log.debug("Schedule - ResetPswTokenExp checked: no result");
		}
	}
	
}
