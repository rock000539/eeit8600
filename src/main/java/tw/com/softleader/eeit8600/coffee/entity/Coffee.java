package tw.com.softleader.eeit8600.coffee.entity;

import java.util.ArrayList;
import java.util.List;

public class Coffee {
	private int id;	
	private String name;
	private String local;
	private int price;
	private String testing;	
	
	@Override
	public String toString() {
		return "coffeeByParker [id=" + id + ", name=" + name + ", local=" + local + ", price=" + price + ", testing="
				+ testing + "]";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
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
	public int getPrice() {
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
