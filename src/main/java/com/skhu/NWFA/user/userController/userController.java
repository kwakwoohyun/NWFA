package com.skhu.NWFA.user.userController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class userController {

	@RequestMapping("tmepmenu")
	public String tmepmenu() {
		return "tmepmenu";
	}
	
	@RequestMapping("login")
	public String login() {
		return "/login/login";
	}
	
	@RequestMapping("accounts")
	public String accounts() {
		return "/login/accounts";
	}
}
