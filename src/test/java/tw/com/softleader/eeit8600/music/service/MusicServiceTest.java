package tw.com.softleader.eeit8600.music.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import tw.com.softleader.eeit8600.music.entity.MusicEntity;
import tw.com.softleader.eeit8600.music.service.MusicService;

public class MusicServiceTest {

	@Test
	public void testGetById() {
		MusicService musicService = new MusicService();
		
		MusicEntity music = musicService.getById(1);
		
		assertEquals("Beethoven", music.getMuauthor());
		assertEquals(500, music.getMuprice().intValue());
	}
	
	@Test
	public void testGetAll() {
		MusicService musicService = new MusicService();
		List<MusicEntity> musics = musicService.getAll();
		
		assertEquals(2, musics.size());
	}

}
