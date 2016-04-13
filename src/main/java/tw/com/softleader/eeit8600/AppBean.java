package tw.com.softleader.eeit8600;

public class AppBean {
	
	private int id;
	private String name;
	private double evaluation;
	private int download;
	private String url;
	
	@Override
	public String toString() {
		return "AppBean [id=" + id + ", name=" + name + ", evaluation=" + evaluation + ", download=" + download
				+ ", url=" + url + "]";
	}
	
	public int getId() {
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
	public double getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(double evaluation) {
		this.evaluation = evaluation;
	}
	public int getDownload() {
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
}
