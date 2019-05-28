package com.skhu.NWFA.yaminGame.yaminService;

import java.util.List;

import com.skhu.NWFA.user.userModel.userModel;
import com.skhu.NWFA.yaminGame.yaminModel.syllablesModel;
import com.skhu.NWFA.yaminGame.yaminModel.wordsModel;

public interface yaminService {

	List<syllablesModel> example(int count);

	List<wordsModel> yaminWords(String yaminStageId,String gameNum);

	void stageLockUpdate(int stageId, int userId);

	userModel loginUser(String login_id);
}
