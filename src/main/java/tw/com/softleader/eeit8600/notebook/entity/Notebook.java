package tw.com.softleader.eeit8600.notebook.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/*
 private int        id;
 private String  brand;
 private String   name;
 private String    cpu;
 private Integer price;
 */



@Entity
@Table(name = "NOTEBOOK")
public class Notebook {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private Long id;
	
	@Column(name="BRAND", length=50)
	private String brand;
	
	@Column(name="NAME", length=50)
	private String name;
	
	@Column(name="CPU", length=50)
	private String cpu;
	
	@Column(name="PRICE")
	private Integer price;
	
	public Notebook(){}
	
	public Notebook(String brand,String name,String cpu,Integer price){
		this.brand=brand;
		this.name=name;
		this.cpu=cpu;
		this.price=price;
	}
	
	@Override
	public String toString() {
		return "Notebook [id=" + id + ", brand=" + brand + ", name=" + name
				+ ", cpu=" + cpu + ", price=" + price + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCpu() {
		return cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}
}
