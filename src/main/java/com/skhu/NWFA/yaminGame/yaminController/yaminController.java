package com.skhu.NWFA.yaminGame.yaminController;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skhu.NWFA.user.userModel.userModel;
import com.skhu.NWFA.yaminGame.yaminModel.syllablesModel;
import com.skhu.NWFA.yaminGame.yaminModel.wordsModel;
import com.skhu.NWFA.yaminGame.yaminService.yaminService;

@Controller
public class yaminController {

	@Autowired
	yaminService serviece;

	@RequestMapping("YaminGameLobby/{yaminStageId}/{gameNum}")
	public String YaminGameLobby(Model model, @PathVariable String yaminStageId, @PathVariable String gameNum,
			HttpSession session) {
		List<wordsModel> words = serviece.yaminWords(yaminStageId, gameNum);
		model.addAttribute("word", words);
		model.addAttribute("yaminStageId", yaminStageId);
		model.addAttribute("gameNum", gameNum);

		return "game/YaminGameLobby";
	}

	@RequestMapping("YaminGame/{yaminStageId}/{gameNum}/{wordIdx}")
	public String YaminGame(Model model, @PathVariable String yaminStageId, @PathVariable String gameNum,
			@PathVariable String wordIdx, HttpSession session) throws UnsupportedEncodingException {

		List<wordsModel> words = serviece.yaminWords(yaminStageId, gameNum);
		wordsModel word = words.get(Integer.parseInt(wordIdx));
		int wordlength = word.getJustice().length();
		int count = 6 - wordlength;
		List<syllablesModel> list = serviece.example(count);
		List<String> syllablesArray = new ArrayList<String>();
		List<String> wordArray = new ArrayList<String>(Arrays.asList(word.getJustice().split("")));
		for (syllablesModel syllable : list) {
			syllablesArray.add(syllable.getSyllable());
		}
		syllablesArray.addAll(wordArray);
		Collections.shuffle(syllablesArray);

		model.addAttribute("wordIdx", wordIdx);
		model.addAttribute("wordlength", wordlength);
		model.addAttribute("li", syllablesArray);
		model.addAttribute("word", word);

		return "game/YaminGame";
	}

	@RequestMapping("YaminGameUpdate/{yaminStageId}/{gameNum}/{wordIdx}/{answer}")
	public String YaminGameUpdate(Model model, @PathVariable String yaminStageId, @PathVariable String gameNum,
			@PathVariable String wordIdx, @PathVariable String answer, HttpSession session)
			throws UnsupportedEncodingException {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = serviece.loginUser(userID);
		}

		List<wordsModel> words = serviece.yaminWords(yaminStageId, gameNum);
		wordsModel word = words.get(Integer.parseInt(wordIdx));
		serviece.yaminWordsCorrect(gameNum, yaminStageId, user.getUser_id(), word.getWord_id(), answer);
		serviece.yaminWordsSave(gameNum, yaminStageId, user.getUser_id(), word.getWord_id(), answer);
		int nextGame = Integer.parseInt(wordIdx) + 1;

		return "redirect:/YaminGame/" + yaminStageId + "/" + gameNum + "/" + nextGame;

	}

	@RequestMapping("YaminGameSave/{yaminStageId}/{gameNum}/{wordIdx}/{answer}")
	public String YaminGameSave(Model model, @PathVariable String yaminStageId, @PathVariable String gameNum,
			@PathVariable String wordIdx, @PathVariable String answer, HttpSession session)
			throws UnsupportedEncodingException {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = serviece.loginUser(userID);
		}

		List<wordsModel> words = serviece.yaminWords(yaminStageId, gameNum);
		wordsModel word = words.get(Integer.parseInt(wordIdx));
		serviece.yaminWordsSave(gameNum, yaminStageId, user.getUser_id(), word.getWord_id(),answer);
		int nextGame = Integer.parseInt(wordIdx) + 1;

		return "redirect:/YaminGame/" + yaminStageId + "/" + gameNum + "/" + nextGame;

	}
}