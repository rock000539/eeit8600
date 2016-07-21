package tw.com.queautiful.product.entity;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="WEBMAIL")
public class WebMail {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long webMailId;
	private Long webMailSender;
	private Long mailAddressee;
	private String mailTitle;
	private String mailContent;
	private boolean mailReadType; 
	private String mailContentType;
	private Date mailSendDate;
	
	private Long articleid;
	private Long reviewId;
	private Long acmId;
	private Long rcmId;
	
	
	

	@Override
	public String toString() {
		return "WebMail [webMailId=" + webMailId + ", webMailSender=" + webMailSender + ", mailAddressee="
				+ mailAddressee + ", mailTitle=" + mailTitle + ", mailContent=" + mailContent + ", mailReadType="
				+ mailReadType + ", mailContentType=" + mailContentType + ", mailSendDate=" + mailSendDate
				+ ", articleid=" + articleid + ", reviewId=" + reviewId + ", acmId=" + acmId + ", rcmId=" + rcmId + "]";
	}

	public Long getWebMailSender() {
		return webMailSender;
	}

	public void setWebMailSender(Long webMailSender) {
		this.webMailSender = webMailSender;
	}

	public Date getMailSendDate() {
		return mailSendDate;
	}

	public void setMailSendDate(Date mailSendDate) {
		this.mailSendDate = mailSendDate;
	}

	public String getMailContentType() {
		return mailContentType;
	}

	public void setMailContentType(String mailContentType) {
		this.mailContentType = mailContentType;
	}

	public Long getArticleid() {
		return articleid;
	}

	public void setArticleid(Long articleid) {
		this.articleid = articleid;
	}

	public Long getReviewId() {
		return reviewId;
	}

	public void setReviewId(Long reviewId) {
		this.reviewId = reviewId;
	}

	public Long getAcmId() {
		return acmId;
	}

	public void setAcmId(Long acmId) {
		this.acmId = acmId;
	}

	public Long getRcmId() {
		return rcmId;
	}

	public void setRcmId(Long rcmId) {
		this.rcmId = rcmId;
	}

	public Long getWebMailId() {
		return webMailId;
	}
	
	public boolean isMailReadType() {
		return mailReadType;
	}

	public void setMailReadType(boolean mailReadType) {
		this.mailReadType = mailReadType;
	}

	public void setWebMailId(Long webMailId) {
		this.webMailId = webMailId;
	}

	public Long getMailAddressee() {
		return mailAddressee;
	}
	public void setMailAddressee(Long mailAddressee) {
		this.mailAddressee = mailAddressee;
	}
	public String getMailTitle() {
		return mailTitle;
	}
	public void setMailTitle(String mailTitle) {
		this.mailTitle = mailTitle;
	}
	public String getMailContent() {
		return mailContent;
	}
	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}
	
}
