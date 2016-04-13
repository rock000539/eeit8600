package tw.com.softleader.eeit8600.drama.entity;

public class Drama {

	@Override
	public String toString() {
		return "Drama [id=" + id + ", name=" + name + ", episode=" + episode + ", actor=" + actor + ", channel="
				+ channel + "]";
	}
	private int id;
	private String name;
	private int episode;
	private String actor;
	private int channel;
	
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
	public int getEpisode() {
		return episode;
	}
	public void setEpisode(int episode) {
		this.episode = episode;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public int getChannel() {
		return channel;
	}
	public void setChannel(int channel) {
		this.channel = channel;
	}
	


}
