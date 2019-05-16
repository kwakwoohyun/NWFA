package com.skhu.NWFA.sejongGame.sejongService;

import java.util.List;

import com.skhu.NWFA.sejongGame.sejongModel.stageModel;
import com.skhu.NWFA.sejongGame.sejongModel.syllablesModel;
import com.skhu.NWFA.sejongGame.sejongModel.wordsModel;


public interface sejongService {

	List<syllablesModel> example(int count);
	wordsModel sejongWords(String sejongId);
	List<stageModel> sejongStage();
	void stageLockUpdate(int stageId);

}
