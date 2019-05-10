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

<!-- J쿼리 -->
<!-- <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script> -->

<script type="text/javascript">
	// alert(window.innerHeight);
	// alert(window.innerWidth);
</script>
</head>
<body id="page_main" class="page_main" class="background">
	<header class="page_main">
		<div class="L_headerbar"></div>
		<div class="C_headerbar"></div>
		<div class="R_headerbar">
			<%
				String userID = null;
				if (session.getAttribute("userID") != null) {
					userID = (String) session.getAttribute("userID");
				}
				if (userID != null) {
			%>
			<label><%=userID%>님, 환영합니다.</label>
			<%
				} else {
			%>
			<div class="UI login" onclick="location.href='tmepmenu'">
				<!-- <object type="image/svg+xml" data="icon/user.svg"></object> -->
			</div>
			<%
				}
			%>
		</div>
	</header>
	<article class="page_main">
		<div id="mainpage_logo"></div>
		<div class="UI UI_bt" onclick="location.href='KingWordGameLobby'"
			data-transition="flip">게임</div>
		<div class="UI UI_bt" onclick="location.href='dictionary'"
			data-transition="flip">사전</div>
	</article>
	<footer class="page_main flex justify align-end">
		<div class="UI mini_bt justify align-end"
			onclick="location.href='dictionary'" data-transition="flip">종료</div>
		<div class="UI mini_bt justify align-end"
			onclick="location.href='dictionary'" data-transition="flip">사전</div>

	</footer>
</body>
</html>
