package tw.com.softleader.eeit8600.product.entity;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="INGREDIENT")
public class Ingredient {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="INGREDId")
	private Long ingredId;
	
	@Column(name="INGREDName", length=50)
	private String ingredName;
	
	@Column(name="INGREDCName", length=50)
	private String ingredChName;
	
	@Column(name="INGREDChar", length=100)
	private String ingredChar;
	
	@Column(name="INGREDIrritant")
	private Integer ingredIrritant;
	
	@Column(name="INGREDAcne")
	private Integer ingredAcne;
	
	@Column(name="INGREDSafety")
	private Integer ingredSafety;

	
	
	@Override
	public String toString() {
		return "Ingredient [ingredId=" + ingredId + ", ingredName=" + ingredName + ", ingredChName=" + ingredChName
				+ ", ingredChar=" + ingredChar + ", ingredIrritant=" + ingredIrritant + ", ingredAcne=" + ingredAcne
				+ ", ingredSafety=" + ingredSafety + "]";
	}

	public Long getIngredId() {
		return ingredId;
	}

	public void setIngredId(Long ingredId) {
		this.ingredId = ingredId;
	}

	public String getIngredName() {
		return ingredName;
	}

	public void setIngredName(String ingredName) {
		this.ingredName = ingredName;
	}

	public String getIngredChName() {
		return ingredChName;
	}

	public void setIngredChName(String ingredChName) {
		this.ingredChName = ingredChName;
	}

	public String getIngredChar() {
		return ingredChar;
	}

	public void setIngredChar(String ingredChar) {
		this.ingredChar = ingredChar;
	}

	public Integer getIngredIrritant() {
		return ingredIrritant;
	}

	public void setIngredIrritant(Integer ingredIrritant) {
		this.ingredIrritant = ingredIrritant;
	}

	public Integer getIngredAcne() {
		return ingredAcne;
	}

	public void setIngredAcne(Integer ingredAcne) {
		this.ingredAcne = ingredAcne;
	}

	public Integer getIngredSafety() {
		return ingredSafety;
	}

	public void setIngredSafety(Integer ingredSafety) {
		this.ingredSafety = ingredSafety;
	}
	
	
	
}
