<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
<meta charset="utf-8">
<title>메인페이지</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0" />
<link rel="stylesheet" href="/project.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
	// [정인국] 여기는 모달레이어를 제어하는 변수들임 프론트엔드용
	function GameOver() {
		// 게임오버 팝업을 뛰우는 함수
		$(".popup_GameEnd").show().css('display', 'flex');
		$("#layer_control").css({
			'filter' : 'blur(15px)',
			'-webkit-filter' : 'blur(15px)',
			'-moz-filter' : 'blur(15px)',
			'-o-filter' : 'blur(15px)',
			'-ms-filter' : 'blur(15px)'
		});
		$(".popup_GameOver").css('top', '0vh');
	}
	function GameClear() {
		//  게임클리어 팝업을 뛰우는 함수
		$(".popup_GameEnd").show().css('display', 'flex');
		$("#layer_control").css({
			'filter' : 'blur(15px)',
			'-webkit-filter' : 'blur(15px)',
			'-moz-filter' : 'blur(15px)',
			'-o-filter' : 'blur(15px)',
			'-ms-filter' : 'blur(15px)'
		});
		$(".popup_GameClear").css('top', '0vh');

	}
	// [정인국] 모달창을 숨겨주기위한 함수임
	function popup_Reset() {
		$(".popup_GameEnd").hide(); // [정인국] 모달창 초기 설정 ..1
		$(".popup_GameOver").css('top', '-100vh'); // [정인국] 모달창 초기 설정 ..2
		$(".popup_GameClear").css('top', '-100vh'); // [정인국] 모달창 초기 설정 ..3
		$(".blackboard_Quiz_Question").show(); // [정인국] 모달창 초기 설정 ..3
		$(".blackboard_Quiz_Answer").hide(); // [정인국] 모달창 초기 설정 ..3
	}

	function Answer() {
		$(".blackboard_Quiz_Question").hide(); // [정인국] 모달창 초기 설정 ..3
		$(".blackboard_Quiz_Answer").show(); // [정인국] 모달창 초기 설정 ..3

	}
	var clickWord = ""; // 단어변수
	var DoubleClickCheck = new Array();
	var btnState = [ 1, 1, 1, 1, 1, 1 ];
	var btnChars = [ "${li[0]}", "${li[1]}", "${li[2]}", "${li[3]}",
			"${li[4]}", "${li[5]}" ];
	var count = 0;
	var hintIndex = 0;

	function buttonClick(id, index, event) {
		hintIndex += 1;
		clickWord = clickWord + event;
		document.querySelector('#answer' + hintIndex).innerHTML = btnChars[index];
		document.querySelector('#WQ_BT' + id).style.color = "#ff69b2";
		document.querySelector('#WQ_BT' + id).style.border = "solid 3px #ff69b2";
		count++;
		check();
	}

	function buttonClickRelease(id) {
		document.querySelector('#answer' + hintIndex).innerHTML = "_";
		hintIndex += -1;
		clickWord = clickWord.replace(event, "");
		document.querySelector('#WQ_BT' + id).style.color = '#ffffff';
		document.querySelector('#WQ_BT' + id).style.border = "solid 3px white";
		count--;
		check();
	}

	function KingWordGame1_click(event) {
		// alert("버튼1을 누르셨습니다.");
		btnState[0] *= -1;
		if (btnState[0] == -1) {
			buttonClick(1, 0, event);
		} else {
			buttonClickRelease(1);
		}
	}

	function KingWordGame2_click(event) {
		// alert("버튼2을 누르셨습니다.");
		btnState[1] *= -1;
		if (btnState[1] == -1) {
			buttonClick(2, 1, event);
		} else {
			buttonClickRelease(2);
		}
	}

	function KingWordGame3_click(event) {
		// alert("버튼3을 누르셨습니다.");
		btnState[2] *= -1;
		if (btnState[2] == -1) {
			buttonClick(3, 2, event);
		} else {
			buttonClickRelease(3);
		}
	}

	function KingWordGame4_click(event) {
		// alert("버튼4을 누르셨습니다.");
		btnState[3] *= -1;
		if (btnState[3] == -1) {
			buttonClick(4, 3, event);
		} else {
			buttonClickRelease(4);
		}
	}

	function KingWordGame5_click(event) {
		// alert("버튼5을 누르셨습니다.");
		btnState[4] *= -1;
		if (btnState[4] == -1) {
			buttonClick(5, 4, event);
		} else {
			buttonClickRelease(5);
		}
	}

	function KingWordGame6_click(event) {
		// alert("버튼6을 누르셨습니다.");
		btnState[5] *= -1;
		if (btnState[5] == -1) {
			buttonClick(6, 5, event);
		} else {
			buttonClickRelease(6);
		}
	}

	function check() {
		if (count == "${word.justice.length()}") {
			if (clickWord == '${word.justice}') {
				
				location.href = '/YaminGame/${word.stage_id}/${word.gameNum}/${wordIdx+1}';
				setTimeout(GameClear, 5000);
			} else {
				setTimeout(function() {
					location.href = '/YaminGame/${word.stage_id}/${word.gameNum}/${wordIdx+1}';
				}, 500);
			}
		}
	}
</script>
</head>

<body id="page_ChallengeQuizgame" class="page_ChallengeQuiz">
	<div id="layer_background">
		<div class="background_ChallengeQuiz">
			<div class="img_teacher"></div>
		</div>
	</div>
	<div id="layer_control">
		<header class="page_main">
			<div class="L_headerbar"></div>
			<div class="C_headerbar">
				<div class="WordQuizTitle">도전 신조어!</div>
			</div>
			<div class="R_headerbar">
				<div class="UI login" onclick="location.href='tempmenu'"></div>
			</div>
		</header>
		<div class="viewBox">

			<div class="DisplayBox">
				<div class="quiz">

					<div class="Stage_panel">Stage 1-${wordIdx}</div>
					<div class="blackboard">
						<div class="blackboard_Quiz">${word.mean}</div>
						<div class="blackboard_Quiz_Question">
							<c:forEach var="x" varStatus="index" begin="0"
								end="${wordlength-1}" step="1">
								<span id="answer${index.count }">_</span>
							</c:forEach>
						</div>
						<div class="blackboard_Quiz_Answer"
							style="display: none; position: relative; position: relative; bottom: 30px;">
							<img src="/icon/WQ${word.img }.gif">
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
					<div class="Star_point" id="Star_point">♥♥♥</div>
					나의최고점수
					<div class="Heart_point">★☆☆</div>
				</div>

				<div class="buttonbox">
					<button id="WQ_BT1" class="WQ_BT" value="${li[0] }"
						onclick="KingWordGame1_click(this.value)">${li[0] }</button>
					<button id="WQ_BT2" class="WQ_BT" value="${li[1] }"
						onclick="KingWordGame2_click(this.value)">${li[1] }</button>
					<button id="WQ_BT3" class="WQ_BT" value="${li[2] }"
						onclick="KingWordGame3_click(this.value)">${li[2] }</button>
					<button id="WQ_BT4" class="WQ_BT" value="${li[3] }"
						onclick="KingWordGame4_click(this.value)">${li[3] }</button>
					<button id="WQ_BT5" class="WQ_BT" value="${li[4] }"
						onclick="KingWordGame5_click(this.value)">${li[4] }</button>
					<button id="WQ_BT6" class="WQ_BT" value="${li[5] }"
						onclick="KingWordGame6_click(this.value)">${li[5] }</button>
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
					<a href="/YaminGameLobby">뒤로</a>
				</div>
				<div class="KW_regame CQ_BTstyle" onclick="window.location.reload()">다시하기</div>
				<div class="visibilityhidden CQ_BTstyle"></div>
			</footer>
		</div>
	</div>
	<div id="layer_modal">
		<div class="popup_GameEnd">
			<div class="popup_GameClear">
				<div class="popup_GameClear_Text">GAME CLEAR</div>
				<div class="popup_GameClear_NextGame" id="NextGame"
					onclick="window.location.href = '/YaminGame/${yamin+1};'">다음
					스테이지</div>
				<div class="popup_GameClear_Lobby" id="MoveLobby"
					onclick="window.location.href = '/YaminGameLobby'">로비로 나가기</div>
			</div>
			<div class="popup_GameOver">
				<div class="popup_GameOver_Text">GAME OVER</div>

				<div class="popup_GameOver_Regame" id="ReGame"
					onclick="window.location.reload()">게임 다시하기</div>
				<div class="popup_GameOver_Lobby" id="MoveLobby"
					onclick="window.location.href = '/YaminGameLobby'">로비로 나가기</div>
			</div>
		</div>
	</div>
</body>

</html>