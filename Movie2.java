package com.eeit8626;

public class Movie {
	
	
	@Override
	public String toString() {
		return "Movie [id=" + id + ", name=" + name + ", price=" + price
				+ ", actor=" + actor + ", room=" + room + "]";
	}

	private int id;
	private String name;
	private int price;
	private String actor;
	private String room;
	
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	
	public static void main(String[] args) {

	}

}
