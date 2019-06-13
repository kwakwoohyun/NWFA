package com.skhu.NWFA.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.NWFA.sejongGame.sejongDao.Dao;

@Service
public class ServiceImpl implements com.skhu.NWFA.Controller.Service {

	@Autowired(required = false)
	Dao dao;
	
	@Override
	public int isLock(int user_id, int gameNum1) {
		return dao.isLock(user_id, gameNum1);
	}

}
