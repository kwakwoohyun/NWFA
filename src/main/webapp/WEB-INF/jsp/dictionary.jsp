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

<script type="text/javascript">
	// alert(window.innerHeight);
	// alert(window.innerWidth);
</script>
</head>

<body id="page_personal" class="page_main page_normal"
	class="background">
	<header class="page_main">
		<div class="L_headerbar">
			<div id="mini_logo"></div>
		</div>
		<div class="C_headerbar">
			<div class="personal_titleBar">| 도전과제</div>
		</div>
		<div class="R_headerbar"></div>
	</header>
	<article class="page_main">
		<div class="Sort_BT_Bar">
			<div class="Sort_BT_all Sort_BT">전체</div>
			<div class="Sort_BT_NewWord Sort_BT">신조어업적</div>
			<div class="Sort_BT_game Sort_BT">게임업적</div>
			<div class="Sort_BT_ect Sort_BT">기타업적</div>
		</div>
		<div class="goal_contents">
			<div class="personal_sidemenu">
				<div class="rank personal_sidemenu_BT">랭킹</div>
				<div class="point personal_sidemenu_BT">점수</div>
				<div class="goal personal_sidemenu_BT">도전과제</div>
				<div class="set personal_sidemenu_BT">설정</div>
				<%
					String userID = null;
					if (session.getAttribute("userID") != null) {
						userID = (String) session.getAttribute("userID");
					}
					if (userID != null) {
				%>
				<div class="logout personal_sidemenu_BT">
					<a href="logout"> 로그아웃 </a>
				</div>
				<%
					} else {
				%>
				<div class="personal_sidemenu_BT">
					<a href="login"> 로그인 </a>
				</div>
				<%
					}
				%>
			</div>
			<div class="goal_main_contents"></div>

		</div>
	</article>
	<footer class="page_main">
		<footer class="page_main Userfooter">
			<div class="KW_back KW_BTstyle">
				<a class="button" href="index.html">뒤로</a>
			</div>
			<div class="KW_regame KW_BTstyle"></div>
			<div class="KW_Hint KW_BTstyle"></div>
		</footer>
	</footer>
</body>

</html>
