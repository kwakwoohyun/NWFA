<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta charset="utf-8">
<title>메인페이지</title>
<meta name="viewport" content="width=device-width initial-scale=1.0" />
<link rel="stylesheet" href="project.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
	function popup_remove() {
		$("#layer_modal .popup_ID_window").css('top', '-10vh');
	}

	$(document).ready(function() {
		$("#layer_modal .popup_ID_window").css('top', '0vh');
		setTimeout(popup_remove, 2000)
	});
</script>
</head>
<body id="page_main" class="page_main" class="background">

	<div id="layer_background"></div>
	<div id="layer_control">

		<header class="page_main">
			<div class="L_headerbar"></div>
			<div class="C_headerbar"></div>
			<div class="R_headerbar">
				<%
					String login = (String) session.getAttribute("userID");
					if (login == null) {
				%>
				<div class="UI login" onclick="location.href='login'">
					<!-- <object type="image/svg+xml" data="icon/user.svg"></object> -->
				</div>
				<%
					} else {
				%>
				<div class="UI login" onclick="location.href='personal'"></div>
				<%
					}
				%>
			</div>
		</header>
		<article class="page_main">
			<div id="mainpage_logo"></div>
			<%
				if (login == null) {
			%>
			<div class="UI UI_bt" onclick="location.href='login'"
				data-transition="flip">게임</div>
			<%
				} else {
			%>
			<div class="UI UI_bt" onclick="location.href='GameLobby'"
				data-transition="flip">게임</div>
			<%
				}
			%>
			<div class="UI UI_bt" onclick="location.href='dictionary/1'"
				data-transition="flip">사전</div>
		</article>
	</div>
	<div id="layer_modal">
		<%
			String userID = null;
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			}
			if (userID != null) {
		%>
		<div class="popup_ID">
			<div class="popup_ID_window">
				<%=userID%>님, 환영합니다.
			</div>
		</div>
		<%
			} else {
		%>
		<div class="popup_ID">
			<div class="popup_ID_window">로그인을 해주세요 +_+</div>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>