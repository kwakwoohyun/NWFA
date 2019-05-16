package com.skhu.NWFA.user.userService;

import com.skhu.NWFA.user.userModel.userModel;

public interface userService {
	userModel selectID(String userID);
	void insertInfo(int user_id); 
	void insertInfo2(int user_id, int i);
	void insertInfo3(int user_id, int i);
}
