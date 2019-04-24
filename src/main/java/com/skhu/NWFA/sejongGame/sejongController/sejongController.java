package com.skhu.NWFA.sejongGame.sejongController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		
		List<syllablesModel> list = service.example();
		wordsModel words = service.sejongWords(1);
		model.addAttribute("li",list);
		model.addAttribute("word", words);
		
		return "KingWordGame";
	}
	
}
