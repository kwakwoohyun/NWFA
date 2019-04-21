package com.skhu.NWFA.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skhu.NWFA.model.testModel;
import com.skhu.NWFA.service.testService;

@Controller
public class testController {


	@Autowired
	testService service;

	@RequestMapping("/")
	public String test(Model model) {

		List<testModel> list = service.printModel();
		model.addAttribute("li", list);
		return "index";
	}

}
