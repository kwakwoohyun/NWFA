<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>💬</title>
    <meta name="viewport" content="width=device-width; initial-scale=1.0" />
    <link rel="stylesheet" href="project.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script type="text/javascript">
      // [정인국] 여기는 모달레이어를 제어하는 변수들임 프론트엔드용
      function GameOver() {
        // 게임오버 팝업을 뛰우는 함수
        $(".popup_GameEnd").show().css('display', 'flex');
        $(".popup_GameOver").delay("500").fadeIn();
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
        $(".popup_GameClear").delay("500").fadeIn();
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
        $(".popup_GameClear").css('top', '-100vh');
        $(".popup_GameOver").css('top', '-100vh');
        $(".popup_GameClear").fadeOut();
        $(".popup_GameOver").fadeOut();
      }

      $(document).ready(function() {
        popup_Reset() //[정인국] 모달창을 초기화 시켜주는 함수 모달창을 사용하고 페이지를 이동하지 않는이상 초기화를 시켜줘야합니다.
        // 테스트 구문
        // setTimeout(GameClear, 2000) //[게임클리어 팝업] GameClear() 로 사용가능
        setTimeout(GameOver, 2000) //[게임오버 팝업] GameOver() 로 사용가능
      });
    </script>
  </head>
  <body id="page_TalkGame">
    <div id="layer_background">
      <div id="TalkGame_background">
        <!-- 배경색 #ff5050-->
      </div>
    </div>
    <div id="layer_control">
      <header class="page_main">
        <div class="L_headerbar">
        </div>
        <div class="C_headerbar">
          스테이지 4
        </div>
        <div class="R_headerbar">
          <!-- <div class="point_info">
            남은기회
          </div>
          <div class="Heart_point">
            ♥♥♥
          </div> -->
        </div>
      </header>
      <div class="Talk_Content">
        <div class="Talk_main">
          <!-- 대화가 이루워지는 구역 -->
          <div class="Other_Person">
            <div class="Other_Person_img">
              <img src="icon/talk_stage1.png">
            </div>
            <div class="Other_Person_Content">
              <div class="Other_Person_name">
                중학생 딸
              </div>
              <div class="Other_Person_text">
                어제 버카충이 안되서 완전 갑분싸엿어
              </div>
            </div>
          </div>
          <!--  -->
          <div class="my_message">
            여기에 대화가 나옵니다.
          </div>
          <!-- 대화가 이루워지는 구역 -->
        </div>
        <div class="message_bottom">
          <div location.href='mainLobby.html' class="WQ_back TALK2_BTstyle">
            뒤로
          </div>
          <div class="Talk_GameOver_message">
            "사람이름" 님이 나갔습니다.
          </div>
          <div id="Hint" class="TALK2_BTstyle">
            힌트
          </div>
        </div>

    </div>
    <div class="message_box">
      <div class="L_message">

      </div>
      <div class="C_message">
        <div class="message_list">
          <div id="message_1"class="message_answer">
            그러지 말았어야지 앞으로는 그러지 마
          </div>
          <div id="message_2"class="message_answer">
            당황스러웠겟네 거실에 차비 넣어놨어
          </div>
          <div id="message_3"class="message_answer">
            정말 좋았겟네 축하해
          </div>
          <div id="message_4"class="message_answer">
            아쉽지만 다음에는 더 힘내서 해보자
          </div>
        </div>
      </div>
      <div class="R_message">
        <div class="message_bt">
          <div class="message_bt_text">
          전송
          </div>
        </div>
      </div>
    </div>
    </div>
    <div id="layer_modal">
      <div class="popup_GameEnd">

    <div class="popup_GameClear">
      <div class="popup_GameClear_Text">
        신조어 소통 성공
      </div>
      <div class="popup_GameClear_NextGame" id="NextGame">
        다른 채팅하기
      </div>
      <div class="popup_GameClear_Lobby" id="MoveLobby">
        로비로 나가기
      </div>
    </div>
    <div class="popup_GameOver">
      <div class="popup_GameOver_Text">
        신조어 소통 실패
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
