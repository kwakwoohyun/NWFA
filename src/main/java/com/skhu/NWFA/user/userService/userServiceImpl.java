package com.skhu.NWFA.user.userService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.NWFA.user.userDao.userDaoS;
import com.skhu.NWFA.user.userModel.userModel;
import com.skhu.NWFA.yaminGame.yaminModel.wordsModel;

@Service
public class userServiceImpl implements userService {

	@Autowired(required = false)
	userDaoS dao;

	@Override
	public userModel selectID(String userID) {
		// TODO Auto-generated method stub
		return dao.selectID(userID);
	}

	@Override
	public void insertUserStage(int user_id) {
		// TODO Auto-generated method stub
		dao.insertUserStage(user_id);
	}

	@Override
	public List<wordsModel> Allwords() {
		// TODO Auto-generated method stub
		return dao.Allwords();
	}

	@Override
	public void insertUserWord(int user_id, int gameNum, int stage_id, int word_id) {
		// TODO Auto-generated method stub
		dao.insertUserWord(user_id, gameNum, stage_id, word_id);
	}


}
