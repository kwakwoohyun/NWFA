package com.skhu.NWFA.yaminGame.yaminService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.NWFA.yaminGame.yaminDao.yaminDao;
import com.skhu.NWFA.yaminGame.yaminModel.syllablesModel;
import com.skhu.NWFA.yaminGame.yaminModel.wordsModel;

@Service
public class yaminServiceImpl implements yaminService {
	
	@Autowired
	yaminDao dao;
	
	@Override
	public List<syllablesModel> example(int count) {
		// TODO Auto-generated method stub
		return dao.example(count);
	}

	@Override
	public wordsModel yaminWords(String yaminId) {
		// TODO Auto-generated method stub
		return dao.yaminWords(yaminId);
	}

}
