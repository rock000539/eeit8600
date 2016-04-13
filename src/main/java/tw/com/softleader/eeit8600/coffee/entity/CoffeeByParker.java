package tw.com.softleader.eeit8600.coffee.entity;

import java.util.ArrayList;
import java.util.List;

public class CoffeeByParker {

	private String name;
	private String local;
	private int price;
	private String testing;	
	private int id;
	
	
	
	public void getAll(){
		List<CoffeeByParker> result=new ArrayList<CoffeeByParker>();
		CoffeeByParker cp1=new CoffeeByParker();

		cp1.setId(1);
		cp1.setName("type1");
		cp1.setLocal("jp");
		cp1.setPrice(200);
		cp1.setTesting("not bad");
		
		CoffeeByParker cp2=new CoffeeByParker();
		cp2.setId(2);
		cp2.setName("type2");
		cp2.setLocal("us");
		cp2.setPrice(500);
		cp2.setTesting("bad");
		
		result.add(cp1);
		result.add(cp2);
		for(int i=0;i<result.size();i++){
			System.out.println(result.get(i));
		}
		
	}
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
