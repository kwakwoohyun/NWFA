package com.skhu.NWFA.yaminGame.yaminModel;

public class syllablesModel {

	private int syllables_id;
	private String syllables;

	public int getSyllable_id() {
		return syllables_id;
	}
	public void setSyllable_id(int syllable_id) {
		this.syllables_id = syllable_id;
	}
	public String getSyllable() {
		return syllables;
	}
	public void setSyllable(String syllables) {
		this.syllables = syllables;
	}

	@Override
	public String toString() {
		return "sejongDaoModel [syllable_id=" + syllables_id + ", syllable=" + syllables + "]";
	}

}
