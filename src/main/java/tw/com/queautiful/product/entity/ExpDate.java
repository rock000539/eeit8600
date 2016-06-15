package tw.com.queautiful.product.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "DATE")
public class ExpDate {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "dateId")
	private Long dateId;
	
	@Column(name = "memberId")
	private Long memberId;
	
	@Column(name = "BRANDID")
	private Long brandId;
	
	@Column(name = "proId")
	private Long proId;
	
	@Column(name = "batchCode")
	private Integer batchCode;
	
	@Column(name = "mfd")
	private java.sql.Date mfd;
	
	@Column(name = "exp")
	private java.sql.Date exp;

	
	
	public Long getDateId() {
		return dateId;
	}

	public void setDateId(Long dateId) {
		this.dateId = dateId;
	}

	
	public Long getBrandId() {
		return brandId;
	}
	

	public void setBrandId(Long brandId) {
		this.brandId = brandId;
	}

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public Long getProId() {
		return proId;
	}

	public void setProId(Long proId) {
		this.proId = proId;
	}

	public Integer getBatchCode() {
		return batchCode;
	}

	public void setBatchCode(Integer batchCode) {
		this.batchCode = batchCode;
	}

	public java.sql.Date getMfd() {
		return mfd;
	}

	public void setMfd(java.sql.Date mfd) {
		this.mfd = mfd;
	}

	public java.sql.Date getExp() {
		return exp;
	}

	public void setExp(java.sql.Date exp) {
		this.exp = exp;
	}

	@Override
	public String toString() {
		return "Date [dateId=" + dateId + ", memberId=" + memberId + ", proId=" + proId + ", batchCode=" + batchCode
				+ ", mfd=" + mfd + ", exp=" + exp + "]";
	}

}
