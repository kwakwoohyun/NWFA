package com.skhu.NWFA.sejongGame.sejongDao;

import java.util.List;

import org.springframework.context.annotation.Configuration;

import com.skhu.NWFA.sejongGame.sejongModel.stageModel;
import com.skhu.NWFA.sejongGame.sejongModel.syllablesModel;
import com.skhu.NWFA.sejongGame.sejongModel.wordsModel;
import com.skhu.NWFA.user.userModel.userModel;
import com.skhu.NWFA.user.userModel.userStages;

@Configuration
public interface sejongDao {
	
	List<wordsModel> sejongWords(String stage_id, String word_id, String gameNum);
	
	List<syllablesModel> example(int count);

	List<stageModel> sejongStage(int user_id);

	List<stageModel> sejongStageAll();

	void stageLockUpdate(int stageId, int userId);

	userModel loginUser(String id);

	void starUpdate(int star, int stageId, int User_user_id);

	void setStar(int user_id, int star);

	List<userStages> selectUserStage(int id);
	
	List<wordsModel> LobbyWords(int stage);
}