package tw.com.queautiful.product.entity;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "TIMEONSITE")
public class TimeOnSiteEnity {
@Id	
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long id;

private long timeOnSite;

private String pageUrl;

private Long memberId;

private String clientIp;

private String pageUrlTrimmed; 




@Override
public String toString() {
	return "TimeOnSiteEnity [id=" + id + ", timeOnSite=" + timeOnSite + ", pageUrl=" + pageUrl + ", memberId="
			+ memberId + ", clientIp=" + clientIp + "]";
}



public String getPageUrlTrimmed() {
	if(pageUrl != null){
		String[] pageUrlArray = pageUrl.split("/");
		if(pageUrlArray.length>3){
		if(pageUrlArray[3].equalsIgnoreCase("fms")){
			pageUrlTrimmed = "index";
		}
		}else{
			pageUrlTrimmed = pageUrlArray[4];
		}
	}
	return pageUrlTrimmed;
}



public void setPageUrlTrimmed(String pageUrlTrimmed) {
	if(pageUrl != null){
		String[] pageUrlArray = pageUrl.split("/");
		if(pageUrlArray.length>3){
			if(pageUrlArray[3].equalsIgnoreCase("fms")){
				pageUrlTrimmed = "index";
			}else{
				pageUrlTrimmed = pageUrlArray[3];
			}
		}else{
			pageUrlTrimmed = "index";
		}
	}
	System.out.println(pageUrl);
	this.pageUrlTrimmed = pageUrlTrimmed;
}



public String getClientIp() {
	return clientIp;
}


public void setClientIp(String clientIp) {
	this.clientIp = clientIp;
}



public Long getMemberId() {
	return memberId;
}
public void setMemberId(Long memberId) {
	this.memberId = memberId;
}
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public long getTimeOnSite() {
	return timeOnSite;
}
public void setTimeOnSite(long timeOnSite) {
	this.timeOnSite = timeOnSite;
}
public String getPageUrl() {
	return pageUrl;
}
public void setPageUrl(String pageUrl) {
	this.pageUrl = pageUrl;
}


	
}
