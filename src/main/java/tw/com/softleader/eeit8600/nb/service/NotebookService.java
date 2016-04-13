package tw.com.softleader.eeit8600.nb.service;

import java.util.ArrayList;
import java.util.List;

import tw.com.softleader.eeit8600.nb.entity.NotebookBean;

public class NotebookService {

	public static void main(String[] args) {
		NotebookBean nb = new NotebookService().getById(1234567);
		System.out.println(nb);
		System.out.println("--------------------------------------------------------");
		List<NotebookBean> nbs = new NotebookService().getAll();
		for (NotebookBean b : nbs) {
			System.out.println(b);
		}
	}

	public NotebookBean getById(int id) {

		NotebookBean nb1 = new NotebookBean();

		nb1.setNbid(1234567);
		nb1.setNbname("Air");
		nb1.setNbprice(25000);

		return nb1;
	}

	public List<NotebookBean> getAll() {
		List<NotebookBean> nbs = new ArrayList<NotebookBean>();

		NotebookBean nb2 = new NotebookBean();

		nb2.setNbid(7654321);
		nb2.setNbname("Air");
		nb2.setNbprice(50000);

		nbs.add(nb2);

		NotebookBean nb3 = new NotebookBean();

		nb3.setNbid(1234567);
		nb3.setNbname("Air");
		nb3.setNbprice(25000);

		nbs.add(nb3);
		
		return nbs;
	}

}
