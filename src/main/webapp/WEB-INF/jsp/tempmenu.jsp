<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
<meta charset="utf-8">
<title>메인페이지</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0" />
<link rel="stylesheet" href="/project.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<script type="text/javascript">
	history.pushState(null, null, location.href);
	window.onpopstate = function(event) {
		history.go(1);
	};
	var cardClick = new Array();
	var cardloc = 0;
</script>
</head>

<body id="tmep" class="page_main page_normal" class="background">
	<header class="page_main">
		<div class="L_headerbar">
			<div id="mini_logo"></div>
		</div>
		<div class="C_headerbar">
			<div class="personal_titleBar">| 관리자메뉴</div>
		</div>
		<div class="R_headerbar"></div>
	</header>
	<article class="page_main flex">
		<div class="">
			<h1>프론트/로비</h1>
			<a class="Sort_BT_game Sort_BT" href="/">★프론트</a> <a
				class="Sort_BT_game Sort_BT" href="#">게임로비</a> <a
				class="Sort_BT_game Sort_BT" href="#">사전</a>
			<h1>로그인회원가입</h1>
			<a class="Sort_BT_game Sort_BT" href="login">★로그인</a> <a
				class="Sort_BT_game Sort_BT" href="accounts">★회원가입</a>
			<h1>사용자메뉴</h1>
			<a class="Sort_BT_game Sort_BT" href="#">랭킹</a> <a
				class="Sort_BT_game Sort_BT" href="#">점수</a> <a
				class="Sort_BT_game Sort_BT" href="personal">★업적</a> <a
				class="Sort_BT_game Sort_BT" href="#">설정</a>
		</div>
		<div class="">
			<h1>게임1</h1>
			<a class="Sort_BT_game Sort_BT" href="#">난이도선택</a> <a
				class="Sort_BT_game Sort_BT" href="KingWordGame">★인게임</a>
			<h1>게임2</h1>
			<a class="Sort_BT_game Sort_BT" href="#">난이도선택</a> <a
				class="Sort_BT_game Sort_BT" href="YaminGame">★인게임</a>
			<h1>게임3</h1>
			<a class="Sort_BT_game Sort_BT" href="#">난이도선택</a> <a
				class="Sort_BT_game Sort_BT" href="#">인게임</a>
		</div>

	</article>
	<footer class="page_main KingWordGamefooter"> </footer>
</body>

</html>
