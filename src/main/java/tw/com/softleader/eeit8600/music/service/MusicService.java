package tw.com.softleader.eeit8600.music.service;

import java.util.List;

import org.springframework.stereotype.Service;

import tw.com.softleader.eeit8600.music.dao.MusicDao;
import tw.com.softleader.eeit8600.music.entity.MusicEntity;

@Service
public class MusicService {
		
		private MusicDao musicDao;
		
		public MusicService() {
			musicDao = new MusicDao();
		}
		
		public MusicEntity getById(int id) {
			return musicDao.findById(id);		
		}
		
		public List<MusicEntity> getAll() {
			return musicDao.findAll();
		}
		
		public void insert(MusicEntity music) {
			musicDao.insert(music);
		}
		
		public void update(MusicEntity music) {
			musicDao.update(music);
		}
		
		public void delete(int id) {
			musicDao.delete(id);
		}

}

//public static void main(String[] args) {
//MusicEntity music = new MusicService().getById(1);
//System.out.println(music);
//System.out.println("--------------------------------------------------------");
//
//List<MusicEntity> musics = new MusicService().getAll();
//for (MusicEntity m: musics){
//	System.out.println(m);
//}
//}
//
//public MusicEntity getById(int muid){
//MusicEntity music1 = new MusicEntity();
//music1.setId(1);
//music1.setAuthor("Beethoven");
//music1.setTitle("No.5 Syn.");
//music1.setPrice(500);
//
//return music1;
//
//}
//
//public List<MusicEntity> getAll() {
//List<MusicEntity> musics = new ArrayList<MusicEntity>();
//
//MusicEntity music1 = new MusicEntity();
//music1.setId(1);
//music1.setMusicNo("014-1972-0426");
//music1.setAuthor("Beethoven");
//music1.setTitle("No.5 Syn.");
//music1.setPrice(500);
//
//musics.add(music1);
//
//MusicEntity music2 = new MusicEntity();
//music2.setId(2);
//music2.setMusicNo("015-1993-0620");
//music2.setAuthor("Mozart");
//music2.setTitle("No.8 Ter.");
//music2.setPrice(600);
//
//musics.add(music2);
//
//return musics;
//
//}