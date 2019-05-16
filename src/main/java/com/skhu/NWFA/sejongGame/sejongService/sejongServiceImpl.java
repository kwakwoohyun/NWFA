package com.skhu.NWFA.sejongGame.sejongService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.NWFA.sejongGame.sejongDao.sejongDao;
import com.skhu.NWFA.sejongGame.sejongModel.stageModel;
import com.skhu.NWFA.sejongGame.sejongModel.syllablesModel;
import com.skhu.NWFA.sejongGame.sejongModel.wordsModel;
import com.skhu.NWFA.user.userModel.userModel;

@Service
public class sejongServiceImpl implements sejongService {

   @Autowired(required=false)
   sejongDao dao;

   @Override
   public List<syllablesModel> example(int count) {
      return dao.example(count);
   }

   @Override
   public wordsModel sejongWords(String sejongId) {
      return dao.sejongWords(sejongId);
   }

   @Override
   public List<stageModel> sejongStage(int user_id) {
      return dao.sejongStage(user_id);
   }

   @Override
   public void stageLockUpdate(int stageId) {
      dao.stageLockUpdate(stageId);
   }

   @Override
   public userModel loginUser(String login_id) {
      return dao.loginUser(login_id);
   }

   @Override
   public List<stageModel> sejongStageAll() {
      return dao.sejongStageAll();
   }

}