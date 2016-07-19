package tw.com.queautiful.commons.util;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import tw.com.queautiful.product.entity.ExpDate;
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
	
	@Scheduled(cron="0 56 15 * * ?")
	public void expDateReminder(){
		List<ExpDate> expDate = expDateService.expDateAfterOneMonth();
		if(!expDate.isEmpty()){
			for(ExpDate exp: expDate){
				String email = memberService.getById(exp.getMemberId()).getEmail();
				String prodName = prodService.getById(exp.getProId()).getProdName();
				String date = exp.getExp().toString();
				emailSender.sendExpDateRemind(email, prodName, date);
			}
		}else {
			log.debug("today no prod-exp-reminder mail be sent");
		}
	}
	
}
