package tw.com.softleader.eeit8600.coffee.service;

import java.util.ArrayList;
import java.util.List;

import tw.com.softleader.eeit8600.coffee.entity.Coffee;


public class CoffeeService {

	public void getAll() {
		List<Coffee> result = new ArrayList<Coffee>();
		Coffee cp1 = new Coffee();

		cp1.setId(1);
		cp1.setName("type1");
		cp1.setLocal("jp");
		cp1.setPrice(200);
		cp1.setTesting("not bad");

		Coffee cp2 = new Coffee();
		cp2.setId(2);
		cp2.setName("type2");
		cp2.setLocal("us");
		cp2.setPrice(500);
		cp2.setTesting("bad");

		result.add(cp1);
		result.add(cp2);
		for (int i = 0; i < result.size(); i++) {
			System.out.println(result.get(i));
		}
	}

	public Coffee getByid() {
		Coffee cp1 = new Coffee();

		cp1.setId(1);
		cp1.setName("type1");
		cp1.setLocal("jp");
		cp1.setPrice(200);
		cp1.setTesting("not bad");
		System.out.println(cp1);
		return cp1;
	}

	public static void main(String[] args) {
		CoffeeService cp = new CoffeeService();
		cp.getAll();
		cp.getByid();
	}

}
