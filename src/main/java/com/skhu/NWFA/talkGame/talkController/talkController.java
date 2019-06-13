package com.skhu.NWFA.talkGame.talkController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class talkController {
	
	@RequestMapping("TalkGameLobby")
	public String TalkGameLobby(Model model) {
		return "game/TalkGameLobby";
	}
	
	
}
