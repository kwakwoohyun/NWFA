package com.skhu.NWFA.sejongGame.sejongModel;

public class stageModel {

	private int stage_id;
	private int User_user_id;
	private int Sejong_Word_word_id;
	private int star;
	private int lock;

	public int getStage_id() {
		return stage_id;
	}

	public void setStage_id(int stage_id) {
		this.stage_id = stage_id;
	}

	public int getUser_user_id() {
		return User_user_id;
	}

	public void setUser_user_id(int user_user_id) {
		User_user_id = user_user_id;
	}

	public int getSejong_Word_word_id() {
		return Sejong_Word_word_id;
	}

	public void setSejong_Word_word_id(int sejong_Word_word_id) {
		Sejong_Word_word_id = sejong_Word_word_id;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getLock() {
		return lock;
	}

	public void setLock(int lock) {
		this.lock = lock;
	}

	@Override
	public String toString() {
		return "sejongStageModel [stage_id=" + stage_id + ", User_user_id=" + User_user_id + ", Sejong_Word_word_id="
				+ Sejong_Word_word_id + ", star=" + star + ", lock=" + lock + "]";
	}

}
