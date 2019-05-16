package com.skhu.NWFA.yaminGame.yaminModel;

public class stageModel {

	private int stage_id;
	private int User_user_id;
	private int Yamin_Word_word_id;
	private int star;
	private int open_game;

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

	public int getYamin_Word_word_id() {
		return Yamin_Word_word_id;
	}

	public void setYamin_Word_word_id(int yamin_Word_word_id) {
		Yamin_Word_word_id = yamin_Word_word_id;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getOpen_game() {
		return open_game;
	}

	public void setgetOpen_game(int open_game) {
		this.open_game = open_game;
	}

	@Override
	public String toString() {
		return "yaminStageModel [stage_id=" + stage_id + ", User_user_id=" + User_user_id + ",  Yamin_Word_word_id="
				+ Yamin_Word_word_id + ", star=" + star + ", open_game=" + open_game + "]";
	}

}
