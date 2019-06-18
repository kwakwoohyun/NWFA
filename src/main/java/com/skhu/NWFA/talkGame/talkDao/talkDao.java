package com.skhu.NWFA.talkGame.talkDao;

import org.springframework.context.annotation.Configuration;

import com.skhu.NWFA.talkGame.talkModel.talkModel;

@Configuration
public interface talkDao {

	public talkModel words(int gameNum, int stage_id);

	void updateTalk(int gameNum, int stage_id, int user_id,int isCorrect);
}
