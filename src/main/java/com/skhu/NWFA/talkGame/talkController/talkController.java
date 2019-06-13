package com.skhu.NWFA.talkGame.talkController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skhu.NWFA.talkGame.talkModel.talkModel;
import com.skhu.NWFA.talkGame.talkService.talkService;

@Controller
public class talkController {
	
	@Autowired
	talkService service;
	
	@RequestMapping("TalkGameLobby")
	public String TalkGameLobby(Model model) {
		return "game/TalkGameLobby";
	}
	
	@RequestMapping("TalkGame/{gameNum}/{stage_id}")
	public String TalkGame(Model model,@PathVariable int gameNum,@PathVariable int stage_id) {
		talkModel words = service.words(gameNum, stage_id);		
		model.addAttribute("words", words);
		return "game/TalkGame";
	}
	
}
