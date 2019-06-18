<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta charset="utf-8">
<title>💬</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0" />
<link rel="stylesheet" href="/project.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
history.pushState(null, null, location.href);
window.onpopstate = function(event) {
	history.go(1);
};
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
	
      function answer(answer) {
			document.querySelector('#message').style.display = 'block';
			document.querySelector('#message').innerHTML = answer;
	}
      $(document).ready(function(){
        popup_Reset(); //[정인국] 모달창을 초기화 시켜주는 함수 모달창을 사용하고 페이지를 이동하지 않는이상 초기화를 시켜줘야합니다.
    	document.querySelector('#exit').style.display = 'none';
    	document.querySelector('#message').style.display = 'none';
        // setTimeout(GameClear, 2000) //[게임클리어 팝업] GameClear() 로 사용가능
        /* setTimeout(GameOver, 2000) */ //[게임오버 팝업] GameOver() 로 사용가능
      });
      function isanswer() {
    	  var answer = 	document.querySelector('#message').innerHTML;
    	  if(answer == '${words.correct}'){
    		  GameClear();
    		 	document.querySelector('#exit').style.display = 'none';
    	  }else{
    		 	setTimeout(() => {
    		 		GameOver();
				}, 1000);
    		   	document.querySelector('#exit').style.display = 'block';
    	  }
		
	}
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
			<div class="L_headerbar"></div>
			<div class="C_headerbar">스테이지 ${words.stage_id }</div>
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
						<img src="/icon/talk_stage${words.stage_id}.png">
					</div>
					<div class="Other_Person_Content">
						<div class="Other_Person_name">${words.profie }</div>
						<div class="Other_Person_text">${words.answer }</div>
					</div>
				</div>
				<!--  -->
				<div class="my_message" id="message">여기에 대화가 나옵니다.</div>
				<!-- 대화가 이루워지는 구역 -->
			</div>
			<div class="message_bottom">
				<div onclick="location.href='/TalkGameLobby'"
					class="WQ_back TALK2_BTstyle">뒤로</div>
				<div class="Talk_GameOver_message" id="exit">${words.profie }
					님이 나갔습니다.</div>

			</div>

		</div>
		<div class="message_box">
			<div class="L_message"></div>
			<div class="C_message">
				<div class="message_list">
					<div id="message_1" class="message_answer"
						onclick="answer('${words.option1 }')">${words.option1 }</div>
					<div id="message_2" class="message_answer"
						onclick="answer('${words.option2 }')">${words.option2 }</div>
					<div id="message_3" class="message_answer"
						onclick="answer('${words.option3 }')">${words.option3 }</div>
					<div id="message_4" class="message_answer"
						onclick="answer('${words.option4 }')">${words.option4 }</div>
				</div>
			</div>
			<div class="R_message">
				<div class="message_bt">
					<div class="message_bt_text" onclick="isanswer()">전송</div>
				</div>
			</div>
		</div>
	</div>
	<div id="layer_modal">
		<div class="popup_GameEnd">
			<c:choose>
				<c:when test="${words.stage_id eq 5 }">
					<div class="popup_GameClear">
						<div class="popup_GameClear_Text">신조어 소통 성공</div>
						<div class="popup_GameClear_NextGame" id="NextGame"
							onclick="location.href='/personal'">내 기록 확인하기</div>
						<div class="popup_GameClear_Lobby" id="MoveLobby"
							onclick="location.href='/updateLobby/${words.gameNum}/${words.stage_id}/1'">
							로비로 나가기</div>
					</div>
					<div class="popup_GameOver">
						<div class="popup_GameOver_Text">신조어 소통 실패</div>
						<div class="popup_GameOver_Regame" id="ReGame"
							onclick="location.href='/updateTalkre/${words.gameNum}/${words.stage_id}/0'">
							게임 다시하기</div>
						<div class="popup_GameOver_Lobby" id="MoveLobby"
							onclick="location.href='/updateLobby/${words.gameNum}/${words.stage_id}/0'">
							로비로 나가기</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="popup_GameClear">
						<div class="popup_GameClear_Text">신조어 소통 성공</div>
						<div class="popup_GameClear_NextGame" id="NextGame"
							onclick="location.href='/updateTalk/${words.gameNum}/${words.stage_id}/1'">
							다음 채팅하기</div>
						<div class="popup_GameClear_Lobby" id="MoveLobby"
							onclick="location.href='/updateLobby/${words.gameNum}/${words.stage_id}/1'">
							로비로 나가기</div>
					</div>
					<div class="popup_GameOver">
						<div class="popup_GameOver_Text">신조어 소통 실패</div>
						<div class="popup_GameOver_Regame" id="ReGame"
							onclick="location.href='/updateTalkre/${words.gameNum}/${words.stage_id}/0'">
							게임 다시하기</div>
						<div class="popup_GameOver_Lobby" id="MoveLobby"
							onclick="location.href='/updateLobby/${words.gameNum}/${words.stage_id}/0'">
							로비로 나가기</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

</body>
</html>
