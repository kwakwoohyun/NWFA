package com.skhu.NWFA.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skhu.NWFA.sejongGame.sejongService.sejongService;
import com.skhu.NWFA.user.userModel.userModel;

@Controller
public class testController {

	@Autowired
	sejongService service;
	@Autowired
	Service service2;

	@RequestMapping("/")
	public String test(Model model) {
		return "index";
	}

	@RequestMapping("GameLobby")
	public String gameLobby(Model model, HttpSession session) {
		String userID = (String) session.getAttribute("userID");
		userModel user = service.loginUser(userID);
		int user_id = user.getUser_id();

		int islock1 = service2.isLock(user_id, 1);
		model.addAttribute("islock1", islock1);
		
		int islock2 = service2.isLock(user_id, 2);
		model.addAttribute("islock2", islock2);
		
		int islock3 = service2.isLock(user_id, 3);
		model.addAttribute("islock3", islock3);
		return "game/GameLobby";
	}

	@RequestMapping("dict")
	public String dict(Model model) {
		return "dict";
	}

	@RequestMapping("personal")
	public String personal(Model model) {
		return "redirect:/wrongNote/1/1";
	}

}
