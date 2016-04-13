package tw.com.softleader.eeit8600.music.entity;

public class MusicEntity {

	private int muid;
	private String muauthor;
	private String mutitle;
	private Integer muprice;

	
	@Override
	public String toString() {
		return "MusicEntity [muid=" + muid + ", muauthor=" + muauthor
				+ ", mutitle=" + mutitle + ", muprice=" + muprice + "]";
	}
	public int getMuid() {
		return muid;
	}
	public void setMuid(int muid) {
		this.muid = muid;
	}
	public String getMuauthor() {
		return muauthor;
	}
	public void setMuauthor(String muauthor) {
		this.muauthor = muauthor;
	}
	public String getMutitle() {
		return mutitle;
	}
	public void setMutitle(String mutitle) {
		this.mutitle = mutitle;
	}
	public Integer getMuprice() {
		return muprice;
	}
	public void setMuprice(Integer muprice) {
		this.muprice = muprice;
	}	
	
}
