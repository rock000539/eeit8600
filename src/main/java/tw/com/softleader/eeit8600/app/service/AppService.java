package tw.com.softleader.eeit8600.app.service;

import java.util.List;
import java.sql.SQLException;
import java.util.ArrayList;

import tw.com.softleader.eeit8600.app.dao.AppDao;
import tw.com.softleader.eeit8600.app.entity.AppEntity;

public class AppService {

	// public static void main(String[] args) {
	// AppService service = new AppService();
	//
	// // Test select all
	// List<AppEntity> apps = service.select(null);
	// for (AppEntity temp : apps)
	// System.out.println(temp);
	// System.out.println();
	//
	// AppEntity app = new AppEntity();
	// app.setId(1);
	// app.setName("部落衝突");
	// app.setEvaluation(5);
	// app.setDownload(3000000);
	// app.setUrl("www.coc.com.tw");
	//
	// // Test insert
	// System.out.print("insert: ");
	// System.out.println(service.insert(app) + "\n");
	//
	// // Test select
	// apps = service.select(app);
	// System.out.print("select: ");
	// for (AppEntity temp : apps)
	// System.out.println(temp + "\n");
	//
	// // Test update
	// app.setUrl("www.cocnew.com.tw");
	// System.out.print("update: ");
	// System.out.println(service.update(app) + "\n");
	//
	// // Test delete
	// System.out.print("delete: ");
	// System.out.println(service.delete(app) + "\n");
	// }

	private AppDao appDao = new AppDao();

	public List<AppEntity> select(AppEntity app) {
		List<AppEntity> result = null;
		if (app != null) {
			AppEntity temp = appDao.select(app.getId());
			if (temp != null) {
				result = new ArrayList<AppEntity>();
				result.add(temp);
			}
		} else {
			result = appDao.select();
		}
		return result;
	}

	public AppEntity insert(AppEntity app) throws SQLException {
		AppEntity result = null;
		if (app != null)
			result = appDao.insert(app);
		return result;
	}

	public AppEntity update(AppEntity app) {
		AppEntity result = null;
		if (app != null)
			result = appDao.update(app.getName(), app.getEvaluation().intValue(), app.getEvaluation().intValue(),
					app.getUrl(), app.getId().intValue());
		return result;
	}

	public boolean delete(AppEntity app) {
		Boolean result = null;
		if (app != null)
			result = appDao.delete(app.getId());
		return result;
	}
}
