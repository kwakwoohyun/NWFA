package com.skhu.NWFA.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class testController {

	@RequestMapping("/")
	public String test(Model model) {
		return "index";
	}

	@RequestMapping("GameLobby")
	public String gameLobby(Model model) {
		return "game/GameLobby";
	}
	
	@RequestMapping("dict")
	public String dict(Model model) {
		return "dict";
	}
}
