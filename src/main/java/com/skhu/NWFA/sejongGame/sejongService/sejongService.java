package com.skhu.NWFA.sejongGame.sejongService;

import java.util.List;

import com.skhu.NWFA.sejongGame.sejongModel.stageModel;
import com.skhu.NWFA.sejongGame.sejongModel.syllablesModel;
import com.skhu.NWFA.sejongGame.sejongModel.wordsModel;
import com.skhu.NWFA.user.userModel.userModel;


public interface sejongService {

   List<syllablesModel> example(int count);
   wordsModel sejongWords(String sejongId);
   List<stageModel> sejongStage(int user_id);
   List<stageModel> sejongStageAll();
   void stageLockUpdate(int stageId);
   userModel loginUser(String login_id);

}