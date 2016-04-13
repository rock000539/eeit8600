package tw.com.softleader.eeit8600.app.service;

import java.util.ArrayList;
import java.util.List;

import tw.com.softleader.eeit8600.app.entity.AppBean;

public class AppService {

	public static void main(String[] args) {
		
		AppService as = new AppService();
		
		AppBean bean = as.getById(1);
		System.out.println(bean);
		System.out.println();
		
		List<AppBean> list = as.getAll();
		for(AppBean ab:list){
			System.out.println(ab);
		}
	}
	
	public AppBean getById(int id){
		AppBean bean = new AppBean();
		
		bean.setId(1);
		bean.setName("部落衝突");
		bean.setDownload(3000000);
		bean.setEvaluation(4.8);
		bean.setUrl("www.abc.com.tw");
		
		return bean;
	}
	
	public List<AppBean> getAll(){
		List<AppBean> list = new ArrayList<AppBean>();
		
		AppBean bean1 = new AppBean();
		
		bean1.setId(1);
		bean1.setName("部落衝突");
		bean1.setDownload(3000000);
		bean1.setEvaluation(4.8);
		bean1.setUrl("www.abc.com.tw");
		list.add(bean1);
		
		AppBean bean2 = new AppBean();
		bean2.setId(2);
		bean2.setName("皇室戰爭");
		bean2.setDownload(1000000);
		bean2.setEvaluation(4.3);
		bean2.setUrl("www.def.com.tw");
		list.add(bean2);
		
		return list;
	}
}
