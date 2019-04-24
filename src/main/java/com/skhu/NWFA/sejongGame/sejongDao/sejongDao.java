package com.skhu.NWFA.sejongGame.sejongDao;

import java.util.List;

import org.springframework.context.annotation.Configuration;

import com.skhu.NWFA.sejongGame.sejongModel.syllablesModel;
import com.skhu.NWFA.sejongGame.sejongModel.wordsModel;

@Configuration
public interface sejongDao {
	List<syllablesModel> example(int count);
	wordsModel sejongWords(int id);
}
