package com.skhu.NWFA.sejongGame.sejongDao;

import java.util.List;

import org.springframework.context.annotation.Configuration;

import com.skhu.NWFA.sejongGame.sejongModel.stageModel;
import com.skhu.NWFA.sejongGame.sejongModel.syllablesModel;
import com.skhu.NWFA.sejongGame.sejongModel.wordsModel;
import com.skhu.NWFA.user.userModel.userModel;

@Configuration
public interface sejongDao {
   List<syllablesModel> example(int count);
   wordsModel sejongWords(String sejongId);
   List<stageModel> sejongStage(int user_id);
   List<stageModel> sejongStageAll();
   void stageLockUpdate(int stageId);
   userModel loginUser(String login_id);
   void starUpdate(int star, int stageId, int User_user_id);
   void setStar(int user_id, int star);
}