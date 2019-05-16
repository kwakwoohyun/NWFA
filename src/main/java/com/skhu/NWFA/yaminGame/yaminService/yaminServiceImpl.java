package com.skhu.NWFA.yaminGame.yaminService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.NWFA.user.userModel.userModel;
import com.skhu.NWFA.yaminGame.yaminDao.yaminDao;
import com.skhu.NWFA.yaminGame.yaminModel.stageModel;
import com.skhu.NWFA.yaminGame.yaminModel.syllablesModel;
import com.skhu.NWFA.yaminGame.yaminModel.wordsModel;

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
	public wordsModel yaminWords(String yaminId) {
		// TODO Auto-generated method stub
		return dao.yaminWords(yaminId);
	}

	@Override
	public List<stageModel> yaminStage(int user_id) {
		return dao.yaminStage(user_id);
	}

	@Override
	public List<stageModel> yaminStageAll() {
		return dao.yaminStageAll();
	}

	@Override
	public void stageLockUpdate(int stageId) {
		dao.stageLockUpdate(stageId);
	}

	@Override
	public userModel loginUser(String login_id) {
		return dao.loginUser(login_id);
	}

}
