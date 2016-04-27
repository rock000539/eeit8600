package tw.com.softleader.eeit8600.app.entity;

public class AppEntity {

	private Integer id;
	private String name;
	private Integer evaluation;
	private Integer download;
	private String url;
	
	public AppEntity(){
		
	}
	
	public AppEntity(Integer id, String name, Integer evaluation, Integer download, String url){
		super();
		this.id = id;
		this.name = name;
		this.evaluation = evaluation;
		this.download = download;
		this.url = url;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getEvaluation() {
		return evaluation;
	}

	public void setEvaluation(Integer evaluation) {
		this.evaluation = evaluation;
	}

	public Integer getDownload() {
		return download;
	}

	public void setDownload(int download) {
		this.download = download;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "AppBean [id=" + id + ", name=" + name + ", evaluation=" + evaluation + ", download=" + download
				+ ", url=" + url + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (obj != null && (obj instanceof AppEntity)) {
			AppEntity temp = (AppEntity) obj;
			if (this.id == temp.id)
				return true;
		}
		return false;
	}
}
