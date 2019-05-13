package com.skhu.NWFA.yaminGame.yaminController;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skhu.NWFA.yaminGame.yaminService.yaminService;



@Controller
public class yaminController {

	@Autowired
	yaminService serviece;

	@RequestMapping("YaminGame")
	public String YaminGame(Model model) {
//		wordsModel words = serviece.yaminWords(yaminId);
//		int wordlength = words.getJustice().length();
//		int count = 6-wordlength;
//		List<syllablesModel> list = serviece.example(count);
		List<String> syllablesArray = new ArrayList<String>();
//		List<String> wordArray = new ArrayList<String>(Arrays.asList(words.getJustice().split("")));
//		for(syllablesModel syllable: list) {
//			syllablesArray.add(syllable.getSyllables());
//		}
//		syllablesArray.addAll(wordArray);
		Collections.shuffle(syllablesArray);

//		model.addAttribute("yamin",yaminId);
//		model.addAttribute("wordlength",wordlength);
		model.addAttribute("li",syllablesArray);
//		model.addAttribute("word",words);

		return "game/YaminGame";
	}

}
