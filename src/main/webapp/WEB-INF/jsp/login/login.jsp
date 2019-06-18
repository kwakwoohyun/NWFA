<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="project.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
	history.pushState(null, null, location.href);
	window.onpopstate = function(event) {
		history.go(1);
	};
	function popup_remove() {
		$("#layer_modal .popup_Fail_ID_window").css('top', '-20vh');
		$("#layer_modal .popup_Fail_PW_window").css('top', '-20vh');
		$("#layer_modal .popup_Fail_ID_window").css('visibility', 'visible');
		$("#layer_modal .popup_Fail_PW_window").css('visibility', 'visible');
	}
	function popup_Fail_ID() {
		$("#layer_modal .popup_Fail_ID_window").css('top', '0vh');
		$("#layer_modal .popup_Fail_ID_window").css('visibility', 'visible');
	}

	$(document).ready(function() {
		$("#layer_modal .popup_Fail_ID_window").css('top', '0vh');
		// $("#layer_modal .popup_Fail_PW_window").css('top', '0vh');
		setTimeout(popup_remove, 2000)
	});
	var modal_case = 0;
	// modal_case = 0 정상
	// modal_case = 1 아이디 오류
	// modal_case = 2 비밀번호 오류
	$(document).ready(function() {
		popup_remove()
		if (modal_case == 1) {
			popup_Fail_ID()
		} else if (modal_case == -1) {
			popup_Fail_ID()
			setTimeout(popup_remove, 2000)
		}
	});
</script>
</head>
<body id="page_Login" class="page_main page_normal" class="background">
	<div id="layer_background">
		<div class="background_Login"></div>
	</div>
	<div id="layer_control">
		<header class="page_main">
			<%
				String userID = request.getParameter("userID");
				String messageContent = null;
				if (session.getAttribute("messageContent") != null) {
					messageContent = (String) session.getAttribute("messageContent");
				}
				String messageType = null;
				if (session.getAttribute("messageType") != null) {
					messageType = (String) session.getAttribute("messageType");
				}
				if (messageContent != null) {
					if (messageContent == "로그인에 성공했습니다.") {
						userID = (String) session.getAttribute("userID");
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href = '/'");
						script.println("</script>");
					}
			%>
			<label for="이메일"><script>
				modal_case =
			<%=messageType%>
				
			</script> </label>

			<%
				session.removeAttribute("messageContent");
					session.removeAttribute("messageType");
				}
			%>
			<div class="L_headerbar">
				<div id="mini_logo"></div>
			</div>
			<div class="C_headerbar">
				<div class="personal_titleBar">| 로그인</div>
			</div>
			<div class="R_headerbar"></div>
		</header>
		<article class="page_main">
			<div class="login_main">
				<section class="login_page">
					<div class="login_Introduce">
						<div class="login_Introduce_text">
							세대공감! 퀴즈게임 모두의 신조어에<br> 다시오신것을 환영합니다.
						</div>
					</div>
					<div class="container">
						<form method="post" action="./userlogin" id="userlogin">
							<div class="account_form">
								<label for="이메일">아이디</label> <input class="account_form_input"
									type="text" name="userID" value="" placeholder="아이디를 입력하세요">
							</div>
							<div class="account_form">
								<label for="이메일">비밀번호</label> <input class="account_form_input"
									type="password" name="userPassword" value=""
									placeholder="비밀번호를 입력하세요">
							</div>
							<div class="find_id">
								<!-- [정인국] 여기다가 회원가입 이동 링크 넣기 이창은 모바일화면에서만 보임 -->
								<div id="mini_account" onclick="location.href='accounts'">
									회원가입</div>
								<!-- [정인국] 여기다가 아이디찾기 이동 링크 넣기 이창은 모바일화면에서만 보임 -->
								<div id="mini_accountfind" onclick="location.href='idFinder'">아이디/비밀번호
									찾기</div>
							</div>
							<div class="login_id">
								<a href="#"
									onclick="document.getElementById('userlogin').submit();">
									로그인 </a>
							</div>
						</form>
					</div>
				</section>
				<section class="intro">
					<div class="intro_text1">
						회원이 아니라고요?<br> 회원으로 무료로 가입하세요
					</div>
					<div class="intro_text2">
						세대공감 퀴즈게임 모두의 신조어에 가입하세요.<br> 자신의 점수와 랭킹을 볼 수 있습니다.<br>
						더 쉽고 가족과 가까이 대화할 수 있습니다.<br>
					</div>
					<div class="intro_text3">
						단 1분만에<br> 간단하게 가입 하실 수 있습니다<br> 어디서나 자신의 게정으로<br>
						게임하실 수 있습니다 <br>
					</div>
					<!-- [정인국] 회원가입하기 -->
					<div id="big_account" onclick="location.href='accounts'">
						회원가입</div>
				</section>
			</div>
		</article>
		<footer class="page_main Userfooter">
			<div class="KW_back KW_BTstyle">
				<a href="/">뒤로</a>
			</div>
			<div class="visibilityhidden KW_BTstyle"></div>
			<div class="visibilityhidden KW_BTstyle"></div>
		</footer>
	</div>
	<div id="layer_modal">
		<!--[정인국] 아이디가 존재하지 않는 경우  -->
		<div class="popup_Fail_ID">
			<div class="popup_Fail_ID_window"><%=messageContent%></div>
		</div>
		<!--[정인국] 비밀번호가 존재하지 않는 경우  -->
		<div class="popup_Fail_PW">
			<div class="popup_Fail_PW_window"><%=messageContent%></div>
		</div>
	</div>
</body>
</html>