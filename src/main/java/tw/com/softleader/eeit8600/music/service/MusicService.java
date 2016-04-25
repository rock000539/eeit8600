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
		music1.setId(1);
		music1.setAuthor("Beethoven");
		music1.setTitle("No.5 Syn.");
		music1.setPrice(500);
		
		return music1;
	
	}
	
	public List<MusicEntity> getAll() {
		List<MusicEntity> musics = new ArrayList<MusicEntity>();
		
		MusicEntity music1 = new MusicEntity();
		music1.setId(1);
		music1.setAuthor("Beethoven");
		music1.setTitle("No.5 Syn.");
		music1.setPrice(500);
		
		musics.add(music1);
		
		MusicEntity music2 = new MusicEntity();
		music2.setId(2);
		music2.setAuthor("Mozart");
		music2.setTitle("No.8 Ter.");
		music2.setPrice(600);
		
		musics.add(music2);
		
		return musics;
		
	}


}

