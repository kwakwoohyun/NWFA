package com.skhu.NWFA.sejongGame.sejongController;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skhu.NWFA.sejongGame.sejongModel.sejongWordsModel;
import com.skhu.NWFA.sejongGame.sejongModel.syllablesModel;
import com.skhu.NWFA.sejongGame.sejongModel.wordsModel;
import com.skhu.NWFA.sejongGame.sejongService.sejongService;
import com.skhu.NWFA.user.userModel.userModel;
import com.skhu.NWFA.user.userModel.userStages;

@Controller
public class sejongController {

	@Autowired
	sejongService service;

	@RequestMapping("KingWordGameLobby/{stageId}")
	public String KingWordGameLobby(Model model, HttpSession session, @PathVariable String stageId) {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = service.loginUser(userID);
		}

		String id = (String) session.getAttribute("userID");
		userModel user_id = service.loginUser(id);
		int u_id = user_id.getUser_id();
		List<userStages> stageList = service.selectUserStage(u_id);
		model.addAttribute("stageList", stageList);
		int stage = Integer.parseInt(stageId);
		List<wordsModel> words = service.LobbyWords(stage);

		model.addAttribute("words", words);
		return "game/KingWordGameLobby";
	}

	@RequestMapping("setScore/{stageId}/{score}")
	public String setScore(Model model, HttpSession session, @PathVariable String stageId, @PathVariable int score) {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = service.loginUser(userID);
		}

		service.setScore(user.getUser_id(), Integer.parseInt(stageId), 1, score);
		int nextStage = Integer.parseInt(stageId) + 1;

		return "redirect:/KingWordGameLobby/" + nextStage;
	}

	@RequestMapping("reGame/{stageId}/{score}")
	public String reGame(Model model, HttpSession session, @PathVariable String stageId, @PathVariable int score) {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = service.loginUser(userID);
		}

		service.setScore(user.getUser_id(), Integer.parseInt(stageId), 1, score);
		int nextStage = Integer.parseInt(stageId);

		return "redirect:/KingWordGameLobby/" + nextStage;
	}

	@RequestMapping("KingWordGame/{stage_id}/{word_id}/{gameNum}")
	public String KingWordGameNext(Model model, @PathVariable String stage_id, @PathVariable String word_id,
			@PathVariable String gameNum, HttpSession session) {
		if (word_id.equals("10")) {

			return "redirect:/SejongGameModal/" + stage_id + "/" + gameNum;

		} else {
			List<wordsModel> words = service.LobbyWords(Integer.parseInt(stage_id));
			int wordlength = words.get(Integer.parseInt(word_id)).getJustice().length();
			int count = 9 - wordlength;
			List<syllablesModel> list = service.example(count);
			List<String> syllablesArray = new ArrayList<String>();
			List<String> wordArray = new ArrayList<String>(
					Arrays.asList(words.get(Integer.parseInt(word_id)).getJustice().split("")));
			for (syllablesModel syllable : list) {
				syllablesArray.add(syllable.getSyllable());
			} // 데이터베이스에서 받아오는 객체는 'syllables'모델 이기 때문에 'string'으로 형 변환
			syllablesArray.addAll(wordArray); // 뷰에 출력하기 위한 9개의 단어를 실제 단어 리스트와 가짜 음절 리스트를 합쳐서 구함
			Collections.shuffle(syllablesArray); // 리스트를 랜덤으로 섞어줌
			Random random = new Random();
			int hintIndex = random.nextInt(wordlength);
			wordsModel word = words.get(Integer.parseInt(word_id));
			model.addAttribute("wordlength", wordlength);
			model.addAttribute("li", syllablesArray);
			model.addAttribute("word", word);
			model.addAttribute("hintWord", wordArray.get(hintIndex));
			model.addAttribute("hintIndex", hintIndex);
			model.addAttribute("wordIdx", word_id);

			return "game/KingWordGame";
		}
	}

	@RequestMapping("SejongGameUpdate/{stage_id}/{word_id}/{gameNum}/{answer}")
	public String SejongGameUpdate(Model model, @PathVariable String stage_id, @PathVariable String word_id,
			@PathVariable String gameNum, @PathVariable String answer, HttpSession session)
			throws UnsupportedEncodingException {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = service.loginUser(userID);
		}

		List<wordsModel> words = service.LobbyWords(Integer.parseInt(stage_id));
		wordsModel word = words.get(Integer.parseInt(word_id));
		service.sejongWordsCorrect(gameNum, stage_id, user.getUser_id(), word.getWord_id(), answer);

		int nextGame = Integer.parseInt(word_id) + 1;

		return "redirect:/KingWordGame/" + stage_id + "/" + nextGame + "/" + gameNum;

	}

	@RequestMapping("SejongGameSave/{stage_id}/{word_id}/{gameNum}/{answer}")
	public String SejongGameSave(Model model, @PathVariable String stage_id, @PathVariable String word_id,
			@PathVariable String gameNum, @PathVariable String answer, HttpSession session)
			throws UnsupportedEncodingException {

		String userID = null;
		userModel user = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = service.loginUser(userID);
		}

		List<wordsModel> words = service.LobbyWords(Integer.parseInt(stage_id));
		wordsModel word = words.get(Integer.parseInt(word_id));
		service.sejongWordsSave(gameNum, stage_id, user.getUser_id(), word.getWord_id(), answer);

		int nextGame = Integer.parseInt(word_id) + 1;

		return "redirect:/KingWordGame/" + stage_id + "/" + nextGame + "/" + gameNum;

	}

	@RequestMapping("SejongGameModal/{stage_id}/{gameNum}")
	public String SejongGameModal(Model model, @PathVariable String stage_id, @PathVariable String gameNum,
			HttpSession session) throws UnsupportedEncodingException {

		String userID = null;
		userModel user = null;
		int isCorrect = 0;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = service.loginUser(userID);
		}

		List<sejongWordsModel> words = service.sejongWrongNote(user.getUser_id(), stage_id);

		model.addAttribute("words", words);

		for (int i = 0; i < words.size(); i++) {
			isCorrect += words.get(i).getIsCorrect();
		}
		if (isCorrect * 10 >= 60) {
			int nextStage = Integer.parseInt(stage_id) + 1;
			service.stageLockUpdate(nextStage, user.getUser_id());
		}
		model.addAttribute("score", isCorrect * 10);

		return "game/KingWordModal";
	}
}