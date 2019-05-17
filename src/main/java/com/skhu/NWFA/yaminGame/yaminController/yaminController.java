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
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skhu.NWFA.user.userModel.userModel;
import com.skhu.NWFA.yaminGame.yaminModel.stageModel;
import com.skhu.NWFA.yaminGame.yaminModel.syllablesModel;
import com.skhu.NWFA.yaminGame.yaminModel.wordsModel;
import com.skhu.NWFA.yaminGame.yaminService.yaminService;

@Controller
public class yaminController {

	@Autowired
	yaminService serviece;

	@RequestMapping("YaminGameLobby")
	public String YaminGameLobby(Model model, HttpSession session) {

		String userID = null;
		userModel user = null;
		List<stageModel> stages = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			user = serviece.loginUser(userID);
			stages = serviece.yaminStage(user.getUser_id());
		}

		if (stages == null) {
		} else {
			model.addAttribute("stages", stages);
		}
		return "game/YaminGameLobby";
	}

	@RequestMapping("YaminGame/{yaminId}")
	public String YaminGame(Model model, @PathVariable String yaminId, HttpSession session) throws UnsupportedEncodingException {
		wordsModel words = serviece.yaminWords(yaminId);
		int wordlength = words.getYamin_word().length();
		int count = 6 - wordlength;
		List<syllablesModel> list = serviece.example(count);
		List<String> syllablesArray = new ArrayList<String>();
		List<String> wordArray = new ArrayList<String>(Arrays.asList(words.getYamin_word().split("")));
		List<String> example = new ArrayList<String>(Arrays.asList(words.getYamin_example().split("")));
		for (syllablesModel syllable : list) {
			syllablesArray.add(syllable.getSyllables());
		}
		syllablesArray.addAll(wordArray);
		Collections.shuffle(syllablesArray);

		int hintIndex = StringUtils.countOccurrencesOf(words.getYamin_example(), "_");

		/*byte[] encoded = Base64.encodeBase64(words.getImg());
		String encodedString = new String(encoded);

		model.addAttribute("img", encodedString);*/

		model.addAttribute("yamin", yaminId);
		model.addAttribute("wordlength", wordlength);
		model.addAttribute("li", syllablesArray);
		model.addAttribute("word", words);
		model.addAttribute("example", example);
		model.addAttribute("hintIndex", hintIndex);

		List<stageModel> stages = serviece.yaminStageAll();

			String userID = null;
			userModel user = null;
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
				user = serviece.loginUser(userID);
			}
			if (stages.get(Integer.parseInt(yaminId) - 2).getOpen_game() == 1) {
				serviece.stageLockUpdate(Integer.parseInt(yaminId),user.getUser_id());
			}

	return"game/YaminGame";
}

}