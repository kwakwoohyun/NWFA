package com.skhu.NWFA.yaminGame.yaminModel;

public class wordsModel {

	private int word_id;
	private String justice;
	private String mean;
	private int gameNum;
	private String img;
	private int stage_id;
	private String question;

	public int getWord_id() {
		return word_id;
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

	public int getGameNum() {
		return gameNum;
	}

	public void setGameNum(int gameNum) {
		this.gameNum = gameNum;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getStage_id() {
		return stage_id;
	}

	public void setStage_id(int stage_id) {
		this.stage_id = stage_id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	@Override
	public String toString() {
		return "wordsModel [word_id=" + word_id + ", justice=" + justice + ", mean=" + mean + ", gameNum=" + gameNum
				+ ", img=" + img + ", stage_id=" + stage_id + ", question=" + question + "]";
	}

}
