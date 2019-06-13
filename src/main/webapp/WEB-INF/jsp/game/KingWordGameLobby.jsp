<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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

	history.pushState(null, null, location.href);
	window.onpopstate = function(event) {
		history.go(1);
	};
	var cardClick = new Array();
	var cardloc = 0;
	
	// 화면에서 보이는 카드 번호
	$(document).ready(function() {
		$(".Card_Back").hide();
		$(".Card_Front").show();
		$("#KWG_stage"+'${words[0].stage_id}').css({
			'background-color' : '#ff5050'
		})
		$(".prevBT").hide(); // 맨 처음 카드를 화면에 보여줄때 이전으로 가기 버튼을 비활성화 시킴
	});

	function KingWordGameLevel_click(event) {
		WQ_Level = event;
		$(".KWG_Level").css({
			'background-color' : '#fad644'
		})
		$("#KWG_stage" + WQ_Level).css({
			'background-color' : '#ff5050'
		})

		// 카드를 제자리로 이동합니다
		$(".KingCardlist").css({
			"margin-left" : "0%"
		});
		cardloc = 0
		$(".prevBT").hide();
		for (var i = 0; i < 10; i++) {
			cardClick[i] == "ON";
			$("#QuizCard_" + i + ">.Card_Front").show();
			$("#QuizCard_" + i).css({
				'transform' : 'rotateY(0deg)'
			})
			$("#QuizCard_" + i + ">.Card_Back").hide();
		}

		// 랜덤 스테이지를 선택했을경우 카드에 변화를 줍니다
		if (WQ_Level == 6) {
			$(".L_KingWordLevel_info").text('랜덤퀴즈')
			$(".prevBT").hide();
			$(".nextBT").hide();
			$("#page_KingWordGameLobby .KWG_Card").css({
				'background' : '#888'
			})

		} else {
			$(".card_name").end()
			$(".Card_Back").end()
			$("#page_KingWordGameLobby .KWG_Card").css({
				'background' : '#fad644'
			})
			$(".L_KingWordLevel_info").text('Stage ' + WQ_Level)
			if (cardloc != 0) {
				$(".prevBT").show();
			}
			if (cardloc != 9) {
				$(".nextBT").show();
			}
		}
		location.href="/KingWordGameLobby/"+event
	}

	function click_quiz(cardnum) {
		// alert(cardnum)
		cardnum = parseInt(cardnum)
		// alert(cardClick[cardnum])

		if (cardClick[cardnum] == "OFF") {
			cardClick[cardnum] = "ON";
			$("#QuizCard_" + cardnum).css({
				'transform' : 'rotateY(0deg)'
			})
			setTimeout(Card_change, 150, "Front", cardnum);
		} else {
			cardClick[cardnum] = "OFF";
			$("#QuizCard_" + cardnum).css({
				'transform' : 'rotateY(180deg)'
			})
			setTimeout(Card_change, 150, "Back", cardnum);
		}
	}

	function Card_change(card, cardnum) {
		if (card == "Back") {
			$("#QuizCard_" + cardnum + ">.Card_Back").show();
			$("#QuizCard_" + cardnum + ">.Card_Front").hide();
		} else if (card == "Front") {
			$("#QuizCard_" + cardnum + ">.Card_Back").hide();
			$("#QuizCard_" + cardnum + ">.Card_Front").show();
		}
	}
	function card_Move(direction) {

		if (direction == "prev") {
			cardloc = cardloc - 1
			moveloc = cardloc * -100
			$(".KingCardlist").css({
				"margin-left" : moveloc + "%"
			});
		} else if (direction == "next") {
			cardloc = cardloc + 1
			moveloc = cardloc * -100
			$(".KingCardlist").css({
				"margin-left" : moveloc + "%"
			});
		}
		if (cardloc == 0) {
			$(".prevBT").hide();
		} else {
			$(".prevBT").show();
		}
		if (cardloc == 9) {
			$(".nextBT").hide();
			$("#gameStart").css({
				 'box-shadow' : '0vh 0vh 1vh #fff'
			})
		} else {
			$(".nextBT").show();
			$("#gameStart").css({
				 'box-shadow' : 'none'
			})
		}
	}
</script>

</head>

<body id="page_KingWordGameLobby" class="page_main page_normal"
	class="background">
	<div id="layer_background"></div>
	<div id="layer_control">
		<header class="page_main">
			<div class="L_headerbar"></div>
			<div class="C_headerbar">
				<div class="KingWordGameTitle">스테이지 선택</div>
			</div>
			<div class="R_headerbar visibilityhidden">
				<!-- <div class="UI login">
        </div> -->
		</header>
		<div class="viewBox">
			<div class="KingWordLevel">
				<div class="L_KingWordLevel">
					<div class="L_KingWordLevel_info">Stage-${words[0].stage_id }</div>
				</div>
				<div class="C_KingWordLevel">
					<div class="KingWordLevel_BT">
						<div class="KWG_line">
							<c:choose>
								<c:when test="${stageList[0].isLock eq '1' }">
									<button id="KWG_stage1" class="KWG_Level" value="1"
										onclick="KingWordGameLevel_click(this.value)">
										<div class="KWG_Levelno">1</div>
									</button>
								</c:when>
								<c:when test="${stageList[0].isLock eq '0' }">
									<button id="KWG_stage1" class="KWG_Level" value="1"
										onclick="KingWordGameLevel_click(this.value)">
										<div class="KWG_Levelno">1</div>
									</button>
								</c:when>
							</c:choose>

							<c:choose>
								<c:when test="${stageList[1].isLock eq '1' }">
									<button id="KWG_stage2" class="KWG_Level" value="2"
										onclick="KingWordGameLevel_click(this.value)">
										<div class="KWG_Levelno">2</div>
									</button>
								</c:when>
								<c:when test="${stageList[1].isLock eq '0' }">
									<button style="color: gray; border: 6px solid gray"
										id="KWG_stage2" class="KWG_Level" value="2">
										<div class="KWG_Levelno">2</div>
									</button>
								</c:when>
							</c:choose>

							<c:choose>
								<c:when test="${stageList[2].isLock eq '1' }">
									<button id="KWG_stage3" class="KWG_Level" value="3"
										onclick="KingWordGameLevel_click(this.value)">
										<div class="KWG_Levelno">3</div>
									</button>
								</c:when>
								<c:when test="${stageList[2].isLock eq '0' }">
									<button style="color: gray; border: 6px solid gray"
										id="KWG_stage3" class="KWG_Level" value="3">
										<div class="KWG_Levelno">3</div>
									</button>
								</c:when>
							</c:choose>
						</div>
						<div class="KWG_line">
							<c:choose>
								<c:when test="${stageList[3].isLock eq '1' }">
									<button id="KWG_stage4" class="KWG_Level" value="4"
										onclick="KingWordGameLevel_click(this.value)">
										<div class="KWG_Levelno">4</div>
									</button>
								</c:when>
								<c:when test="${stageList[3].isLock eq '0' }">
									<button style="color: gray; border: 6px solid gray"
										id="KWG_stage4" class="KWG_Level" value="4">
										<div class="KWG_Levelno">4</div>
									</button>
								</c:when>
							</c:choose>

							<c:choose>
								<c:when test="${stageList[4].isLock eq '1' }">
									<button id="KWG_stage5" class="KWG_Level" value="5"
										onclick="KingWordGameLevel_click(this.value)">
										<div class="KWG_Levelno">5</div>
									</button>
								</c:when>
								<c:when test="${stageList[4].isLock eq '0' }">
									<button style="color: gray; border: 6px solid gray"
										id="KWG_stage5" class="KWG_Level" value="5">
										<div class="KWG_Levelno">5</div>
									</button>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${stageList[5].isLock eq '1' }">
									<button id="KWG_stage6" class="KWG_Level" value="6"
										onclick="KingWordGameLevel_click(this.value)">
										<div class="KWG_Levelno">?</div>
									</button>
								</c:when>
								<c:when test="${stageList[5].isLock eq '0' }">
									<button style="color: gray; border: 6px solid gray"
										id="KWG_stage6" class="KWG_Level" value="6">
										<div class="KWG_Levelno">?</div>
									</button>
								</c:when>
							</c:choose>
						</div>

					</div>
					<div class="KingWordLevel_display"></div>
				</div>
				<div class="R_KingWordLevel"></div>
			</div>
			<div class="KingCardbox">
				<div class="aaa">
					<div class="prevBT" onclick="card_Move('prev');"><</div>
					<div class="nextBT" onclick="card_Move('next');">></div>
				</div>

				<div class="KingCardlist">

					<div class="KWG_Cardline">
						<div id="QuizCard_1" class="KWG_Card learning_quiz"
							onclick="click_quiz(1);">
							<div class="Card_Front">
								<div class="card_name">${words[0].justice }</div>
								<div class="card_number">1/10</div>
							</div>
							<div class="Card_Back">${words[0].mean }</div>
						</div>
						<div id="QuizCard_2" class="KWG_Card learning_quiz"
							onclick="click_quiz(2);">
							<div class="Card_Front">
								<div class="card_name">${words[1].justice }</div>
								<div class="card_number">2/10</div>
							</div>
							<div class="Card_Back">${words[1].mean }</div>
						</div>
						<div id="QuizCard_3" class="KWG_Card learning_quiz"
							onclick="click_quiz(3);">
							<div class="Card_Front">
								<div class="card_name">${words[2].justice }</div>
								<div class="card_number">3/10</div>
							</div>
							<div class="Card_Back">${words[2].mean }</div>
						</div>
						<div id="QuizCard_4" class="KWG_Card learning_quiz"
							onclick="click_quiz(4);">
							<div class="Card_Front">
								<div class="card_name">${words[3].justice }</div>
								<div class="card_number">4/10</div>
							</div>
							<div class="Card_Back">${words[3].mean }</div>
						</div>
						<div id="QuizCard_5" class="KWG_Card learning_quiz"
							onclick="click_quiz(5);">
							<div class="Card_Front">
								<div class="card_name">${words[4].justice }</div>
								<div class="card_number">5/10</div>
							</div>
							<div class="Card_Back">${words[4].mean }</div>
						</div>
						<div id="QuizCard_6" class="KWG_Card learning_quiz"
							onclick="click_quiz(6);">
							<div class="Card_Front">
								<div class="card_name">${words[5].justice }</div>
								<div class="card_number">6/10</div>
							</div>
							<div class="Card_Back">${words[5].mean }</div>
						</div>
						<div id="QuizCard_7" class="KWG_Card learning_quiz"
							onclick="click_quiz(7);">
							<div class="Card_Front">
								<div class="card_name">${words[6].justice }</div>
								<div class="card_number">7/10</div>
							</div>
							<div class="Card_Back">${words[6].mean }</div>
						</div>
						<div id="QuizCard_8" class="KWG_Card learning_quiz"
							onclick="click_quiz(8);">
							<div class="Card_Front">
								<div class="card_name">${words[7].justice }</div>
								<div class="card_number">8/10</div>
							</div>
							<div class="Card_Back">${words[7].mean }</div>
						</div>
						<div id="QuizCard_9" class="KWG_Card learning_quiz"
							onclick="click_quiz(9);">
							<div class="Card_Front">
								<div class="card_name">${words[8].justice }</div>
								<div class="card_number">9/10</div>
							</div>
							<div class="Card_Back">${words[8].mean }</div>
						</div>
						<div id="QuizCard_10" class="KWG_Card learning_quiz"
							onclick="click_quiz(10);">
							<div class="Card_Front">
								<div class="card_name">${words[9].justice }</div>
								<div class="card_number">10/10</div>
							</div>
							<div class="Card_Back">${words[9].mean }</div>
						</div>
					</div>

				</div>
			</div>
			<footer class="page_main KingWordGamefooter">
				<div class="KW_back KW_BTRstyle">
					<a href="/GameLobby">뒤로</a>
				</div>
				<div class="KW_BTNewStart KW_BTRstyle" id="gameStart">
					<a
						href="/KingWordGame/${words[0].stage_id }/0/${words[0].gameNum }">
						게임하기 </a>
				</div>
				<div class="visibilityhidden KW_BTRstyle">더미키</div>
			</footer>
		</div>
	</div>
	<div id="layer_modal"></div>
</body>

</html>
