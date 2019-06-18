package com.skhu.NWFA.talkGame.talkController;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skhu.NWFA.sejongGame.sejongService.sejongService;
import com.skhu.NWFA.talkGame.talkModel.talkModel;
import com.skhu.NWFA.talkGame.talkService.talkService;
import com.skhu.NWFA.user.userModel.userModel;

@Controller
public class talkController {

	@Autowired
	talkService service;

	@Autowired
	sejongService sejongservice;

	@RequestMapping("TalkGameLobby")
	public String TalkGameLobby(Model model) {
		return "game/TalkGameLobby";
	}

	@RequestMapping("TalkGame/{gameNum}/{stage_id}")
	public String TalkGame(Model model, @PathVariable int gameNum, @PathVariable int stage_id) {
		talkModel words = service.words(gameNum, stage_id);
		model.addAttribute("words", words);
		return "game/TalkGame";
	}

	@RequestMapping("updateTalk/{gameNum}/{stage_id}/{isCorrect}")
	public String updateTalk(Model model, @PathVariable int gameNum, @PathVariable int stage_id,
			@PathVariable int isCorrect, HttpSession session) {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = sejongservice.loginUser(userID);
		}
		service.updateTalk(gameNum, stage_id, user.getUser_id(), isCorrect);
		int next = stage_id + 1;

		return "redirect:/TalkGame/" + gameNum + "/" + next;
	}

	@RequestMapping("updateTalkre/{gameNum}/{stage_id}/{isCorrect}")
	public String updateTalkre(Model model, @PathVariable int gameNum, @PathVariable int stage_id,
			@PathVariable int isCorrect, HttpSession session) {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = sejongservice.loginUser(userID);
		}
		service.updateTalk(gameNum, stage_id, user.getUser_id(), isCorrect);
		int next = stage_id;

		return "redirect:/TalkGame/" + gameNum + "/" + next;
	}

	@RequestMapping("updateLobby/{gameNum}/{stage_id}/{isCorrect}")
	public String updateLobby(Model model, @PathVariable int gameNum, @PathVariable int stage_id,
			@PathVariable int isCorrect, HttpSession session) {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = sejongservice.loginUser(userID);
		}
		service.updateTalk(gameNum, stage_id, user.getUser_id(), isCorrect);

		return "redirect:/TalkGameLobby";
	}

}
