<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
<meta charset="utf-8">
<title>메인페이지</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0" />
<link rel="stylesheet" href="project.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script type="text/javascript">
	var clickWord = ""; // 단어변수
	var DoubleClickCheck = new Array();
	function KingWordGame1_click(event) {
		// alert("버튼1을 누르셨습니다.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT1').style.backgroundColor = '#ffc834';
	}

	function KingWordGame2_click(event) {
		// alert("버튼2을 누르셨습니다.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT2').style.backgroundColor = '#ffc834';
	}

	function KingWordGame3_click(event) {
		// alert("버튼3을 누르셨습니다.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT3').style.backgroundColor = '#ffc834';
	}

	function KingWordGame4_click(event) {
		// alert("버튼4을 누르셨습니다.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT4').style.backgroundColor = '#ffc834';
	}
	function KingWordGame5_click(event) {
		// alert("버튼5을 누르셨습니다.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT5').style.backgroundColor = '#ffc834';
	}

	function KingWordGame6_click(event) {
		// alert("버튼6을 누르셨습니다.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT6').style.backgroundColor = '#ffc834';
	}

	function KingWordGame7_click(event) {
		// alert("버튼7을 누르셨습니다.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT7').style.backgroundColor = '#ffc834';
	}

	function KingWordGame8_click(event) {
		// alert("버튼8을 누르셨습니다.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT8').style.backgroundColor = '#ffc834';
	}
	function KingWordGame9_click(event) {
		// alert("버튼9을 누르셨습니다.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT9').style.backgroundColor = '#ffc834';
	}

	function KingWordGame10_click(event) {
		// alert("버튼10을 누르셨습니다.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT10').style.backgroundColor = '#ffc834';
	}

	function KingWordGame11_click(event) {
		// alert("버튼11을 누르셨습니다.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT11').style.backgroundColor = '#ffc834';
	}

	function KingWordGame12_click(event) {
		// alert("버튼12을 누르셨습니다.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT12').style.backgroundColor = '#ffc834';
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
					<button id="KWGQ_BT1" class="KWGQ_BT" value="${li[0].syllable}"
						onclick="KingWordGame1_click(this.value)">${li[0].syllable}</button>
					<button id="KWGQ_BT2" class="KWGQ_BT" value="${li[1].syllable}"
						onclick="KingWordGame2_click(this.value)">${li[1].syllable}</button>
					<button id="KWGQ_BT3" class="KWGQ_BT" value="${li[2].syllable}"
						onclick="KingWordGame3_click(this.value)">${li[2].syllable}</button>
					<button id="KWGQ_BT4" class="KWGQ_BT" value="${li[3].syllable}"
						onclick="KingWordGame4_click(this.value)">${li[3].syllable}</button>
					<button id="KWGQ_BT5" class="KWGQ_BT" value="${li[4].syllable}"
						onclick="KingWordGame5_click(this.value)">${li[4].syllable}</button>
					<button id="KWGQ_BT6" class="KWGQ_BT" value="${li[5].syllable}"
						onclick="KingWordGame6_click(this.value)">${li[5].syllable}</button>
					<button id="KWGQ_BT7" class="KWGQ_BT" value="${li[6].syllable}"
						onclick="KingWordGame7_click(this.value)">${li[6].syllable}</button>
					<button id="KWGQ_BT8" class="KWGQ_BT" value="${li[7].syllable}"
						onclick="KingWordGame8_click(this.value)">${li[7].syllable}</button>
					<button id="KWGQ_BT9" class="KWGQ_BT" value="${li[8].syllable}"
						onclick="KingWordGame9_click(this.value)">${li[8].syllable}</button>
			</div>
			<footer class="page_main KingWordGamefooter">
				<div class="KW_back KW_BTstyle">
					<a href="/">뒤로</a>
				</div>
				<div class="KW_regame KW_BTstyle">다시하기</div>
				<div class="KW_Hint KW_BTstyle">힌트</div>
			</footer>
		</div>
		<div class="DisplayBox">
			<div class="KWGQ_quiz">

				<div class="KWGQ_Stage_panel">Stage 1-1</div>

				<div class="KWGQ_quiz_panel">
					${word.meaning}<br>
				</div>
			</div>
			<div class="info_panel flex">
				<div class="point_panel KingWordGameporint flex">
					남은기회
					<div class="Star_point">♥♥♡</div>
					나의최고점수
					<div class="Heart_point">★☆☆</div>
				</div>
				<div class="kingimg"></div>
			</div>
		</div>
	</div>

</body>

</html>
