package com.skhu.NWFA.sejongGame.sejongService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.NWFA.sejongGame.sejongDao.sejongDao;
import com.skhu.NWFA.sejongGame.sejongModel.syllablesModel;
import com.skhu.NWFA.sejongGame.sejongModel.wordsModel;

@Service
public class sejongServiceImpl implements sejongService {

	@Autowired
	sejongDao dao;
	
	@Override
	public List<syllablesModel> example() {
		// TODO Auto-generated method stub
		return dao.example();
	}

	@Override
	public wordsModel sejongWords(int id) {
		// TODO Auto-generated method stub
		return dao.sejongWords(id);
	}

}
