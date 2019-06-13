package com.skhu.NWFA.sejongGame.sejongDao;

import org.springframework.context.annotation.Configuration;

@Configuration
public interface Dao {

	int isLock(int user_id, int gameNum1);


}
