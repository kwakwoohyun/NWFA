package com.skhu.NWFA.yaminGame.yaminDao;

import java.util.List;

import org.springframework.context.annotation.Configuration;

import com.skhu.NWFA.yaminGame.yaminModel.syllablesModel;
import com.skhu.NWFA.yaminGame.yaminModel.wordsModel;

@Configuration
public interface yaminDao {
	List<syllablesModel> example(int count);
	wordsModel yaminWords(String yaminId);
}
