package com.skhu.NWFA.yaminGame.yaminService;

import java.util.List;

import com.skhu.NWFA.user.userModel.userModel;
import com.skhu.NWFA.yaminGame.yaminModel.stageModel;
import com.skhu.NWFA.yaminGame.yaminModel.syllablesModel;
import com.skhu.NWFA.yaminGame.yaminModel.wordsModel;

public interface yaminService {

	List<syllablesModel> example(int count);

	wordsModel yaminWords(String yaminId);

	List<stageModel> yaminStage(int user_id);

	List<stageModel> yaminStageAll();

	void stageLockUpdate(int stageId, int userId);

	userModel loginUser(String login_id);
}
