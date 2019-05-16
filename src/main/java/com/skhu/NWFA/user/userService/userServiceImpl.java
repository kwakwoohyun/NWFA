package com.skhu.NWFA.user.userService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.NWFA.user.userDao.userDaoS;
import com.skhu.NWFA.user.userModel.userModel;

@Service
public class userServiceImpl implements userService {

	@Autowired(required = false)
	userDaoS dao;

	@Override
	public userModel selectID(String userID) {
		// TODO Auto-generated method stub
		return dao.selectID(userID);
	}

	@Override
	public void insertInfo(int user_id) {
		// TODO Auto-generated method stub
		dao.insertInfo(user_id);
	}

	@Override
	public void insertInfo2(int user_id, int i) {
		// TODO Auto-generated method stub
		dao.insertInfo2(user_id, i);
	}

	@Override
	public void insertInfo3(int user_id, int i) {
		// TODO Auto-generated method stub
		dao.insertInfo3(user_id, i);
	}

}
