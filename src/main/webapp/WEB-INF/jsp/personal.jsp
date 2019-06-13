<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
<meta charset="utf-8">
<title>메인페이지</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0" />
<link rel="stylesheet" href="/project.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
history.pushState(null, null, location.href);
window.onpopstate = function(event) {
	history.go(1);
};
	var sidebar = "ranking"; // 단어변수
	var game_Select = 1 // 1은 세종게임 2는 신조어 게임 3은 신조어톡

	$(document).ready(function() {
		$(".personal_content>div").hide();
		$("#personal_ranking").show();
		
		switch (${gameNum }) {
		case 1:
			$("#KWG_btn"+"${stage_id}").css("background-color", "#ff5050");
			$("#KWG_btn"+"${stage_id}").css("color", "#fff");
			$(".log_game_bt:nth-of-type(1)").css("background-color", "#ff5050");
			$("#QW_log_Bt").hide();
			$("#Talk_log_Bt").hide();
			break;
		case 2:
			$("#QW_btn"+"${stage_id}").css("background-color", "#ff5050");
			$("#QW_btn"+"${stage_id}").css("color", "#fff");
			$(".log_game_bt:nth-of-type(2)").css("background-color", "#ff5050");
			$("#KWG_log_Bt").hide();
			$("#Talk_log_Bt").hide();
			break;
		case 3:
			$("#Talk_btn"+"${stage_id}").css("background-color", "#ff5050");
			$("#Talk_btn"+"${stage_id}").css("color", "#fff");
			$(".log_game_bt:nth-of-type(3)").css("background-color", "#ff5050");
			$("#KWG_log_Bt").hide();
			$("#QW_log_Bt").hide();
			break;
		}
		
	});

	function log_btc_click(event) {
		game_Selectr = event;
		$("#KWG_log_Bt").hide();
		$("#QW_log_Bt").hide();
		$("#Talk_log_Bt").hide();
		$(".log_game_bt").css("background-color", "#ffc000");

		if (game_Selectr == 1) {
			$(".log_game_bt:nth-of-type(1)").css("background-color", "#ff5050");
			$("#KWG_log_Bt").show();
			location.href = "/wrongNote/1/1"
		} else if (game_Selectr == 2) {
			$(".log_game_bt:nth-of-type(2)").css("background-color", "#ff5050");
			$("#QW_log_Bt").show();
			location.href = "/wrongNote/1/2"
		} else if (game_Selectr == 3) {
			$(".log_game_bt:nth-of-type(3)").css("background-color", "#ff5050");
			$("#Talk_log_Bt").show();
			location.href = "/wrongNote/1/3"
		}
	}

	function personal_click(event) {
		sidebar = event;
		$(".personal_sidebt").css("background-color", "#fad644");
		$("#personal_logoutbt").css("background-color", "#ff5050");
		$(".personal_content>div").hide();
		if (sidebar == "ranking") {
			$("#personal_ranking").show();
			$("#personal_rankingbt").css("background-color", "#ffc000")
			$(".personal_titleBar").text("| 오답")

		} else if (sidebar == "score") {
			$("#personal_score").show();
			$("#personal_scorebt").css("background-color", "#ffc000")
			$(".personal_titleBar").text("| 점수")
		} else if (sidebar == "achievements") {
			$("#personal_achievements").show();
			$("#personal_achievementsbt").css("background-color", "#ffc000")
			$(".personal_titleBar").text("| 도전과제")
		} else if (sidebar == "setting") {
			$("#personal_setting").show();
			$("#personal_settingbt").css("background-color", "#ffc000")
			$(".personal_titleBar").text("| 개인설정")
		} else if (sidebar == "logout") {
			$("#personal_logout").show();
			$("#personal_logoutbt").css("background-color", "#ffc000")
		}
	}
	
	function KWG_btn(event){
		switch(event){
		case 1:	location.href = "/wrongNote/1/1"
			break;
		case 2:location.href = "/wrongNote/2/1"
			break;
		case 3:location.href = "/wrongNote/3/1"
			break;
		case 4:location.href = "/wrongNote/4/1"
			break;
		case 5:location.href = "/wrongNote/5/1"
			break;
	}
}
	function QW_btn(event){
		switch(event){
		case 1:	location.href = "/wrongNote/1/2"
			break;
		case 2:location.href = "/wrongNote/2/2"
			break;
		case 3:location.href = "/wrongNote/3/2"
			break;
	}
}
	
		function Talk_btn(event){
		switch(event){
		case 1:	location.href = "/wrongNote/1/3"
			break;
		case 2:location.href = "/wrongNote/2/3"
			break;
		case 3:location.href = "/wrongNote/3/3"
			break;
		case 4:location.href = "/wrongNote/4/3"
			break;
		case 5:location.href = "/wrongNote/5/3"
			break;
	}
}
</script>
</head>

<body id="page_personal">
	<div id="layer_background">
		<div id="personal_background">
			<!-- 배경색 #ff5050-->
		</div>
	</div>
	<div id="layer_control">
		<header class="page_main">
			<div class="L_headerbar">
				<div id="mini_logo"></div>
			</div>
			<div class="C_headerbar">
				<div class="personal_titleBar">| 오답</div>
			</div>
			<div class="R_headerbar"></div>
		</header>
		<div class="personal_main">
			<div class="personal_sidebar">
				<div class="personal_bts">
					<div id="personal_rankingbt" class="personal_sidebt"
						value="ranking" onclick="personal_click('ranking')">오답</div>

					<div id="personal_scorebt" class="personal_sidebt" value="score"
						onclick="personal_click('score')">점수</div>
					<div id="personal_achievementsbt" class="personal_sidebt"
						value="achievements" onclick="personal_click('achievements')">
						도전과제</div>
					<div id="personal_settingbt" class="personal_sidebt"
						value="setting" onclick="personal_click('setting')">개인설정</div>
				</div>
				<div class="logout_bt">
					<div id="personal_logoutbt" class="personal_sidebt" value="logout"
						onclick="location.href='/logout'">로그오프</div>
				</div>

			</div>
			<div class="personal_content">
				<div id="personal_ranking">
					<div class="log_game_bar">
						<div class="log_title">오답을 확인하실수 있습니다</div>
						<div class="log_game">
							<div class="log_game_bt" onclick="log_btc_click(1);">세종대왕
								단어게임</div>
							<div class="log_game_bt" onclick="log_btc_click(2);">도전 신조어
							</div>
							<div class="log_game_bt" onclick="log_btc_click(3);">신조어톡</div>
						</div>
					</div>
					<div class="log_stage_bar">
						<div id="KWG_log_Bt" class="log_stage">
							<c:choose>
								<c:when test="${stage[0].isLock eq '1' }">
									<button class="log_stage_bt" type="button" value="1"
										name="button" id="KWG_btn1" onclick="KWG_btn(1)">1</button>
								</c:when>
								<c:when test="${stage[0].isLock eq '0' }">
									<button class="log_stage_bt" type="button" value="1"
										name="button" id="KWG_btn1" onclick="KWG_btn(1)"
										style="background-color: gray; color: white; pointer-events: none; cursor: default;">1</button>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${stage[1].isLock eq '1' }">
									<button class="log_stage_bt" type="button" value="2"
										name="button" id="KWG_btn2" onclick="KWG_btn(2)">2</button>
								</c:when>
								<c:when test="${stage[1].isLock eq '0' }">
									<button class="log_stage_bt" type="button" value="2"
										name="button" id="KWG_btn2" onclick="KWG_btn(2)"
										style="background-color: gray; color: white;">2</button>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${stage[2].isLock eq '1' }">
									<button class="log_stage_bt" type="button" value="3"
										name="button" id="KWG_btn3" onclick="KWG_btn(3)">3</button>
								</c:when>
								<c:when test="${stage[2].isLock eq '0' }">
									<button class="log_stage_bt" type="button" value="3"
										name="button" id="KWG_btn3" onclick="KWG_btn(3)"
										style="background-color: gray; color: white;">3</button>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${stage[3].isLock eq '1' }">
									<button class="log_stage_bt" type="button" value="4"
										name="button" id="KWG_btn4" onclick="KWG_btn(4)">4</button>
								</c:when>
								<c:when test="${stage[3].isLock eq '0' }">
									<button class="log_stage_bt" type="button" value="4"
										name="button" id="KWG_btn4" onclick="KWG_btn(4)"
										style="background-color: gray; color: white; pointer-events: none; cursor: default;">4</button>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${stage[4].isLock eq '1' }">
									<button class="log_stage_bt" type="button" value="5"
										name="button" id="KWG_btn5" onclick="KWG_btn(5)">5</button>
								</c:when>
								<c:when test="${stage[4].isLock eq '0' }">
									<button class="log_stage_bt" type="button" value="5"
										name="button" id="KWG_btn5" onclick="KWG_btn(5)"
										style="background-color: gray; color: white; pointer-events: none; cursor: default;">5</button>
								</c:when>
							</c:choose>
							<button class="log_stage_bt" type="button" value="6"
								name="button" id="KWG_btn6" onclick="KWG_btn(6)"
								style="background-color: gray; color: white; pointer-events: none; cursor: default;">?</button>
						</div>
						<div id="QW_log_Bt" class="log_stage">
							<c:choose>
								<c:when test="${stage[0].isLock eq '1' }">
									<button class="log_stage_bt" type="button" value="1"
										name="button" id="QW_btn1" onclick="QW_btn(1)">1</button>
								</c:when>
								<c:when test="${stage[0].isLock eq '0' }">
									<button class="log_stage_bt" type="button" value="1"
										name="button" id="QW_btn1" onclick="QW_btn(1)"
										style="background-color: gray; color: white; pointer-events: none; cursor: default;">1</button>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${stage[1].isLock eq '1' }">
									<button class="log_stage_bt" type="button" value="2"
										name="button" id="QW_btn2" onclick="QW_btn(2)">2</button>
								</c:when>
								<c:when test="${stage[1].isLock eq '0' }">
									<button class="log_stage_bt" type="button" value="2"
										name="button" id="QW_btn2" onclick="QW_btn(2)"
										style="background-color: gray; color: white; pointer-events: none; cursor: default;">2</button>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${stage[2].isLock eq '1' }">
									<button class="log_stage_bt" type="button" value="3"
										name="button" id="QW_btn3" onclick="QW_btn(3)">3</button>
								</c:when>
								<c:when test="${stage[2].isLock eq '0' }">
									<button class="log_stage_bt" type="button" value="3"
										name="button" id="QW_btn3" onclick="QW_btn(3)"
										style="background-color: gray; color: white; pointer-events: none; cursor: default;">3</button>
								</c:when>
							</c:choose>
						</div>
						<div id="Talk_log_Bt" class="log_stage">
							<c:choose>
								<c:when test="${stage[0].isLock eq '1' }">
									<button class="log_stage_bt" type="button" value="1"
										name="button" id="Talk_btn1" onclick="Talk_btn(1)">1</button>
								</c:when>
								<c:when test="${stage[0].isLock eq '0' }">
									<button class="log_stage_bt" type="button" value="1"
										name="button" id="Talk_btn1" onclick="Talk_btn(1)"
										style="background-color: gray; color: white; pointer-events: none; cursor: default;">1</button>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${stage[1].isLock eq '1' }">
									<button class="log_stage_bt" type="button" value="2"
										id="Talk_btn2" onclick="Talk_btn(2)" name="button">2</button>
								</c:when>
								<c:when test="${stage[1].isLock eq '0' }">
									<button class="log_stage_bt" type="button" value="2"
										name="button" id="Talk_btn2" onclick="Talk_btn(2)"
										style="background-color: gray; color: white; pointer-events: none; cursor: default;">2</button>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${stage[2].isLock eq '1' }">
									<button class="log_stage_bt" type="button" value="3"
										id="Talk_btn3" onclick="Talk_btn(3)" name="button">3</button>
								</c:when>
								<c:when test="${stage[2].isLock eq '0' }">
									<button class="log_stage_bt" type="button" value="3"
										id="Talk_btn3" onclick="Talk_btn(3)" name="button"
										style="background-color: gray; color: white; pointer-events: none; cursor: default;">3</button>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${stage[3].isLock eq '1' }">
									<button class="log_stage_bt" type="button" value="4"
										id="Talk_btn4" onclick="Talk_btn(4)" name="button">4</button>
								</c:when>
								<c:when test="${stage[3].isLock eq '0' }">
									<button class="log_stage_bt" type="button" value="4"
										id="Talk_btn4" onclick="Talk_btn(4)" name="button"
										style="background-color: gray; color: white; pointer-events: none; cursor: default;">4</button>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${stage[4].isLock eq '1' }">
									<button class="log_stage_bt" type="button" value="5"
										id="Talk_btn5" onclick="Talk_btn(5)" name="button">5</button>
								</c:when>
								<c:when test="${stage[4].isLock eq '0' }">
									<button class="log_stage_bt" type="button" value="5"
										id="Talk_btn5" onclick="Talk_btn(5)" name="button"
										style="background-color: gray; color: white; pointer-events: none; cursor: default;">5</button>
								</c:when>
							</c:choose>
						</div>
					</div>
					<div class="log_content">
						<!-- 오답 템플릿 -->
						<c:forEach items="${wrongNote }" var="word" varStatus="status">
							<c:if test="${word.isCorrect eq 0}">
								<div class="log_WrongAnswer">
									<div class="WrongAnswer_quiz" id="quiz">${word.mean }</div>
									<div class="WrongAnswer_Answer">
										<div class="WrongAnswer_myAnswer" id="myanswer">나의답 :
											${word.answer }</div>
										<div class="WrongAnswer_rightAnswer" id="answer">정답 :
											${word.justice }</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
						<!-- 오답 템플릿 -->
					</div>
				</div>
				<div id="personal_score">
					<div class="score_game_Sejong">
						<div class="score_game_imgarea">
							<div class="score_game_img"></div>
							<div class="score_game_img_text">세종대왕 단어게임</div>
						</div>
						<div class="score_Stage_area">

							<div class="score_Stage" id="score_Stage_Sejong">
								스테이지1 <br>
								<c:choose>
									<c:when test="${stagesking[0].score == 0}">
										<span class="Sejong_Stage" id="Sejong_Stage1">?</span>
									</c:when>
									<c:otherwise>
										<span class="Sejong_Stage" id="Sejong_Stage1">${stagesking[0].score }점</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="score_Stage" id="score_Stage_Sejong">
								스테이지2 <br>
								<c:choose>
									<c:when test="${stagesking[1].score == 0}">
										<span class="Sejong_Stage" id="Sejong_Stage2">?</span>
									</c:when>
									<c:otherwise>
										<span class="Sejong_Stage" id="Sejong_Stage2">${stagesking[1].score }점</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="score_Stage" id="score_Stage_Sejong">
								스테이지3 <br>
								<c:choose>
									<c:when test="${stagesking[2].score eq 0 }">
										<span class="Sejong_Stage" id="Sejong_Stage3">?</span>
									</c:when>
									<c:otherwise>
										<span class="Sejong_Stage" id="Sejong_Stage3">${stagesking[2].score }점</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="score_Stage" id="score_Stage_Sejong">
								스테이지4 <br>
								<c:choose>
									<c:when test="${stagesking[3].score eq 0 }">
										<span class="Sejong_Stage" id="Sejong_Stage4">?</span>
									</c:when>
									<c:otherwise>
										<span class="Sejong_Stage" id="Sejong_Stage4">${stagesking[3].score }점</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="score_Stage" id="score_Stage_Sejong">
								스테이지5 <br>
								<c:choose>
									<c:when test="${stagesking[4].score eq 0 }">
										<span class="Sejong_Stage" id="Sejong_Stage5">?</span>
									</c:when>
									<c:otherwise>
										<span class="Sejong_Stage" id="Sejong_Stage5">${stagesking[4].score }점</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="score_game_WordQuiz">
						<div class="score_game_imgarea">
							<div class="score_game_img"></div>
							<div class="score_game_img_text">도전 줄임말 !</div>
						</div>
						<div class="score_Stage_area">

							<div class="score_Stage" id="score_WordQuiz_Sejong">
								스테이지1 <br>
								<c:choose>
									<c:when test="${stagesYamin[0].score eq 0 }">
										<span class="WordQuiz_Stage" id="WordQuiz_Stage1">?</span>
									</c:when>
									<c:otherwise>
										<span class="WordQuiz_Stage" id="WordQuiz_Stage1">${stagesYamin[0].score }점</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="score_Stage" id="score_WordQuiz_Sejong">
								스테이지2 <br>
								<c:choose>
									<c:when test="${stagesYamin[1].score eq 0 }">
										<span class="WordQuiz_Stage" id="WordQuiz_Stage2">?</span>
									</c:when>
									<c:otherwise>
										<span class="WordQuiz_Stage" id="WordQuiz_Stage2">${stagesYamin[1].score }점</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="score_Stage" id="score_WordQuiz_Sejong">
								스테이지3 <br>
								<c:choose>
									<c:when test="${stagesYamin[2].score eq 0 }">
										<span class="WordQuiz_Stage" id="WordQuiz_Stage3">?</span>
									</c:when>
									<c:otherwise>
										<span class="WordQuiz_Stage" id="WordQuiz_Stage3">${stagesYamin[2].score }점</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="score_game_Talk">
						<div class="score_game_imgarea">
							<div class="score_game_img"></div>
							<div class="score_game_img_text">신조어톡</div>
						</div>

						<div class="score_Stage_area">

							<div class="score_Stage" id="score_Stage_Talk">
								스테이지1 <br>
								<c:choose>
									<c:when test="${stagesTalk[0].score eq 0 }">
										<span class="Talk_Stage" id="Talk_Stage1">?</span>
									</c:when>
									<c:otherwise>
										<span class="Talk_Stage" id="Talk_Stage1">${stagesTalk[0].score }점</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="score_Stage" id="score_Stage_Sejong">
								스테이지2 <br>
								<c:choose>
									<c:when test="${stagesTalk[1].score eq 0 }">
										<span class="Talk_Stage" id="Talk_Stage2">?</span>
									</c:when>
									<c:otherwise>
										<span class="Talk_Stage" id="Talk_Stage2">${stagesTalk[1].score }점</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="score_Stage" id="score_Stage_Sejong">
								스테이지3 <br>
								<c:choose>
									<c:when test="${stagesTalk[2].score eq 0 }">
										<span class="Talk_Stage" id="Talk_Stage3">?</span>
									</c:when>
									<c:otherwise>
										<span class="Talk_Stage" id="Talk_Stage3">${stagesTalk[2].score }점</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="score_Stage" id="score_Stage_Sejong">
								스테이지4 <br>
								<c:choose>
									<c:when test="${stagesTalk[3].score eq 0 }">
										<span class="Talk_Stage" id="Talk_Stage4">?</span>
									</c:when>
									<c:otherwise>
										<span class="Talk_Stage" id="Talk_Stage4">${stagesTalk[3].score }점</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="score_Stage" id="score_Stage_Sejong">
								스테이지5 <br>
								<c:choose>
									<c:when test="${stagesTalk[4].score eq 0 }">
										<span class="Talk_Stage" id="Talk_Stage5">?</span>
									</c:when>
									<c:otherwise>
										<span class="Talk_Stage" id="Talk_Stage5">${stagesTalk[4].score }점</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
				<div id="personal_achievements">
					<div class="personal_achievements_point_area">
						<div class="personal_achievements_point_Text">나의 도전과제 점수</div>
						<div class="personal_achievements_point">450점</div>
					</div>
					<div class="personal_achievements_btarea">
						<div class="">전체</div>
						<div class="">신조어 업적</div>
						<div class="">게임 업적</div>
						<div class="">기타업적</div>
					</div>
					<div class="personal_achievements_list">
						<!-- 업적들 -->
						<div class="achievement">
							<div class="achievement_Obj">
								<div class="achievement_Left">
									<div class="achievement_Thumbnail">이미지</div>
									<div class="achievement_Text">
										<div class="achievement_Name">마춤뻡이 가장 쉬웠어요</div>
										<div class="achievement_Info">
											<div class="achievement_Tag">[신조어]</div>
											<div class="achievement_Summary">야민정음 관련 모든 문제 풀기</div>
										</div>
									</div>
								</div>
								<div class="achievement_Right">
									<div class="achievement_Point">50점</div>
									<div class="achievement_Clear"></div>
								</div>
							</div>
						</div>
						<div class="achievement">
							<div class="achievement_Obj">
								<div class="achievement_Left">
									<div class="achievement_Thumbnail">이미지</div>
									<div class="achievement_Text">
										<div class="achievement_Name">말넘심.. ㄷㄷ</div>
										<div class="achievement_Info">
											<div class="achievement_Tag">[신조어톡]</div>
											<div class="achievement_Summary">게임에서 5번 이상 상대를 나가게하기</div>
										</div>
									</div>
								</div>
								<div class="achievement_Right">
									<div class="achievement_Point">20점</div>
									<div class="achievement_Clear"></div>
								</div>
							</div>
						</div>
						<div class="achievement">
							<div class="achievement_Obj">
								<div class="achievement_Left">
									<div class="achievement_Thumbnail">이미지</div>
									<div class="achievement_Text">
										<div class="achievement_Name">라떼는 말이야</div>
										<div class="achievement_Info">
											<div class="achievement_Tag">[신조어]</div>
											<div class="achievement_Summary">2010년 이전에 만들어진 신조어 10개
												풀기</div>
										</div>
									</div>
								</div>
								<div class="achievement_Right">
									<div class="achievement_Point">30점</div>
									<div class="achievement_Clear">달성</div>
								</div>
							</div>
						</div>
						<div class="achievement">
							<div class="achievement_Obj">
								<div class="achievement_Left">
									<div class="achievement_Thumbnail">이미지</div>
									<div class="achievement_Text">
										<div class="achievement_Name">즐기시게 놔둬</div>
										<div class="achievement_Info">
											<div class="achievement_Tag">[사전]</div>
											<div class="achievement_Summary">사전에서 즐겨찾기 50개 하기</div>
										</div>
									</div>
								</div>
								<div class="achievement_Right">
									<div class="achievement_Point">20점</div>
									<div class="achievement_Clear">달성</div>
								</div>
							</div>
						</div>
						<div class="achievement">
							<div class="achievement_Obj">
								<div class="achievement_Left">
									<div class="achievement_Thumbnail">이미지</div>
									<div class="achievement_Text">
										<div class="achievement_Name">형이 거기서 왜 나와?</div>
										<div class="achievement_Info">
											<div class="achievement_Tag">[신조어]</div>
											<div class="achievement_Summary">해당업적을 따기 위한 조건</div>
										</div>
									</div>
								</div>
								<div class="achievement_Right">
									<div class="achievement_Point">50점</div>
									<div class="achievement_Clear">달성</div>
								</div>
							</div>
						</div>
						<div class="achievement">
							<div class="achievement_Obj">
								<div class="achievement_Left">
									<div class="achievement_Thumbnail">이미지</div>
									<div class="achievement_Text">
										<div class="achievement_Name">이름</div>
										<div class="achievement_Info">
											<div class="achievement_Tag">[신조어]</div>
											<div class="achievement_Summary">해당업적을 따기 위한 조건</div>
										</div>
									</div>
								</div>
								<div class="achievement_Right">
									<div class="achievement_Point">50점</div>
									<div class="achievement_Clear">달성</div>
								</div>
							</div>
						</div>
						<div class="achievement">
							<div class="achievement_Obj">
								<div class="achievement_Left">
									<div class="achievement_Thumbnail">이미지</div>
									<div class="achievement_Text">
										<div class="achievement_Name">이름</div>
										<div class="achievement_Info">
											<div class="achievement_Tag">[신조어]</div>
											<div class="achievement_Summary">해당업적을 따기 위한 조건</div>
										</div>
									</div>
								</div>
								<div class="achievement_Right">
									<div class="achievement_Point">50점</div>
									<div class="achievement_Clear">달성</div>
								</div>
							</div>
						</div>

						<!-- 업적들 -->
					</div>
				</div>
				<div id="personal_setting">
					<div class="setting_passwd">
						<div class="setting_passwd_text">계정 비밀번호 변경</div>
						<div class="setting_passwd_box">
							<div class="setting_passwd_info">
								계정의 비밀번호를 변경할수 있습니다.<br> 이메일 인증이 필요합니다.
							</div>
							<div class="setting_passwd_bt" onclick="location.href='/update'">
								비밀번호 변경</div>
						</div>
					</div>
					<div class="setting_profile"></div>
				</div>
				<div id="personal_logout"></div>
			</div>
		</div>
		<footer class="page_main Userfooter">
			<div class="KW_back KW_BTstyle">
				<a href="/">뒤로</a>
			</div>
			<div class="visibilityhidden KW_BTstyle"></div>
			<div class="visibilityhidden KW_BTstyle"></div>
		</footer>
	</div>
	<div id="layer_modal"></div>
</body>
</html>