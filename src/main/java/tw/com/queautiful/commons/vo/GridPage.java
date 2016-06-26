package tw.com.queautiful.commons.vo;

public class GridPage {
	
	private Integer rows;
	private Integer page;
	private String sidx;
	private String sord;
	
	@Override
	public String toString() {
		return "GridPage [rows=" + rows + ", page=" + page + ", sidx=" + sidx + ", sord=" + sord + "]";
	}
	
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public String getSidx() {
		return sidx;
	}
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}
	public String getSord() {
		return sord;
	}
	public void setSord(String sord) {
		this.sord = sord;
	}
	
}
