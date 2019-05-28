package com.skhu.NWFA.user.userService;

import com.skhu.NWFA.user.userModel.userModel;

public interface userService {
	userModel selectID(String userID);
	void insertUserStage(int user_id);
}
