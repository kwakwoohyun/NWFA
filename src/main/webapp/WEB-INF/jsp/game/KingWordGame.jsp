<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
<meta charset="utf-8">
<title>메인페이지</title>
<meta name="viewport" content="width=device-width initial-scale=1.0" />
<link rel="stylesheet" href="/project.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
	function GameClear() {
		//  게임클리어 팝업을 뛰우는 함수
		$(".popup_GameEnd").show().css('display', 'flex');
		$(".popup_GameScore").css('top', '0vh');
		$(".popup_GameScore").delay("500").fadeIn();
		// $(".popup_GameScore").css({'opacity': '0'});
		$("#layer_control").css({
			'filter' : 'blur(15px)',
			'-webkit-filter' : 'blur(15px)',
			'-moz-filter' : 'blur(15px)',
			'-o-filter' : 'blur(15px)',
			'-ms-filter' : 'blur(15px)'
		});

	}
	// [정인국] 모달창을 숨겨주기위한 함수임
	function popup_Reset() {
		$(".popup_GameEnd").hide(); // [정인국] 모달창 초기 설정 ..1
		$(".popup_GameScore").css('top', '-100vh');
		$(".popup_GameScore").fadeOut();
	}

	var clickWord = ""; // 단어변수
	var DoubleClickCheck = new Array();
	var btnState = [ 1, 1, 1, 1, 1, 1, 1, 1, 1 ];
	var btnChars = [ "${li[0]}", "${li[1]}", "${li[2]}", "${li[3]}",
			"${li[4]}", "${li[5]}", "${li[6]}", "${li[7]}", "${li[8]}" ];
	var count = 0;
	var hintIndex = 0;
	var time = 3;
	var star = 3;

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

	function buttonClick(id, index, event) {
		hintIndex += 1;
		clickWord = clickWord + event;
/* 		document.querySelector('#answer' + hintIndex).innerHTML = btnChars[index];
 */		document.querySelector('#KWGQ_BT' + id).style.backgroundColor = '#ffc834';
		document.querySelector('#KWGQ_BT' + id).className = 'KWGQ_BT';
		count++;
		check();
	}

	function buttonClickRelease(id) {
		document.querySelector('#answer' + hintIndex).innerHTML = "_";
		hintIndex += -1;
		clickWord = clickWord.replace(event, "");
		document.querySelector('#KWGQ_BT' + id).style.backgroundColor = '#ffffff';
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

	function KingWordGame7_click(event) {
		// alert("버튼7을 누르셨습니다.");;;
		btnState[6] *= -1;
		if (btnState[6] == -1) {
			buttonClick(7, 6, event);
		} else {
			buttonClickRelease(7);
		}
	}

	function KingWordGame8_click(event) {
		// alert("버튼8을 누르셨습니다.");
		btnState[7] *= -1;
		if (btnState[7] == -1) {
			buttonClick(8, 7, event);
		} else {
			buttonClickRelease(8);
		}
	}

	function KingWordGame9_click(event) {
		// alert("버튼9을 누르셨습니다.");
		btnState[8] *= -1;
		if (btnState[8] == -1) {
			buttonClick(9, 8, event);
		} else {
			buttonClickRelease(9);
		}
	}

	function check() {

		if (time < 1) {
			GameOver();
			setInitialize();
			setDisable();
		} else if (count == "${wordlength}") {
			if (clickWord == '${words[0].justice}') {
				setDisable();
				setTimeout(function() {
					if(${words[0].word_id}%10==0){
						GameClear();
					}else{
					location.href="/KingWordGame/${words[0].stage_id}/${words[0].word_id+1}/${words[0].gameNum}";						
					}
					/*  */
				}, 500);
			} else {
				time--;
				star--;
				setDisable();
				setTimeout(function() {
					alert('오답입니다. 다시 선택해주세요');
					setInitialize();
				}, 500);
			}
		}
	}
	function setInitialize() {
		for (var i = 1; i <= 9; i++) {
			document.querySelector('#KWGQ_BT' + i).style.backgroundColor = '#ffffff';
		}// 배경색 reset
		for (var i = 1; i <= 9; i++) {
			document.querySelector('#KWGQ_BT' + i).disabled = false;
		}// 버튼 클릭 disable
		for (var i = 1; i <= 3; i++) {
			document.querySelector('#answer' + i).innerHTML = "_";
		}// 힌트 reset
		clickWord = "";
		btnState = [ 1, 1, 1, 1, 1, 1, 1, 1, 1 ];
		count = 0;
		hintIndex = 0;
	}
	function setDisable() {
		for (var i = 1; i <= 9; i++) {
			document.querySelector('#KWGQ_BT' + i).disabled = 'disabled';
		}// 버튼 클릭 disable
	}

/* 	$(document).ready(function() {
		popup_Reset() //[정인국] 모달창을 초기화 시켜주는 함수 모달창을 사용하고 페이지를 이동하지 않는이상 초기화를 시켜줘야합니다.
		// 테스트 구문
		setTimeout(GameClear, 500) //[게임클리어 팝업] GameClear() 로 사용가능
		// setTimeout(GameOver, 2000) //[게임오버 팝업] GameOver() 로 사용가능
	}); */
</script>
</head>

<body id="page_KingWordGame" class="page_main page_normal background">
	<div id="layer_background"></div>
	<div id="layer_control">
		<header class="page_main">
			<div class="L_headerbar"></div>
			<div class="C_headerbar">
				<div class="KingWordGameTitle">세종대왕 단어게임</div>
			</div>
			<div class="R_headerbar">
				<div class="UI login"></div>
			</div>
		</header>
		<div class="viewBox">
			<div class="ControlBox">
				<div class="page_main KingWordGamePanel">
					<button id="KWGQ_BT1" class="KWGQ_BT" value="${li[0]}"
						onclick="KingWordGame1_click(this.value)">${li[0]}</button>
					<button id="KWGQ_BT2" class="KWGQ_BT" value="${li[1]}"
						onclick="KingWordGame2_click(this.value)">${li[1]}</button>
					<button id="KWGQ_BT3" class="KWGQ_BT" value="${li[2]}"
						onclick="KingWordGame3_click(this.value)">${li[2]}</button>
					<button id="KWGQ_BT4" class="KWGQ_BT" value="${li[3]}"
						onclick="KingWordGame4_click(this.value)">${li[3]}</button>
					<button id="KWGQ_BT5" class="KWGQ_BT" value="${li[4]}"
						onclick="KingWordGame5_click(this.value)">${li[4]}</button>
					<button id="KWGQ_BT6" class="KWGQ_BT" value="${li[5]}"
						onclick="KingWordGame6_click(this.value)">${li[5]}</button>
					<button id="KWGQ_BT7" class="KWGQ_BT" value="${li[6]}"
						onclick="KingWordGame7_click(this.value)">${li[6]}</button>
					<button id="KWGQ_BT8" class="KWGQ_BT" value="${li[7]}"
						onclick="KingWordGame8_click(this.value)">${li[7]}</button>
					<button id="KWGQ_BT9" class="KWGQ_BT" value="${li[8]}"
						onclick="KingWordGame9_click(this.value)">${li[8]}</button>
				</div>
				<footer class="page_main KingWordGamefooter">
					<div class="KW_back KW_BTstyle">
						<a href="/KingWordGameLobby/${words[0].stage_id }">뒤로</a>
					</div>
					<div class="KW_regame KW_BTstyle"
						onclick="window.location.reload()">다시하기</div>
					<div class="KW_Hint KW_BTstyle" onclick="hint();">힌트</div>
					<script>
						function hint() {
							var index = $
							{
								hintIndex
							}
							+1;
							document.querySelector('#answer' + index).innerHTML = '${hintWord}';
						}
					</script>
				</footer>
			</div>
			<div class="DisplayBox">
				<div class="KWGQ_quiz">
					<div class="KWGQ_Stage_panel">Stage 1-1</div>
					<div class="KWGQ_quiz_panel">
						${words[0].mean}<br>
					</div>
				</div>
				<div class="KWGQ_answer">
					<c:forEach var="x" varStatus="index" begin="0"
						end="${wordlength-1}" step="1">
						<%-- 						<div class="KWGQ_answer_ward" id="answer${index.count }">_</div>
 --%>
					</c:forEach>
				</div>
				<div class="info_panel flex">
					<div class="point_panel KingWordGameporint flex">
						남은기회
						<div class="Star_point" id="Star_point">♥♥♥</div>
						나의최고점수
						<div class="Heart_point">★☆☆</div>
					</div>
					<div class="kingimg"></div>
				</div>
				-
			</div>
		</div>
	</div>
	<div id="layer_modal">
		<div class="popup_GameEnd">
			<div class="popup_GameScore">
				<!-- 결과창 -->
				<div class="popup_GameScore_quiz_window">
					<div class="popup_GameScore_quiz_listText">게임 결과</div>
					<div class="popup_GameScore_quiz_list">
						<div class="popup_GameScore_quiz_1 popup_GameScore_quiz_line">
							<div class="popup_GameScore_quiz_no">1/10</div>
							<div class="popup_GameScore_quiz_box">
								<div class="popup_GameScore_quiz_Q">정답 : 가나다</div>
								<div class="popup_GameScore_quiz_A">나의답 : 가나다</div>
							</div>

							<div class="popup_GameScore_quiz_right">정답</div>
						</div>
						<!-- 정답과 오답  -->
						<div class="popup_GameScore_quiz_2 popup_GameScore_quiz_line">
							<div class="popup_GameScore_quiz_no">2/10</div>
							<div class="popup_GameScore_quiz_box">
								<div class="popup_GameScore_quiz_Q">정답 : 가나다</div>
								<div class="popup_GameScore_quiz_A">나의답 : 가나다</div>
							</div>
							<div class="popup_GameScore_quiz_right">정답</div>
						</div>
						<div class="popup_GameScore_quiz_3 popup_GameScore_quiz_line">
							<div class="popup_GameScore_quiz_no">3/10</div>
							<div class="popup_GameScore_quiz_box">
								<div class="popup_GameScore_quiz_Q">정답 : 가나다</div>
								<div class="popup_GameScore_quiz_A">나의답 : 가나다</div>
							</div>
							<div class="popup_GameScore_quiz_right">정답</div>
						</div>
						<div class="popup_GameScore_quiz_4 popup_GameScore_quiz_line">
							<div class="popup_GameScore_quiz_no">5/10</div>
							<div class="popup_GameScore_quiz_box">
								<div class="popup_GameScore_quiz_Q">정답 : 가나다</div>
								<div class="popup_GameScore_quiz_A">나의답 : 가나다</div>
							</div>
							<div class="popup_GameScore_quiz_right">정답</div>
						</div>
						<div class="popup_GameScore_quiz_4 popup_GameScore_quiz_line">
							<div class="popup_GameScore_quiz_no">6/10</div>
							<div class="popup_GameScore_quiz_box">
								<div class="popup_GameScore_quiz_Q">정답 : 가나다</div>
								<div class="popup_GameScore_quiz_A">나의답 : 가나다</div>
							</div>
							<div class="popup_GameScore_quiz_right">정답</div>
						</div>
						<div class="popup_GameScore_quiz_4 popup_GameScore_quiz_line">
							<div class="popup_GameScore_quiz_no">7/10</div>
							<div class="popup_GameScore_quiz_box">
								<div class="popup_GameScore_quiz_Q">정답 : 가나다</div>
								<div class="popup_GameScore_quiz_A">나의답 : 가나다</div>
							</div>
							<div class="popup_GameScore_quiz_right">정답</div>
						</div>
						<div class="popup_GameScore_quiz_4 popup_GameScore_quiz_line">
							<div class="popup_GameScore_quiz_no">8/10</div>
							<div class="popup_GameScore_quiz_box">
								<div class="popup_GameScore_quiz_Q">정답 : 가나다</div>
								<div class="popup_GameScore_quiz_A">나의답 : 가나다</div>
							</div>
							<div class="popup_GameScore_quiz_right">정답</div>
						</div>
						<div class="popup_GameScore_quiz_4 popup_GameScore_quiz_line">
							<div class="popup_GameScore_quiz_no">9/10</div>
							<div class="popup_GameScore_quiz_box">
								<div class="popup_GameScore_quiz_Q">정답 : 가나다</div>
								<div class="popup_GameScore_quiz_A">나의답 : 가나다</div>
							</div>
							<div class="popup_GameScore_quiz_right">정답</div>
						</div>
						<div class="popup_GameScore_quiz_4 popup_GameScore_quiz_line">
							<div class="popup_GameScore_quiz_no">10/10</div>
							<div class="popup_GameScore_quiz_box">
								<div class="popup_GameScore_quiz_Q">정답 : 가나다</div>
								<div class="popup_GameScore_quiz_A">나의답 : 가나다</div>
							</div>
							<div class="popup_GameScore_quiz_right">정답</div>
						</div>

					</div>
				</div>
				<!-- 점수윈도우 -->
				<div class="popup_GameScore_Score_window">
					<div class="popup_GameScore_Score_box">
						<div class="popup_GameScore_Score_Text">당신의 점수는 ?</div>
						<div class="popup_GameScore_Score_score" id="Score">90점</div>
					</div>
					<div class="popup_GameScore_btn_box">
						<div class="popup_GameScore_NextGame" id="NextGame">오답 확인하기
						</div>
						<div class="popup_GameScore_Lobby" id="MoveLobby">
							<a href="/">로비로 나가기</a>
						</div>
					</div>
				</div>

			</div>

			<!-- 게임오버 -->


		</div>
	</div>

</body>

</html>
