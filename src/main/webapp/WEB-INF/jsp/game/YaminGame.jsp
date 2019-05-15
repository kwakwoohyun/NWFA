<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>메인페이지</title>
  <meta name="viewport" content="width=device-width; initial-scale=1.0" />
  <link rel="stylesheet" href="/project.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  <script type="text/javascript">

  </script>
</head>

<body id="page_ChallengeQuizgame" class="page_ChallengeQuiz">
  <div id="layer_background">
    <div class="background_ChallengeQuiz" >
      <div class="img_teacher">

      </div>
    </div>
  </div> 
  <div id="layer_control">
    <header class="page_main">
      <div class="L_headerbar">

      </div>
      <div class="C_headerbar">
        <div class="WordQuizTitle">
          단어퀴즈
        </div>
      </div>
      <div class="R_headerbar">
        <div class="UI login">
        </div>
      </div>
    </header>
    <div class="viewBox">

      <div class="DisplayBox">
        <div class="quiz">

          <div class="Stage_panel">
            Stage 1-1
          </div>
          <div class="blackboard">
            <div class="blackboard_Quiz">
              ${word.mean}
            </div>
            <div class="blackboard_Quiz_Question">
              _ 머 리
            </div>
            <div class="blackboard_Quiz_Answer">
              <img src="icon/WQ1.gif">
            </div>
            <div class="blackboard_img">
              <img src="icon/chalk.png">
            </div>
          </div>

        </div>
        <!--
      <div class="info_panel flex">
          남은기회
          <div class="Star_point">
            ♥♥♡
          </div>
          나의최고점수
          <div class="Heart_point">
            ★☆☆
          </div>

      </div> -->
      </div>

      <div class="ControlBox">
        <div class="buttonbox">
          <button id="WQ_BT1" class="WQ_BT" value="머" onclick="KingWordGame1_click(this.value)">
            머
          </button>
          <button id="WQ_BT2" class="WQ_BT" value="머" onclick="KingWordGame1_click(this.value)">
            빛
          </button>
          <button id="WQ_BT3" class="WQ_BT" value="머" onclick="KingWordGame1_click(this.value)">
            초
          </button>
          <button id="WQ_BT4" class="WQ_BT" value="머" onclick="KingWordGame1_click(this.value)">
            디
          </button>
          <button id="WQ_BT5" class="WQ_BT" value="머" onclick="KingWordGame1_click(this.value)">
            묘
          </button>
          <button id="WQ_BT6" class="WQ_BT" value="머" onclick="KingWordGame1_click(this.value)">
            야
          </button>
          <!-- <button id="WQ_BT7" class="WQ_BT" value="머" onclick="KingWordGame1_click(this.value)">
          머
        </button>
        <button id="WQ_BT8" class="WQ_BT" value="머" onclick="KingWordGame1_click(this.value)">
          머
        </button> -->
        </div>
      </div>
      <footer class="page_main KingWordGamefooter">
        <div class="KW_back CQ_BTstyle">
          <a href="index.html">뒤로</a>
        </div>
        <div class="KW_regame CQ_BTstyle">
          다시하기
        </div>
        <div class="visibilityhidden CQ_BTstyle">

        </div>
      </footer>
    </div>
  </div>
    <div id="layer_modal">

    </div>
</body>

</html>
