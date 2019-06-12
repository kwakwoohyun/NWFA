package com.skhu.NWFA.sejongGame.sejongController;

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
		String id = (String) session.getAttribute("userID");
		userModel user_id = service.loginUser(id);
		int u_id = user_id.getUser_id();
		List<userStages> stageList = service.selectUserStage(u_id);
		model.addAttribute("stageList", stageList);
		int stage = Integer.parseInt(stageId);
		List<wordsModel> words = service.LobbyWords(stage);
//		System.out.println(words.get(0).getJustice());
		model.addAttribute("words", words);
		return "game/KingWordGameLobby";
	}

	@RequestMapping("KingWordGame/{stage_id}/{word_id}/{gameNum}")
	public String KingWordGameNext(Model model, @PathVariable String stage_id, @PathVariable String word_id,
			@PathVariable String gameNum, HttpSession session) {
		List<wordsModel> words = service.sejongWords(stage_id, word_id, gameNum);
		System.out.println(words.get(0).getJustice());
		int wordlength = words.get(0).getJustice().length();
		int count = 9-wordlength;
		System.out.println(count);
		List<syllablesModel> list = service.example(count);
		List<String> syllablesArray = new ArrayList<String>();
		List<String> wordArray = new ArrayList<String>(Arrays.asList(words.get(0).getJustice().split("")));
		for (syllablesModel syllable : list) {
			syllablesArray.add(syllable.getSyllable());
		} // 데이터베이스에서 받아오는 객체는 'syllables'모델 이기 때문에 'string'으로 형 변환
		syllablesArray.addAll(wordArray); // 뷰에 출력하기 위한 9개의 단어를 실제 단어 리스트와 가짜 음절 리스트를 합쳐서 구함
		Collections.shuffle(syllablesArray); // 리스트를 랜덤으로 섞어줌
		Random random = new Random();
		int hintIndex = random.nextInt(wordlength);
		System.out.println(words.get(0).getGameNum());
		System.out.println(words.get(0).getStage_id());
		model.addAttribute("wordlength", wordlength);
		model.addAttribute("li", syllablesArray);
		model.addAttribute("words", words);
		model.addAttribute("hintWord", wordArray.get(hintIndex));
		model.addAttribute("hintIndex", hintIndex);

		return "game/KingWordGame";
	}
}