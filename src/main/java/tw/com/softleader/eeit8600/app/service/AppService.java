package tw.com.softleader.eeit8600.app.service;

import java.util.ArrayList;
import java.util.List;

import tw.com.softleader.eeit8600.app.entity.App;

public class AppService {

//	public static void main(String[] args) {
//		
//		AppService as = new AppService();
//		
//		AppBean bean = as.getById(1);
//		System.out.println(bean);
//		System.out.println();
//		
//		List<AppBean> list = as.getAll();
//		for(AppBean ab:list){
//			System.out.println(ab);
//		}
//	}
	
	public App getById(int id){
		App bean = new App();
		
		bean.setId(1);
		bean.setName("部落衝突");
		bean.setDownload(3000000);
		bean.setEvaluation(4);
		bean.setUrl("www.abc.com.tw");
		
		return bean;
	}
	
	public List<App> getAll(){
		List<App> list = new ArrayList<App>();
		
		App bean1 = new App();
		
		bean1.setId(1);
		bean1.setName("部落衝突");
		bean1.setDownload(3000000);
		bean1.setEvaluation(4);
		bean1.setUrl("www.abc.com.tw");
		list.add(bean1);
		
		App bean2 = new App();
		bean2.setId(2);
		bean2.setName("皇室戰爭");
		bean2.setDownload(1000000);
		bean2.setEvaluation(4);
		bean2.setUrl("www.def.com.tw");
		list.add(bean2);
		
		return list;
	}
}
