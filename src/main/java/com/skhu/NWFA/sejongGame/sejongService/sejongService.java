package com.skhu.NWFA.sejongGame.sejongService;

import java.util.List;

import com.skhu.NWFA.sejongGame.sejongModel.syllablesModel;
import com.skhu.NWFA.sejongGame.sejongModel.wordsModel;


public interface sejongService {

	List<syllablesModel> example();
	wordsModel sejongWords(int id);
	
}
