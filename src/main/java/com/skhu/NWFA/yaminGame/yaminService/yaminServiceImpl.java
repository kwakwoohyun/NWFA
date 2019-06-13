package com.skhu.NWFA.yaminGame.yaminService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.NWFA.user.userModel.userModel;
import com.skhu.NWFA.user.userModel.userStages;
import com.skhu.NWFA.yaminGame.yaminDao.yaminDao;
import com.skhu.NWFA.yaminGame.yaminModel.syllablesModel;
import com.skhu.NWFA.yaminGame.yaminModel.wordsModel;
import com.skhu.NWFA.yaminGame.yaminModel.yaminWordsModel;

@Service
public class yaminServiceImpl implements yaminService {

	@Autowired(required = false)
	yaminDao dao;

	@Override
	public List<syllablesModel> example(int count) {
		// TODO Auto-generated method stub
		return dao.example(count);
	}

	@Override
	public List<wordsModel> yaminWords(String yaminStageId, String gameNum) {
		// TODO Auto-generated method stub
		return dao.yaminWords(yaminStageId, gameNum);
	}

	@Override
	public userModel loginUser(String login_id) {
		return dao.loginUser(login_id);
	}

	@Override
	public void stageLockUpdate(int stageId, int userId) {
		dao.stageLockUpdate(stageId, userId);
	}

	@Override
	public void yaminWordsCorrect(String gameNum, String yaminStageId, int user_id, int word_id, String answer) {
		dao.yaminWordsCorrect(gameNum, yaminStageId, user_id, word_id, answer);

	}

	@Override
	public void yaminWordsSave(String gameNum, String yaminStageId, int user_id, int word_id, String answer) {
		dao.yaminWordsSave(gameNum, yaminStageId, user_id, word_id, answer);

	}

	@Override
	public List<yaminWordsModel> yaminWrongNote(int user_id, String yaminStageId) {

		return dao.yaminWrongNote(user_id, yaminStageId);
	}

	@Override
	public void setScore(int user_id, int stage_id, int gameNum, int score) {
		dao.setScore(user_id, stage_id, gameNum, score);

	}

	@Override
	public List<userStages> selectUserStage(int id) {
		return dao.selectUserStage(id);
	}

}
