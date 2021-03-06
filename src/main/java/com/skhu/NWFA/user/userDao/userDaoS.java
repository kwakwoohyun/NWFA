package com.skhu.NWFA.user.userDao;

import java.util.List;

import org.springframework.context.annotation.Configuration;

import com.skhu.NWFA.user.userModel.userModel;
import com.skhu.NWFA.yaminGame.yaminModel.wordsModel;

@Configuration
public interface userDaoS {
	
	userModel selectID(String userID);

	void insertUserStage(int user_id);
	
	List<wordsModel> Allwords();
	
	void insertUserWord(int user_id,int gameNum,int stage_id,int word_id);
	
}
