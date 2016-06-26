package tw.com.softleader.eeit8600.coffee.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="coffee")
public class Coffee {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private Long id;	
	
	@Column(name="NAME", length=20)
	private String name;
	
	@Column(name="LOCAL", length=20)
	private String local;
	
	@Column(name="PRICE")
	private int price;
	
	@Column(name="TESTING")
	private String testing;	
	
	public Coffee(){};
	public Coffee(Long id, String name, String local, int price, String testing) {
		this.id=id;;
		this.name=name;
		this.local=local;
		this.price=price;
		this.testing=testing;
	}

	@Override
	public String toString() {
		return "coffeeByParker [id=" + id + ", name=" + name + ", local=" + local + ", price=" + price + ", testing="
				+ testing + "]";
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTesting() {
		return testing;
	}
	public void setTesting(String testing) {
		this.testing = testing;
	}

	
}
