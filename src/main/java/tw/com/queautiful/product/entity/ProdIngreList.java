package tw.com.queautiful.product.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.metamodel.binding.CascadeType;
import org.springframework.beans.factory.annotation.Autowired;

@Entity
@IdClass(ProdIngreListId.class)
@Table(name = "PROINGRELIST")
public class ProdIngreList implements Serializable{
	@Id
	@Column(name = "PRODID")
	private Long prodId;
	
	@Id
	@Column(name = "INGREDId")
	private Long ingredId;

	public Long getProdId() {
		return prodId;
	}

	public void setProdId(Long prodId) {
		this.prodId = prodId;
	}

	public Long getIngredId() {
		return ingredId;
	}

	public void setIngredId(Long ingredId) {
		this.ingredId = ingredId;
	}

	@Override
	public String toString() {
		return "ProdIngreList [prodId=" + prodId + ", ingredId=" + ingredId + "]";
	}

}
