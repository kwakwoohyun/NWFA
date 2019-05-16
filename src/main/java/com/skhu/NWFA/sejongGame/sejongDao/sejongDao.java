package com.skhu.NWFA.sejongGame.sejongDao;

import java.util.List;

import org.springframework.context.annotation.Configuration;

import com.skhu.NWFA.sejongGame.sejongModel.stageModel;
import com.skhu.NWFA.sejongGame.sejongModel.syllablesModel;
import com.skhu.NWFA.sejongGame.sejongModel.wordsModel;

@Configuration
public interface sejongDao {
	List<syllablesModel> example(int count);
	wordsModel sejongWords(String sejongId);
	List<stageModel> sejongStage();
	void stageLockUpdate(int stageId);
}
