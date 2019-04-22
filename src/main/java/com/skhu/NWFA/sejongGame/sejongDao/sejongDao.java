package com.skhu.NWFA.sejongGame.sejongDao;

import java.util.List;

import org.springframework.context.annotation.Configuration;

import com.skhu.NWFA.sejongGame.sejongModel.sejongModel;

@Configuration
public interface sejongDao {
	List<sejongModel> example();

}
