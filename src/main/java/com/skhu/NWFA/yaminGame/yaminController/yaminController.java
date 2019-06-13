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
import com.skhu.NWFA.user.userModel.userStages;
import com.skhu.NWFA.yaminGame.yaminModel.syllablesModel;
import com.skhu.NWFA.yaminGame.yaminModel.wordsModel;
import com.skhu.NWFA.yaminGame.yaminModel.yaminWordsModel;
import com.skhu.NWFA.yaminGame.yaminService.yaminService;

@Controller
public class yaminController {

	@Autowired
	yaminService serviece;

	@RequestMapping("YaminGameLobby/{yaminStageId}/{gameNum}")
	public String YaminGameLobby(Model model, @PathVariable String yaminStageId, @PathVariable String gameNum,
			HttpSession session) {
		List<wordsModel> words = serviece.yaminWords(yaminStageId, gameNum);
		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = serviece.loginUser(userID);
		}
		int u_id = user.getUser_id();
		List<userStages> stageList = serviece.selectUserStage(u_id);
		model.addAttribute("stageList", stageList);
		model.addAttribute("word", words);
		model.addAttribute("yaminStageId", yaminStageId);
		model.addAttribute("gameNum", gameNum);

		return "game/YaminGameLobby";
	}

	@RequestMapping("setScoreYamin/{stageId}/{score}")
	public String setScoreYamin(Model model, HttpSession session, @PathVariable String stageId,
			@PathVariable int score) {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = serviece.loginUser(userID);
		}

		serviece.setScore(user.getUser_id(), Integer.parseInt(stageId), 2, score);
		int nextStage = Integer.parseInt(stageId) + 1;

		return "redirect:/YaminGameLobby/" + nextStage + "/2";
	}

	@RequestMapping("reGameYamin/{stageId}/{score}")
	public String reGameYamin(Model model, HttpSession session, @PathVariable String stageId, @PathVariable int score) {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = serviece.loginUser(userID);
		}

		serviece.setScore(user.getUser_id(), Integer.parseInt(stageId), 2, score);
		int nextStage = Integer.parseInt(stageId);

		return "redirect:/YaminGameLobby/" + nextStage + "/2";
	}

	@RequestMapping("YaminGame/{yaminStageId}/{gameNum}/{wordIdx}")
	public String YaminGame(Model model, @PathVariable String yaminStageId, @PathVariable String gameNum,
			@PathVariable String wordIdx, HttpSession session) throws UnsupportedEncodingException {
		if (wordIdx.equals("5")) {

			return "redirect:/YaminGameModal/" + yaminStageId + "/" + gameNum;

		} else {
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
			System.out.println(word.getStage_id());
			model.addAttribute("wordIdx", wordIdx);
			model.addAttribute("wordlength", wordlength);
			model.addAttribute("li", syllablesArray);
			model.addAttribute("word", word);

			return "game/YaminGame";
		}

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
		serviece.yaminWordsSave(gameNum, yaminStageId, user.getUser_id(), word.getWord_id(), answer);

		int nextGame = Integer.parseInt(wordIdx) + 1;

		return "redirect:/YaminGame/" + yaminStageId + "/" + gameNum + "/" + nextGame;

	}

	@RequestMapping("YaminGameModal/{yaminStageId}/{gameNum}")
	public String YaminGameModal(Model model, @PathVariable String yaminStageId, @PathVariable String gameNum,
			HttpSession session) throws UnsupportedEncodingException {

		String userID = null;
		userModel user = null;
		int isCorrect = 0;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = serviece.loginUser(userID);
		}

		List<yaminWordsModel> words = serviece.yaminWrongNote(user.getUser_id(), yaminStageId);

		model.addAttribute("words", words);

		for (int i = 0; i < words.size(); i++) {
			isCorrect += words.get(i).getIsCorrect();
		}

		if (isCorrect * 20 >= 60) {
			System.out.println("in");
			int nextStage = Integer.parseInt(yaminStageId) + 1;
			serviece.stageLockUpdate(nextStage, user.getUser_id());
		}
		model.addAttribute("score", isCorrect * 20);

		return "game/YaminGameModal";
	}

}