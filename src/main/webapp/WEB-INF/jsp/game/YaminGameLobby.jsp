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
	var WQ_Level = 0;
	var cardloc = 0;

	$(document).ready(function() {
		$("#WQ_Level1").css({
			'border-color' : '#ff69b2'
		})
		$(".prevBT").hide(); // 맨 처음 카드를 화면에 보여줄때 이전으로 가기 버튼을 비활성화 시킴
	});

	function WordQuizLevel_click(event) {
		WQ_Level = event
		// 초기화
		$(".WQ_list").css({
			"margin-left" : "0%"
		});
		cardloc = 0;
		$(".prevBT").hide();
		$(".nextBT").show();
		for (var i = 1; i < 6; i++) {
			if (cardloc + 1 == i) {
				// alert(cardloc+1)
				$("#QuizCard_" + (i)).css({
					"opacity" : "1"
				});
			} else {
				$("#QuizCard_" + (i)).css({
					"opacity" : "0.3"
				});
			}
		}

		$(".WQ_Level").css({
			'border-color' : '#ffffff'
		})
		$(".WQ_Level").css({
			'color' : '#ffffff'
		})

		if (WQ_Level == 1) {
			$("#WQ_Level1").css({
				'border-color' : '#ff69b2'
			})
			$("#WQ_Level1").css({
				'color' : '#ff69b2'
			})
		} else if (WQ_Level == 2) {
			$("#WQ_Level2").css({
				'border-color' : '#ff69b2'
			})
			$("#WQ_Level2").css({
				'color' : '#ff69b2'
			})
		} else if (WQ_Level == 3) {
			$("#WQ_Level3").css({
				'border-color' : '#ff69b2'
			})
			$("#WQ_Level3").css({
				'color' : '#ff69b2'
			})
		}
		$(".blackboard_Level_text").text('Stage ' + (WQ_Level))
		// $(".GameRank").text(ranking[gameNo]+'위')
	}

	function card_Move(direction) {

		if (direction == "prev") {
			cardloc = cardloc - 1
			moveloc = cardloc * -100
			for (var i = 1; i < 6; i++) {
				if (cardloc + 1 == i) {
					// alert(cardloc+1)
					$("#QuizCard_" + (i)).css({
						"opacity" : "1"
					});
				} else {
					$("#QuizCard_" + (i)).css({
						"opacity" : "0.3"
					});
				}
			}
			$(".WQ_list").css({
				"margin-left" : moveloc + "%"
			});
		} else if (direction == "next") {
			cardloc = cardloc + 1
			moveloc = cardloc * -100
			for (var i = 1; i < 6; i++) {
				if (cardloc + 1 == i) {
					// alert(cardloc+1)
					$("#QuizCard_" + (i)).css({
						"opacity" : "1"
					});
				} else {
					$("#QuizCard_" + (i)).css({
						"opacity" : "0"
					});
				}
			}
			$(".WQ_list").css({
				"margin-left" : moveloc + "%"
			});
		}
		if (cardloc == 0) {
			$(".prevBT").hide();
		} else {
			$(".prevBT").show();
		}
		if (cardloc == 4) {
			$(".nextBT").hide();
		} else {
			$(".nextBT").show();
		}
	}
</script>
</head>

<body id="page_ChallengeQuizgameLobby" class="page_ChallengeQuiz">
	<div id="layer_background">
		<div class="background_ChallengeQuiz"></div>
	</div>
	<div id="layer_control">
		<header class="page_main">
			<div class="L_headerbar"></div>
			<div class="C_headerbar">
				<div class="WordQuizTitle">스테이지 선택</div>
			</div>
			<div class="R_headerbar">
				<div class="UI login"></div>
			</div>
		</header>
		<div class="viewBox">

			<div class="DisplayBox">
				<div class="quiz">

					<div class="blackboard">

						<div class="blackboard_Level">
							<div class="blackboard_Level_text">Stage 1</div>
							<div>
								<button id="WQ_Level1" class="WQ_Level" value="1"
									onclick="WordQuizLevel_click(this.value)">
									<div class="WQ_Levelno">1</div>
								</button>

								<button id="WQ_Level2" class="WQ_Level" value="2"
									onclick="WordQuizLevel_click(this.value)">
									<div class="WQ_Levelno">2</div>
								</button>

								<button id="WQ_Level3" class="WQ_Level" value="3"
									onclick="WordQuizLevel_click(this.value)">
									<div class="WQ_Levelno">3</div>
								</button>
							</div>

						</div>
						<div class="blackboard_Cardbox">
							<div class="aaa">
								<div class="prevBT" onclick="card_Move('prev');"><</div>
								<div class="nextBT" onclick="card_Move('next');">></div>
							</div>
							<div class="WQ_list">
								<div class="WQ_Cardline"
									style="text-align: center; margin: 0 auto;">
									<div id="QuizCard_1" class="WQ_Card learning_quiz"
										onclick="click_quiz(1);">

										<div class="Card_top">
											<div class="card_name"
												style="text-align: center; margin: 2% auto;">
												<img src="/icon/WQ${word[0].img }.gif">
											</div>
											<div class="card_number">1/5</div>
										</div>
										<div class="Card_bottom">
											<br> ${word[0].justice} = ${word[0].answer} <br>
											${word[0].mean}
										</div>
									</div>
									<div id="QuizCard_2" class="WQ_Card learning_quiz"
										onclick="click_quiz(1);">
										<div class="Card_top">
											<div class="card_name"
												style="text-align: center; margin: 2% auto;">
												<img src="/icon/WQ${word[1].img }.gif">
											</div>
											<div class="card_number">2/5</div>
										</div>
										<div class="Card_bottom">
											<br> ${word[1].justice} = ${word[1].answer} <br>
											${word[1].mean}
										</div>
									</div>
									<div id="QuizCard_3" class="WQ_Card learning_quiz"
										onclick="click_quiz(1);">
										<div class="Card_top">
											<div class="card_name"
												style="text-align: center; margin: 2% auto;">
												<img src="/icon/WQ${word[2].img }.gif">
											</div>
											<div class="card_number">3/5</div>
										</div>
										<div class="Card_bottom">
											<br> ${word[2].justice} = ${word[2].answer} <br>
											${word[2].mean}
										</div>
									</div>
									<div id="QuizCard_4" class="WQ_Card learning_quiz"
										onclick="click_quiz(1);">
										<div class="Card_top">
										<div class="card_name"
												style="text-align: center; margin: 2% auto;">
												<img src="/icon/WQ${word[3].img }.gif">
											</div>
											<div class="card_number">4/5</div>
										</div>
										<div class="Card_bottom">
											<br> ${word[3].justice} = ${word[3].answer} <br>
											${word[3].mean}
										</div>
									</div>
									<div id="QuizCard_5" class="WQ_Card learning_quiz"
										onclick="click_quiz(1);">
										<div class="Card_top">
									<div class="card_name"
												style="text-align: center; margin: 2% auto;">
												<img src="/icon/WQ${word[4].img }.gif">
											</div>
											<div class="card_number">5/5</div>
										</div>
										<div class="Card_bottom">
											<br> ${word[4].justice} = ${word[4].answer} <br>
											${word[4].mean}
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="/blackboard_img">
							<img src="/icon/chalk.png">
						</div>

					</div>

				</div>
				<footer class="page_main KingWordGamefooter">
					<div class="WQ_back CQ_BTstyle">
						<a href="mainLobby.html">뒤로</a>
					</div>
					<div class="WQ_BTNewStart CQ_BTstyle"><a href="/YaminGame/${yaminStageId}/${gameNum}/1">게임시작</a></div>
					<div class="visibilityhidden CQ_BTstyle">
				</footer>
			</div>
		</div>
		<div id="layer_modal"></div>
</body>

</html>
