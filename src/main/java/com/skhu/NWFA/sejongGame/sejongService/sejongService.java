package com.skhu.NWFA.sejongGame.sejongService;

import java.util.List;

import com.skhu.NWFA.sejongGame.sejongModel.stageModel;
import com.skhu.NWFA.sejongGame.sejongModel.syllablesModel;
import com.skhu.NWFA.sejongGame.sejongModel.wordsModel;
import com.skhu.NWFA.user.userModel.userModel;
import com.skhu.NWFA.user.userModel.userStages;

public interface sejongService {

	List<wordsModel> sejongWords(String stage_id,String word_id, String gameNum);
	
	List<syllablesModel> example(int count);

	List<stageModel> sejongStage(int user_id);

	List<stageModel> sejongStageAll();

	void stageLockUpdate(int stageId,int userId);

	userModel loginUser(String id);

	void starUpdate(int star, int parseInt, int user_user_id);

	void setStar(int user_id, int star);
	
	List<userStages> selectUserStage(int id);
	
	List<wordsModel> LobbyWords(int stage);
}