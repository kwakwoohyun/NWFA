package com.skhu.NWFA.dictionary.dictModel;

public class wrongNote {
	private int word_id;
	private String justice;
	private String mean;
	private int gameNum;
	private String img;
	private int stage_id;
	private String question;
	private String year;
	private String answer;
	private int isCorrect;

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

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getIsCorrect() {
		return isCorrect;
	}

	public void setIsCorrect(int isCorrect) {
		this.isCorrect = isCorrect;
	}

	@Override
	public String toString() {
		return "yaminWordsModel [word_id=" + word_id + ", justice=" + justice + ", mean=" + mean + ", gameNum="
				+ gameNum + ", img=" + img + ", stage_id=" + stage_id + ", question=" + question + ", year=" + year
				+ ", answer=" + answer + ", isCorrect=" + isCorrect + "]";
	}

}
