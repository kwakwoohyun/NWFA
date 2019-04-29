package com.skhu.NWFA.sejongGame.sejongController;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skhu.NWFA.sejongGame.sejongModel.syllablesModel;
import com.skhu.NWFA.sejongGame.sejongModel.wordsModel;
import com.skhu.NWFA.sejongGame.sejongService.sejongService;

@Controller
public class sejongController {

	@Autowired
	sejongService service;

	@RequestMapping("KingWordGame")
	public String KingWordGame(Model model) {

		wordsModel words = service.sejongWords(1);
		int wordlength = words.getJustice().length(); //받아오는 단어 수가 몇 개인지
		int count = 9-wordlength; //받아오는 단어를 제외한 랜덤된 음절 수를 구하기 위함
		List<syllablesModel> list = service.example(count);
		List<String> syllablesArray = new ArrayList<String>(); //실제 단어 리스트
		List<String> wordArray = new ArrayList<String>(Arrays.asList(words.getJustice().split("")));//가짜 음절 리스트
		for(syllablesModel syllable: list) {
			syllablesArray.add(syllable.getSyllable());
		}//데이터베이스에서 받아오는 객체는 'syllables'모델 이기 때문에 'string'으로 형 변환
		syllablesArray.addAll(wordArray); //뷰에 출력하기 위한 9개의 단어를 실제 단어 리스트와 가짜 음절 리스트를 합쳐서 구함
		Collections.shuffle(syllablesArray); //리스트를 랜덤으로 섞어줌
		model.addAttribute("li",syllablesArray);
		Map<String, Integer> map = new HashMap<String, Integer>();
		int wordindex = 0;
		for(String word: wordArray) {
			int index = syllablesArray.indexOf(word);
			map.put(String.valueOf(wordindex++),index);
		}
		model.addAttribute("wordIndex", map);
		model.addAttribute("word", words);

		return "/game/KingWordGame";
	}

	@RequestMapping("KingWordGameNext/{wordId}")
	public String KingWordGameNext(Model model, @PathVariable int wordId) {
		wordsModel words = service.sejongWords(wordId);
		int wordlength = words.getJustice().length(); //받아오는 단어 수가 몇 개인지
		int count = 9-wordlength; //받아오는 단어를 제외한 랜덤된 음절 수를 구하기 위함
		List<syllablesModel> list = service.example(count);
		List<String> syllablesArray = new ArrayList<String>(); //실제 단어 리스트
		List<String> wordArray = new ArrayList<String>(Arrays.asList(words.getJustice().split("")));//가짜 음절 리스트
		for(syllablesModel syllable: list) {
			syllablesArray.add(syllable.getSyllable());
		}//데이터베이스에서 받아오는 객체는 'syllables'모델 이기 때문에 'string'으로 형 변환
		syllablesArray.addAll(wordArray); //뷰에 출력하기 위한 9개의 단어를 실제 단어 리스트와 가짜 음절 리스트를 합쳐서 구함
		Collections.shuffle(syllablesArray); //리스트를 랜덤으로 섞어줌
		model.addAttribute("li",syllablesArray);
		model.addAttribute("word", words);

		return "/game/KingWordGame";
	}
}
