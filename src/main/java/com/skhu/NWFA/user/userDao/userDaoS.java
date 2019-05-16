package com.skhu.NWFA.user.userDao;

import org.springframework.context.annotation.Configuration;

import com.skhu.NWFA.user.userModel.userModel;

@Configuration
public interface userDaoS {
	userModel selectID(String userID);

	void insertInfo(int user_id);

	void insertInfo2(int user_id, int i);

	void insertInfo3(int user_id, int i);
}
