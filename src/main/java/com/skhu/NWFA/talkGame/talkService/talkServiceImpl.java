package com.skhu.NWFA.talkGame.talkService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.NWFA.talkGame.talkDao.talkDao;
import com.skhu.NWFA.talkGame.talkModel.talkModel;

@Service
public class talkServiceImpl implements talkService {

	@Autowired
	talkDao dao;

	@Override
	public talkModel words(int gameNum, int stage_id) {
		// TODO Auto-generated method stub
		return dao.words(gameNum, stage_id);
	}

	@Override
	public void updateTalk(int gameNum, int stage_id, int user_id, int isCorrect) {
		dao.updateTalk(gameNum, stage_id, user_id, isCorrect);
	}

}
