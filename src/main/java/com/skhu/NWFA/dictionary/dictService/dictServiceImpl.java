package com.skhu.NWFA.dictionary.dictService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.NWFA.dictionary.dictDao.dictDao;
import com.skhu.NWFA.dictionary.dictModel.wordModel;
import com.skhu.NWFA.user.userModel.userModel;

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

}
