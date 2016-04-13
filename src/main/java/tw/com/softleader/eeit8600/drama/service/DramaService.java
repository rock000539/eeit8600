package tw.com.softleader.eeit8600.drama.service;

import java.util.ArrayList;
import java.util.List;

import tw.com.softleader.eeit8600.drama.entity.Drama;

public class DramaService {

	
	public static void main(String[] args) {
		DramaService ds = new DramaService();
		System.out.println(ds.getById());
		System.out.println("---------------------------------------------------------------------------------");
		List<Drama> dss=ds.getAll();
		for(Drama d:dss){
			System.out.println(d);
		}

	}
	
	public Drama getById(){
		Drama drama = new Drama();
		drama.setId(1);
		drama.setName("The Walking Dead");
		drama.setEpisode(20);
		drama.setActor("Rick Grimes");
		drama.setChannel(79);
		
		return drama;
		
	}
	
	public List<Drama> getAll(){
		List<Drama> dramas = new ArrayList<Drama>();
		Drama d1 = new Drama();
		d1.setId(1);
		d1.setName("The Walking Dead");
		d1.setEpisode(20);
		d1.setActor("Rick Grimes");
		d1.setChannel(79);
		dramas.add(d1);
		
		Drama d2 = new Drama();
		d2.setId(2);
		d2.setName("Glee");
		d2.setEpisode(22);
		d2.setActor("Will Schuester");
		d2.setChannel(45);
		dramas.add(d2);
		
		return dramas;
		
		
	}

}
