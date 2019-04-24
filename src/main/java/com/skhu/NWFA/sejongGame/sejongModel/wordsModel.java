package com.skhu.NWFA.sejongGame.sejongModel;

public class wordsModel {

	private int word_id;
	private String justice;
	private String meaning;
	private String hint;
	private int Game_game_id;
	
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
	public String getMeaning() {
		return meaning;
	}
	public void setMeaning(String meaning) {
		this.meaning = meaning;
	}
	public String getHint() {
		return hint;
	}
	public void setHint(String hint) {
		this.hint = hint;
	}
	public int getGame_game_id() {
		return Game_game_id;
	}
	public void setGame_game_id(int game_game_id) {
		Game_game_id = game_game_id;
	}
	
	@Override
	public String toString() {
		return "wordsModel [word_id=" + word_id + ", justice=" + justice + ", meaning=" + meaning + ", hint=" + hint
				+ ", Game_game_id=" + Game_game_id + "]";
	}
	
	
}
