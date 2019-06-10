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
	}

	$(document).ready(function() {
		popup_Reset() //[정인국] 모달창을 초기화 시켜주는 함수 모달창을 사용하고 페이지를 이동하지 않는이상 초기화를 시켜줘야합니다.
		GameClear();
	});
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
				<div class="UI login" onclick="location.href='/personal'"></div>
			</div>
		</header>
		<div class="viewBox"></div>

		<div class="ControlBox">
			<div class="info_panel flex">
				남은기회
				<div class="Star_point" id="Star_point">♥♥♥</div>
				나의최고점수
				<div class="Heart_point">★☆☆</div>
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
</body>
<div id="layer_modal">
	<div id="layer_modal">
		<div class="popup_GameEnd">
			<div class="popup_GameScore">
				<!-- 결과창 -->
				<div class="popup_GameScore_quiz_window">
					<div class="popup_GameScore_quiz_listText">게임 결과</div>
					<div class="popup_GameScore_quiz_list">
						<c:forEach items="${words}" var="word" varStatus="status">
							<div class="popup_GameScore_quiz_1 popup_GameScore_quiz_line">
								<div class="popup_GameScore_quiz_no">${status.count }/5</div>
								<div class="popup_GameScore_quiz_box">
									<div class="popup_GameScore_quiz_Q">정답 : ${word.justice }</div>
									<div class="popup_GameScore_quiz_A">나의답 : ${word.answer }</div>
								</div>
								<c:if test="${word.isCorrect eq 1}">
									<div class="popup_GameScore_quiz_right">정답</div>
								</c:if>
							</div>
						</c:forEach>
					</div>
				</div>
				<!-- 점수윈도우 -->
				<div class="popup_GameScore_Score_window">
					<div class="popup_GameScore_Score_box">
						<div class="popup_GameScore_Score_Text">당신의 점수는 ?</div>
						<div class="popup_GameScore_Score_score" id="Score">${score }점</div>
					</div>
					<div class="popup_GameScore_btn_box">
						<div class="popup_GameScore_NextGame" id="NextGame">오답 확인하기
						</div>
						<div class="popup_GameScore_Lobby" id="MoveLobby"
							onclick="location.href='/YaminGameLobby'">로비로 나가기</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</html>