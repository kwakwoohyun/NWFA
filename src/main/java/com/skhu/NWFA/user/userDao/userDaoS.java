package com.skhu.NWFA.user.userDao;

import org.springframework.context.annotation.Configuration;

import com.skhu.NWFA.user.userModel.userModel;

@Configuration
public interface userDaoS {
	
	userModel selectID(String userID);

	void insertUserStage(int user_id);
	
}
