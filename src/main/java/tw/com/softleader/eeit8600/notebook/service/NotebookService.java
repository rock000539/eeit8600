package tw.com.softleader.eeit8600.notebook.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.eeit8600.notebook.dao.NotebookDao;
import tw.com.softleader.eeit8600.notebook.entity.Notebook;

@Service
public class NotebookService {

	@Autowired
	private NotebookDao notebookDao;
	
	/*
	public NotebookService(){
		notebookDao = new NotebookDao();
	}
	*/
	public Notebook getById(Long id){
		return notebookDao.findOne(id);
	}
	
	public List<Notebook> getAll(){
	
		List<Notebook> notebooks = notebookDao.findAll();
		if(notebooks.isEmpty()){
		Notebook notebook1 = new Notebook("ASUS" ,"ZenBook-UX305FA" ,"Intel Core M 5Y10 處理器" ,40000);
		Notebook notebook2 = new Notebook("ASUS" ,"ROG-G751JY","Intel Core i7 4860HQ 處理器" ,50000);
		Notebook notebook3 = new Notebook("ASUS" ,"N551JB" ,"Intel Core	 i7 4720HQ 處理器" ,35000);
		Notebook notebook4 = new Notebook("acer" ,"VN7-792G-76Y0" ,"Intel Core i7-6700HQ 處理器 " ,40000);
		Notebook notebook5 = new Notebook("acer" ,"S7-393-55204G25ews" ,"Intel Core i5-5200U 處理器" ,30000);
		
		notebookDao.save(notebook1);
		notebookDao.save(notebook2);
		notebookDao.save(notebook3);
		notebookDao.save(notebook4);
		notebookDao.save(notebook5);
		}
		return notebookDao.findAll();
	}
	
	public void insert(Notebook notebook){
		notebookDao.save(notebook);
	}
	
	public void update(Notebook notebook){
		notebookDao.save(notebook);
	}
	
	public void delete(Long id){
		notebookDao.delete(id);
	}
/* 0428 before spring
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
*/
}
