package com.skhu.NWFA.yaminGame.yaminController;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skhu.NWFA.yaminGame.yaminModel.syllablesModel;
import com.skhu.NWFA.yaminGame.yaminModel.wordsModel;
import com.skhu.NWFA.yaminGame.yaminService.yaminService;

@Controller
public class yaminController {

   @Autowired
   yaminService serviece;

   @RequestMapping("YaminGameLobby")
   public String YaminGameLobby(Model model) {
      return "game/YaminGameLobby";
   }

   @RequestMapping("YaminGame/{yaminId}")
   public String YaminGame(Model model, @PathVariable String yaminId) {
      wordsModel words = serviece.yaminWords(yaminId);
      int wordlength = words.getYamin_word().length();
      int count = 6 - wordlength;
      List<syllablesModel> list = serviece.example(count);
      List<String> syllablesArray = new ArrayList<String>();
      List<String> wordArray = new ArrayList<String>(Arrays.asList(words.getYamin_word().split("")));
      for (syllablesModel syllable : list) {
         syllablesArray.add(syllable.getSyllables());
      }
      syllablesArray.addAll(wordArray);
      Collections.shuffle(syllablesArray);

      String example = words.getJustice().replaceFirst(words.getYamin_word(), "_");

      model.addAttribute("yamin",yaminId);
      model.addAttribute("wordlength",wordlength);
      model.addAttribute("li",syllablesArray);
      model.addAttribute("word", words);
      model.addAttribute("example", example);

      return "game/YaminGame";
   }

}