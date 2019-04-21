package com.skhu.NWFA.sejongGame.sejongController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class sejongController {
	
	@RequestMapping("KingWordGame")
	public String KingWordGame() {
		return "KingWordGame";
	}
	
}
