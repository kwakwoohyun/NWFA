package com.skhu.NWFA.yaminGame.yaminModel;

public class wordsModel {

	private int word_id;
	private String justice;
	private String mean;
	private int gameNub;
	private byte[] img;
	private String yamin_word;
	private String yamin_example;

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

	public String getYamin_word() {
		return yamin_word;
	}

	public void setYamin_word(String yamin_word) {
		this.yamin_word = yamin_word;
	}

	public String getYamin_example() {
		return yamin_example;
	}

	public void setYamin_example(String yamin_example) {
		this.yamin_example = yamin_example;
	}

}
