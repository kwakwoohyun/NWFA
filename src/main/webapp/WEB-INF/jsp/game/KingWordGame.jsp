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
<script type="text/javascript">
	var clickWord = ""; // 단어변수
	var DoubleClickCheck = new Array();
	var btnState = [ 1, 1, 1, 1, 1, 1, 1, 1, 1 ];
	var btnChars = [ "${li[0]}", "${li[1]}", "${li[2]}", "${li[3]}",
			"${li[4]}", "${li[5]}", "${li[6]}", "${li[7]}", "${li[8]}" ];
	var count = 0;
	var hintIndex = 0;
	var time = 3;

	function buttonClick(id, index, event) {
		hintIndex += 1;
		clickWord = clickWord + event;
		document.querySelector('#answer' + hintIndex).innerHTML = btnChars[index];
		document.querySelector('#KWGQ_BT' + id).style.backgroundColor = '#ffc834';
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
		// alert("버튼7을 누르셨습니다.");
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
			alert('더이상 게임을 진행할 수 없습니다.');
			setInitialize();
			setDisable();
		} else if (count == "${wordlength}") {
			if (clickWord == '${word.justice}') {
				setDisable();
				setTimeout(function() {
					alert('정답입니다.');
				}, 500);
				setTimeout(function() {
					window.location.href = "/KingWordGame/${sejong+1}";
				}, 300);
			} else {
				time--;
				setDisable();
				setTimeout(function() {
					alert('오답입니다. 다시 선택해주세요');
					setInitialize();
				}, 500);
			}
		}
		setHeart();
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
	function setHeart() {
		if (time == 3) {
			document.getElementById("Star_point").innerHTML = "♥♥♥";
		} else if (time == 2) {
			document.getElementById("Star_point").innerHTML = "♥♥♡";
		} else if (time == 1) {
			document.getElementById("Star_point").innerHTML = "♥♡♡";
		} else {
			document.getElementById("Star_point").innerHTML = "♡♡♡";
		}
	}
</script>

</head>

<body id="page_KingWordGame" class="page_main page_normal"
	class="background">
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
					<a href="/KingWordGameLobby">뒤로</a>
				</div>
				<div class="KW_regame KW_BTstyle" onclick="window.location.reload()">다시하기</div>
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
					${word.mean}<br>
				</div>
			</div>
			<div class="KWGQ_answer">
				<c:forEach var="x" varStatus="index" begin="0" end="${wordlength-1}"
					step="1">
					<div class="KWGQ_answer_ward" id="answer${index.count }">_</div>
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
		</div>
	</div>
</body>

</html>
