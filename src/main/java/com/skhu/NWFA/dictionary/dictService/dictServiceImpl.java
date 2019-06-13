package com.skhu.NWFA.dictionary.dictService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.NWFA.dictionary.dictDao.dictDao;
import com.skhu.NWFA.dictionary.dictModel.wordModel;
import com.skhu.NWFA.dictionary.dictModel.wrongNote;
import com.skhu.NWFA.user.userModel.userModel;
import com.skhu.NWFA.user.userModel.userStages;

@Service
public class dictServiceImpl implements dictService {

	@Autowired(required = false)
	dictDao dao;

	@Override
	public List<wordModel> dictWordAll(int user_id) {
		return dao.dictWordAll(user_id);
	}

	@Override
	public userModel loginUser(String login_id) {
		return dao.loginUser(login_id);
	}

	@Override
	public void setFavorite(int user_id,int word_id) {
		dao.setFavorite(user_id,word_id);

	}

	@Override
	public void removeFavorite(int user_id, int word_id) {
		dao.removeFavorite(user_id, word_id);
	}

	@Override
	public List<wordModel> searchWord(int user_id, String value) {
		return dao.searchWord(user_id, value);
	}

	@Override
	public List<wrongNote> wrongNote(int user_id, int stage_id, int gameNum) {

		return dao.wrongNote(user_id, stage_id, gameNum);
	}

	@Override
	public List<userStages> stageIsLock(int user_id, int gameNum) {
	
		return dao.stageIsLock(user_id, gameNum);
	}

}
