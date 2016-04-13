package tw.com.softleader.eeit8600.music.service;

import java.util.*;

import tw.com.softleader.eeit8600.music.entity.MusicEntity;

public class MusicService {

	public static void main(String[] args) {
		MusicEntity music = new MusicService().getById(1);
		System.out.println(music);
		System.out.println("--------------------------------------------------------");
		
		List<MusicEntity> musics = new MusicService().getAll();
		for (MusicEntity m: musics){
			System.out.println(m);
		}
	}
	
	public MusicEntity getById(int muid){
		MusicEntity music1 = new MusicEntity();
		music1.setMuid(1);
		music1.setMuauthor("Beethoven");
		music1.setMutitle("No.5 Syn.");
		music1.setMuprice(500);
		
		return music1;
	
	}
	
	public List<MusicEntity> getAll() {
		List<MusicEntity> musics = new ArrayList<MusicEntity>();
		
		MusicEntity music1 = new MusicEntity();
		music1.setMuid(1);
		music1.setMuauthor("Beethoven");
		music1.setMutitle("No.5 Syn.");
		music1.setMuprice(500);
		
		musics.add(music1);
		
		MusicEntity music2 = new MusicEntity();
		music2.setMuid(2);
		music2.setMuauthor("Mozart");
		music2.setMutitle("No.8 Ter.");
		music2.setMuprice(600);
		
		musics.add(music2);
		
		return musics;
		
	}


}

