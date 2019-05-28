package com.skhu.NWFA.user.userService;

import java.util.List;

import com.skhu.NWFA.user.userModel.userModel;
import com.skhu.NWFA.yaminGame.yaminModel.wordsModel;

public interface userService {
	userModel selectID(String userID);
	void insertUserStage(int user_id);
	List<wordsModel> Allwords();
	void insertUserWord(int user_id,int gameNum,int stage_id,int word_id);
}
