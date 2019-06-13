package com.skhu.NWFA.yaminGame.yaminService;

import java.util.List;

import com.skhu.NWFA.user.userModel.userModel;
import com.skhu.NWFA.user.userModel.userStages;
import com.skhu.NWFA.yaminGame.yaminModel.syllablesModel;
import com.skhu.NWFA.yaminGame.yaminModel.wordsModel;
import com.skhu.NWFA.yaminGame.yaminModel.yaminWordsModel;

public interface yaminService {

	List<syllablesModel> example(int count);

	List<wordsModel> yaminWords(String yaminStageId,String gameNum);

	void yaminWordsCorrect(String gameNum, String yaminStageId, int user_id, int word_id, String answer);

	void yaminWordsSave(String gameNum, String yaminStageId, int user_id, int word_id,String answer);

	void stageLockUpdate(int stageId, int userId);

	userModel loginUser(String login_id);

	List<yaminWordsModel> yaminWrongNote(int user_id,String yaminStageId);

	void setScore(int user_id, int stage_id, int gameNum, int score);

	List<userStages> selectUserStage(int id);
}
