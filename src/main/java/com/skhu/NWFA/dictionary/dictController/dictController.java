package com.skhu.NWFA.dictionary.dictController;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skhu.NWFA.dictionary.dictModel.wordModel;
import com.skhu.NWFA.dictionary.dictService.dictService;
import com.skhu.NWFA.user.userModel.userModel;

@Controller
public class dictController {

	@Autowired
	dictService service;

	@RequestMapping("dictionary")
	public String dictionary(Model model, HttpSession session) {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = service.loginUser(userID);
		}

		List<wordModel> words = service.dictWordAll(user.getUser_id());
		model.addAttribute("word", words);

		return "dict";
	}

	@RequestMapping("favoriteWord/{word_id}")
	public String favoriteWord(Model model, @PathVariable int word_id, HttpSession session) {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = service.loginUser(userID);
		}

		service.setFavorite(user.getUser_id(), word_id);

		return "redirect:/dictionary";
	}

	@RequestMapping("unfavoriteWord/{word_id}")
	public String unfavoriteWord(Model model, @PathVariable int word_id, HttpSession session) {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = service.loginUser(userID);
		}

		service.removeFavorite(user.getUser_id(), word_id);

		return "redirect:/dictionary";
	}
}
