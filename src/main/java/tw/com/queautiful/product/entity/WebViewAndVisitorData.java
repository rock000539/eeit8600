package tw.com.queautiful.product.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "WEBVIEWANDVISITORDATA")
public class WebViewAndVisitorData {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	
	private long totalVisitors;
	
	private long uniqueVisitors;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getTotalVisitors() {
		return totalVisitors;
	}

	public void setTotalVisitors(long totalVisitors) {
		this.totalVisitors = totalVisitors;
	}

	public long getUniqueVisitors() {
		return uniqueVisitors;
	}

	public void setUniqueVisitors(long uniqueVisitors) {
		this.uniqueVisitors = uniqueVisitors;
	}
	
	
}
