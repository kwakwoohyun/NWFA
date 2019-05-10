package com.skhu.NWFA.yaminGame.yaminService;

import java.util.List;

import com.skhu.NWFA.yaminGame.yaminModel.syllablesModel;
import com.skhu.NWFA.yaminGame.yaminModel.wordsModel;

public interface yaminService {

	List<syllablesModel> example(int count);
	wordsModel yaminWords(String yaminId);
}
