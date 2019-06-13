<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta charset="utf-8">
<title>💬</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0" />
<link rel="stylesheet" href="project.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body id="page_TalkLobby">
	<div id="layer_background">
		<div id="TalkLobby_background">
			<!-- 배경색 #ff5050-->
		</div>
	</div>
	<div id="layer_control">
		<header class="page_main">
			<div class="L_headerbar">
				<img src="icon/Talkicon1.png">
			</div>
			<div class="C_headerbar">스테이지 선택</div>
			<div class="R_headerbar">
				<div class="login" onclick="location.href='/personal'">
					<!-- <object type="image/svg+xml" data="icon/user.svg"></object> -->
				</div>
			</div>
		</header>
		<div class="Talk_Content">
			<div class="Talk_Stage_line">
				<div class="Talk_Stage_Left">
					<!-- 왼쪽 -->
					<div class="Talk_img">
						<img src="icon/talk_stage1.png">
					</div>
					<div class="Talk_text">
						<div class="Talk_name">302호 친구</div>
						<div class="Talk_info">스테이지1</div>
					</div>
				</div>
				<div class="Talk_Stage_Right">
					<!-- 오른쪽 -->
					<div class="Talk_gamestart" onclick="location.href='/TalkGame/3/1'">게임시작</div>
				</div>
			</div>
			<div class="Talk_Stage_line">
				<div class="Talk_Stage_Left">
					<!-- 왼쪽 -->
					<div class="Talk_img">
						<img src="icon/talk_stage2.png">
					</div>
					<div class="Talk_text">
						<div class="Talk_name">같은 반 친구</div>
						<div class="Talk_info">스테이지2</div>
					</div>
				</div>
				<div class="Talk_Stage_Right">
					<!-- 오른쪽 -->
					<div class="Talk_gamestart" onclick="location.href='/TalkGame/3/2'">게임시작</div>
				</div>
			</div>
			<div class="Talk_Stage_line">
				<div class="Talk_Stage_Left">
					<!-- 왼쪽 -->
					<div class="Talk_img">
						<img src="icon/talk_stage3.jpg">
					</div>
					<div class="Talk_text">
						<div class="Talk_name">중학생 아들</div>
						<div class="Talk_info">스테이지3</div>
					</div>
				</div>
				<div class="Talk_Stage_Right">
					<!-- 오른쪽 -->
					<div class="Talk_gamestart" onclick="location.href='/TalkGame/3/3'">게임시작</div>
				</div>
			</div>
			<div class="Talk_Stage_line">
				<div class="Talk_Stage_Left">
					<!-- 왼쪽 -->
					<div class="Talk_img">
						<img src="icon/talk_stage4.png">
					</div>
					<div class="Talk_text">
						<div class="Talk_name">딸(중학생)</div>
						<div class="Talk_info">스테이지4</div>
					</div>
				</div>
				<div class="Talk_Stage_Right">
					<!-- 오른쪽 -->
					<div class="Talk_gamestart">게임시작</div>
				</div>
			</div>
			<div class="Talk_Stage_line">
				<div class="Talk_Stage_Left">
					<!-- 왼쪽 -->
					<div class="Talk_img">
						<img src="icon/talk_stage5.png">
					</div>
					<div class="Talk_text">
						<div class="Talk_name">막내아들(초등학생)</div>
						<div class="Talk_info">스테이지5</div>
					</div>
				</div>
				<div class="Talk_Stage_Right">
					<!-- 오른쪽 -->
					<div class="Talk_gamestart">게임시작</div>
				</div>
			</div>
		</div>
		<footer class="page_main KingWordGamefooter">
			<div class="WQ_back TALK_BTstyle" onclick="location.href='GameLobby'">
			</div>
			<div class="visibilityhidden TALK_BTstyle">게임시작</div>
			<div class="visibilityhidden TALK_BTstyle"></div>
		</footer>
	</div>
	<div id="layer_modal"></div>
</body>
</html>
