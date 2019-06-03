package com.skhu.NWFA.dictionary.dictService;

import java.util.List;

import com.skhu.NWFA.dictionary.dictModel.wordModel;
import com.skhu.NWFA.user.userModel.userModel;

public interface dictService {

	List<wordModel> dictWordAll(int user_id);

	void setFavorite(int user_id, int word_id);

	void removeFavorite(int user_id, int word_id);

	userModel loginUser(String login_id);

	List<wordModel> searchWord(int user_id, String value);

}
