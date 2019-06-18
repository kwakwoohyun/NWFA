package com.skhu.NWFA.talkGame.talkService;

import com.skhu.NWFA.talkGame.talkModel.talkModel;

public interface talkService {

	public talkModel words(int gameNum, int stage_id);

	void updateTalk(int gameNum, int stage_id, int user_id, int isCorrect);
}
