package com.skhu.NWFA.dictionary.dictController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class dictController {

	@RequestMapping("dictionary")
	public String dict() {
		return "dictionary";
	}

}
