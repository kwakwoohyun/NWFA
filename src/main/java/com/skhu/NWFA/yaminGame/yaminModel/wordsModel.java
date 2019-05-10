package com.skhu.NWFA.yaminGame.yaminModel;

public class wordsModel {

	private int word_id;
	private String justice;
	private String mean;
	private int gameNub;
	private byte[] img;

	public int getWord_id() {
		return word_id;
	}

	public byte[] getImg() {
		return img;
	}

	public void setImg(byte[] img) {
		this.img = img;
	}

	public void setWord_id(int word_id) {
		this.word_id = word_id;
	}

	public String getJustice() {
		return justice;
	}

	public void setJustice(String justice) {
		this.justice = justice;
	}

	public String getMean() {
		return mean;
	}

	public void setMean(String mean) {
		this.mean = mean;
	}

	public int getGameNub() {
		return gameNub;
	}

	public void setGameNub(int gameNub) {
		this.gameNub = gameNub;
	}

}
