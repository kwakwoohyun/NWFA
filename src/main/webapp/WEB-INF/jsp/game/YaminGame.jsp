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
      // [정인국] 여기는 모달레이어를 제어하는 변수들임 프론트엔드용
      function GameOver() {
        // 게임오버 팝업을 뛰우는 함수
        $(".popup_GameEnd").show().css('display', 'flex');
        $("#layer_control").css({
          'filter': 'blur(15px)',
          '-webkit-filter': 'blur(15px)',
          '-moz-filter': 'blur(15px)',
          '-o-filter': 'blur(15px)',
          '-ms-filter': 'blur(15px)'
        });
        $(".popup_GameOver").css('top', '0vh');

      }

      function GameClear() {
        //  게임클리어 팝업을 뛰우는 함수
        $(".popup_GameEnd").show().css('display', 'flex');
        $("#layer_control").css({
          'filter': 'blur(15px)',
          '-webkit-filter': 'blur(15px)',
          '-moz-filter': 'blur(15px)',
          '-o-filter': 'blur(15px)',
          '-ms-filter': 'blur(15px)'
        });
        $(".popup_GameClear").css('top', '0vh');

      }
      // [정인국] 모달창을 숨겨주기위한 함수임
      function popup_Reset() {
        $(".popup_GameEnd").hide(); // [정인국] 모달창 초기 설정 ..1
        $(".popup_GameOver").css('top', '-100vh'); // [정인국] 모달창 초기 설정 ..2
        $(".popup_GameClear").css('top', '-100vh'); // [정인국] 모달창 초기 설정 ..3
      }


      $(document).ready(function() {
        popup_Reset() //[정인국] 모달창을 초기화 시켜주는 함수 모달창을 사용하고 페이지를 이동하지 않는이상 초기화를 시켜줘야합니다.
        // 테스트 구문
        // setTimeout(GameClear, 2000) //[게임클리어 팝업] GameClear() 로 사용가능
        // setTimeout(GameOver, 2000) //[게임오버 팝업] GameOver() 로 사용가능
      });
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
          도전 신조어!
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
              <img src="/icon/WQ1.gif">
            </div>
            <div class="blackboard_Quiz_Answer">
              <img src="/icon/WQ1.gif">
            </div>
            <div class="blackboard_img">
              <img src="/icon/chalk.png">
            </div>
          </div>

        </div>
      </div>

      <div class="ControlBox">
        <div class="info_panel flex">
          남은기회
          <div class="Star_point">
            ♥♥♡
          </div>
          나의최고점수
          <div class="Heart_point">
            ★☆☆
          </div>
        </div>

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
    <div class="popup_GameEnd">
      <div class="popup_GameClear">
        <div class="popup_GameClear_Text">
          GAME CLEAR
        </div>
        <div class="popup_GameClear_NextGame" id="NextGame">
          다음 스테이지
        </div>
        <div class="popup_GameClear_Lobby" id="MoveLobby">
          로비로 나가기
        </div>
      </div>
      <div class="popup_GameOver">
        <div class="popup_GameOver_Text">
          GAME OVER
        </div>
        <div class="popup_GameOver_Regame" id="ReGame">
          게임 다시하기
        </div>
        <div class="popup_GameOver_Lobby" id="MoveLobby">
          로비로 나가기
        </div>
      </div>
    </div>
  </div>
</body>

</html>
