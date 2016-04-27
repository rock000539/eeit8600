package tw.com.softleader.eeit8600.notebook.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import tw.com.softleader.eeit8600.notebook.entity.Notebook;

@Service
public class NotebookService {

	public static void main(String[] args) {
		Notebook nb = new NotebookService().getById(1);
		System.out.println(nb);
		System.out.println("--------------------------------------------------------");
		List<Notebook> nbs = new NotebookService().getAll();
		for (Notebook b : nbs) {
			System.out.println(b);
		}
	}

	public Notebook getById(int id) {

		Notebook nb1 = new Notebook();

		nb1.setId(1);
		nb1.setBrand("ASUS");
		nb1.setName("ZenBook");
		nb1.setCpu("Intel® Core™ M 5Y10 處理器");
		nb1.setPrice(40000);

		return nb1;
	}

	public List<Notebook> getAll() {
		List<Notebook> nbs = new ArrayList<Notebook>();

		Notebook nb1 = new Notebook();

		nb1.setId(1);
		nb1.setBrand("ASUS");
		nb1.setName("ZenBook");
		nb1.setCpu("Intel® Core™ M 5Y10 處理器");
		nb1.setPrice(40000);

		nbs.add(nb1);

		Notebook nb2 = new Notebook();

		nb2.setId(2);
		nb2.setBrand("ASUS");
		nb2.setName("ROG");
		nb2.setCpu("Intel® Core™ i7 4860HQ /4710HQ 處理器");
		nb2.setPrice(50000);

		nbs.add(nb2);
		
		return nbs;
	}

}
