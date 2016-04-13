package tw.com.softleader.eeit8600.nb.entity;

public class NotebookBean {



	private int nbid;
	   public int getNbid() {
		return nbid;
	}
	public void setNbid(int nbid) {
		this.nbid = nbid;
	}
	public String getNbname() {
		return nbname;
	}
	public void setNbname(String nbname) {
		this.nbname = nbname;
	}
	public Integer getNbprice() {
		return nbprice;
	}
	public void setNbprice(Integer nbprice) {
		this.nbprice = nbprice;
	}
	private String nbname;
	   private Integer nbprice;
	@Override
	public String toString() {
		return "NotebookBean [nbid=" + nbid + ", nbname=" + nbname + ", nbprice=" + nbprice + "]";
	}

	  
}
