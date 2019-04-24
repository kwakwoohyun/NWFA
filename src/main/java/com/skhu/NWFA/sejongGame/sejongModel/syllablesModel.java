package com.skhu.NWFA.sejongGame.sejongModel;

public class syllablesModel {

	private int syllable_id;
	private String syllable;
	
	public int getSyllable_id() {
		return syllable_id;
	}
	public void setSyllable_id(int syllable_id) {
		this.syllable_id = syllable_id;
	}
	public String getSyllable() {
		return syllable;
	}
	public void setSyllable(String syllable) {
		this.syllable = syllable;
	}
	
	@Override
	public String toString() {
		return "sejongDaoModel [syllable_id=" + syllable_id + ", syllable=" + syllable + "]";
	}
	
}
