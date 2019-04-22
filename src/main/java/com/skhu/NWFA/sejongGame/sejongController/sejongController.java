package com.skhu.NWFA.sejongGame.sejongController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skhu.NWFA.sejongGame.sejongModel.sejongModel;
import com.skhu.NWFA.sejongGame.sejongService.sejongService;

@Controller
public class sejongController {
	
	@Autowired
	sejongService service;
	
	@RequestMapping("KingWordGame")
	public String KingWordGame(Model model) {
		
		List<sejongModel> list = service.example();
		model.addAttribute("li",list);
		
		return "KingWordGame";
	}
	
}
