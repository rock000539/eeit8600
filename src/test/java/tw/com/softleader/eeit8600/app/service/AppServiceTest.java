package tw.com.softleader.eeit8600.app.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import tw.com.softleader.eeit8600.app.entity.AppEntity;

public class AppServiceTest {

	AppService service = new AppService();

	@Test
	public void testSelect() {
		List<AppEntity> apps = service.select(null);
		assertEquals(0, apps.size());
	}

	// @Test
	// public void testInsert() {
	// AppEntity app = new AppEntity();
	// app.setId(1);
	// app.setName("部落衝突");
	// app.setEvaluation(5);
	// app.setDownload(3000000);
	// app.setUrl("www.coc.com.tw");
	//
	// AppEntity temp = service.insert(app);
	// assertEquals(app.getId(), temp.getId());
	// }

	// @Test
	// public void testUpdate() {
	// AppEntity app = new AppEntity();
	// app.setId(1);
	// app.setName("部落衝突");
	// app.setEvaluation(5);
	// app.setDownload(3000000);
	// app.setUrl("www.cocnew.com.tw");
	//
	// AppEntity temp = service.update(app);
	// assertEquals("www.cocnew.com.tw", temp.getUrl());
	// }

	// @Test
	// public void testDelete() {
	// AppEntity app = new AppEntity();
	// app.setId(1);
	// assertEquals(true, service.delete(app));
	// }

}
