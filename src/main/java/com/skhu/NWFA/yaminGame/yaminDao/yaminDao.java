package com.skhu.NWFA.yaminGame.yaminDao;

import java.util.List;

import org.springframework.context.annotation.Configuration;

import com.skhu.NWFA.user.userModel.userModel;
import com.skhu.NWFA.yaminGame.yaminModel.syllablesModel;
import com.skhu.NWFA.yaminGame.yaminModel.wordsModel;

@Configuration
public interface yaminDao {
	List<syllablesModel> example(int count);

	List<wordsModel> yaminWords(String yaminStageId,String gameNum);

	void yaminWordsCorrect(String gameNum, String yaminStageId, int user_id, int word_id, String answer);

	void yaminWordsSave(String gameNum, String yaminStageId, int user_id, int word_id,String answer);

	void stageLockUpdate(int stageId,int userId);

	userModel loginUser(String login_id);
}
