package com.skhu.NWFA.dictionary.dictService;

import java.util.List;

import com.skhu.NWFA.dictionary.dictModel.wordModel;
import com.skhu.NWFA.dictionary.dictModel.wrongNote;
import com.skhu.NWFA.user.userModel.userModel;
import com.skhu.NWFA.user.userModel.userStages;

public interface dictService {

	List<wordModel> dictWordAll(int user_id);

	void setFavorite(int user_id, int word_id);

	void removeFavorite(int user_id, int word_id);

	userModel loginUser(String login_id);

	List<wordModel> searchWord(int user_id, String value);

	List<wrongNote> wrongNote(int user_id, int stage_id, int gameNum);

	List<userStages> stageIsLock(int user_id, int gameNum);

}
