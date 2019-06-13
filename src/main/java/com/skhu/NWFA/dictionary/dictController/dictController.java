package com.skhu.NWFA.dictionary.dictController;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skhu.NWFA.dictionary.dictModel.wordModel;
import com.skhu.NWFA.dictionary.dictModel.wrongNote;
import com.skhu.NWFA.dictionary.dictService.dictService;
import com.skhu.NWFA.user.userModel.userModel;
import com.skhu.NWFA.user.userModel.userStages;

@Controller
public class dictController {

	@Autowired
	dictService service;

	@RequestMapping("dictionary/{dic_id}")
	public String dictionary(Model model, @PathVariable int dic_id, HttpSession session) {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = service.loginUser(userID);
		}

		List<wordModel> words = service.dictWordAll(user.getUser_id());
		model.addAttribute("word", words);
		model.addAttribute("dic_id", dic_id);
		model.addAttribute("searchSize", 0);

		return "dict";
	}

	@RequestMapping("favoriteWord/{word_id}/{dic_id}")
	public String favoriteWord(Model model, @PathVariable int word_id, @PathVariable int dic_id, HttpSession session) {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = service.loginUser(userID);
		}

		service.setFavorite(user.getUser_id(), word_id);

		return "redirect:/dictionary/" + dic_id;
	}

	@RequestMapping("unfavoriteWord/{word_id}/{dic_id}")
	public String unfavoriteWord(Model model, @PathVariable int word_id, @PathVariable int dic_id,
			HttpSession session) {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = service.loginUser(userID);
		}

		service.removeFavorite(user.getUser_id(), word_id);

		return "redirect:/dictionary/" + dic_id;
	}

	@RequestMapping("searchWord/{value}")
	public String searchWord(Model model, @PathVariable String value, HttpSession session) {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = service.loginUser(userID);
		}

		List<wordModel> search = service.searchWord(user.getUser_id(), value);
		model.addAttribute("search", search);
		List<wordModel> words = service.dictWordAll(user.getUser_id());
		model.addAttribute("word", words);
		model.addAttribute("searchSize", search.size());

		return "dict";
	}

	@RequestMapping("wrongNote/{stage_id}/{gameNum}")
	public String wrongNote(Model model, @PathVariable int stage_id, @PathVariable int gameNum, HttpSession session) {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = service.loginUser(userID);
		}

		List<wrongNote> wrongNote = service.wrongNote(user.getUser_id(), stage_id, gameNum);
		List<userStages> stages = service.stageIsLock(user.getUser_id(), gameNum);
		model.addAttribute("wrongNote", wrongNote);
		model.addAttribute("stage_id", stage_id);
		model.addAttribute("gameNum", gameNum);
		model.addAttribute("stage", stages);

		return "personal";
	}
}
