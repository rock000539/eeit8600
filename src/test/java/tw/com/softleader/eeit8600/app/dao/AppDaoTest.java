package tw.com.softleader.eeit8600.app.dao;

import static org.junit.Assert.*;
import java.util.List;
import org.junit.Test;
import tw.com.softleader.eeit8600.app.entity.App;

public class AppDaoTest {

	@Test
	public void test() {
		AppDao appDao = new AppDao();

		// SELECT ALL
		List<App> apps = appDao.select();
		int originalSize = apps.size();

		// Test INSERT
		App app1 = new App();
		app1.setId(1);
		app1.setName("部落衝突");
		app1.setDownload(3000);
		app1.setEvaluation(4);
		app1.setUrl("www.abc.com.tw");
		appDao.insert(app1);

		apps = appDao.select();
		assertEquals(originalSize + 1, apps.size());

		// Test SELECT BY ID
		App dbApp = appDao.select(1);
		assertEquals(app1.getName(), dbApp.getName());
		assertEquals(app1.getEvaluation().intValue(), dbApp.getEvaluation().intValue());
		assertEquals(app1.getDownload().intValue(), dbApp.getDownload().intValue());
		assertEquals(app1.getUrl(), dbApp.getUrl());

		// Test UPDATE
		dbApp.setDownload(3500);
		appDao.update(dbApp);
		App updatedApp = appDao.select(1);
		assertEquals(dbApp.getDownload().intValue(), updatedApp.getDownload().intValue());

		// Test DELETE
		appDao.delete(1);
		apps = appDao.select();
		assertEquals(originalSize, apps.size());
	}

}
