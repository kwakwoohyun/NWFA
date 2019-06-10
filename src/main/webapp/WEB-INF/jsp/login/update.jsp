<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.skhu.NWFA.user.userDao.UserDAO"%>
<%@ page import="com.skhu.NWFA.user.userModel.UserDTO"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	UserDTO user = new UserDAO().getUser(userID);
%>
<head>
<meta name="viewport" content="width=device-width; initial-scale=1.0" />
<link rel="stylesheet" href="project.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
	function popup_remove() {
		$("#layer_modal .popup_Change_Success_window").css('top', '-20vh');
		$("#layer_modal .popup_Change_Fail_window").css('top', '-20vh');
		$("#layer_modal .popup_Change_Success_window").css('visibility',
				'visible');
		$("#layer_modal .popup_Change_Fail_window")
				.css('visibility', 'visible');
	}
	function popup_Change_Success() {
		$("#layer_modal .popup_Change_Success_window").css('top', '0vh');
		$("#layer_modal .popup_Change_Success_window").css('visibility',
				'visible');
	}
	function popup_Change_Fail() {
		$("#layer_modal .popup_Change_Fail_window").css('top', '0vh');
		$("#layer_modal .popup_Change_Fail_window")
				.css('visibility', 'visible');
	}

	var modal_case = 0;
	// modal_case = 1 정상
	// modal_case = -1 실패
	$(document).ready(function() {
		popup_remove()
		if (modal_case == 1) {
			popup_Change_Success()
		} else if (modal_case == -1) {
			popup_Change_Fail()
			setTimeout(popup_remove, 2000)
		}
	});
</script>
</head>

<body id="page_pwchange" class="page_main page_normal"
	class="background">
	<div id="layer_background">
		<div class="background_Login">
			<%
				String messageContent = null;
				if (session.getAttribute("messageContent") != null) {
					messageContent = (String) session.getAttribute("messageContent");
				}
				String messageType = null;
				if (session.getAttribute("messageType") != null) {
					messageType = (String) session.getAttribute("messageType");
				}
				if (messageContent != null) {
					if (messageContent == "비밀번호 변경에 성공했습니다.") {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href = '/'");
						script.println("</script>");
					}
			%>
			<label for="이메일"><script>
				modal_case =
			<%=messageType%></script></label>
			<%
				session.removeAttribute("messageContent");
					session.removeAttribute("messageType");
				}
			%>
			<%
				if (userID == null) { //userID가 없는데 들어올 경우 로그인 페이지로
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('접근할 수 없습니다.')");
					script.println("location.href = 'login'");
					script.println("</script>");
				}
			%>

		</div>
	</div>
	<div id="layer_control">
		<header class="page_main">
			<div class="L_headerbar">
				<div id="mini_logo"></div>
			</div>
			<div class="C_headerbar">
				<div class="personal_titleBar">| 비밀번호 변경</div>
			</div>
			<div class="R_headerbar"></div>
		</header>
		<article class="page_main">
			<div class="login_main">
				<section class="login_page">
					<div class="login_Introduce">
						<div class="login_Introduce_text">
							비밀번호를 변경하기 위해서는<br> 현 비밀번호와 아이디를 입력하시고<br> 새 비밀번호 입력후
							버튼을 눌러주세요
						</div>
					</div>
					<div class="container">
						<form method="post" action="userupdate" id="userupdate">
							<div class="account_form">
								<!-- userID를 숨겨놓음. <div>userID</div>를 지울 경우 update메소드에서 ~where userID=? 부분에 비밀번호가 들어가면서 데이터베이스 오류남 -->
								<input class="account_form_input" style="opacity: 0" type="text"
									name="userID" value="<%=user.getUserID()%>">
							</div>
							<!--<div class="account_form">
                <label for="이메일">비밀번호</label>
                <input class="account_form_input" type="password" name="userPassword" value="" placeholder="비밀번호를 입력하세요">
              </div> -->
							<div class="account_form2">
								<label for="이메일">변경할<br>비밀번호
								</label> <input class="account_form_input" type="password"
									name="userPassword1" value="" placeholder="비밀번호를 입력하세요">
							</div>
							<div class="account_form2">
								<label for="이메일">변경할<br>비밀번호확인
								</label> <input class="account_form_input" type="password"
									name="userPassword2" value="" placeholder="비밀번호를 입력하세요">
							</div>
							<div class="login_id">
								<a href="#"
									onclick="document.getElementById('userupdate').submit();">
									비밀번호 변경 </a>
							</div>
						</form>
					</div>
				</section>
				<section class="intro">
					<div class="intro_text1">
						비밀번호를 이곳에서 변경할수 있습니다<br>
					</div>
					<div class="intro_text2">
						<span>먼저 지금 사용중인 아이디와 비밀번호를 입력해주세요</span><br> <span>만약
							임시비밀번호 사용중이면 임시비밀번호를 입력해주세요</span><br> <span>변경할 비밀번호를 신중하게
							입력해주세요</span><br> <span>비밀번호 확인을 위해 다시한번 입력해주세요</span>
					</div>
					<div class="intro_text3">
						비밀번호는 신중하게<br> 변경해주시기 바랍니다.<br>
					</div>
				</section>
			</div>
		</article>
		<footer class="page_main Userfooter">
			<div class="KW_back KW_BTstyle">
				<a href="personal">뒤로</a>
			</div>
			<div class="visibilityhidden KW_BTstyle"></div>
			<div class="visibilityhidden KW_BTstyle"></div>
		</footer>

	</div>
	<div id="layer_modal">
		<!--[정인국] 아이디가 존재하지 않는 경우  -->
		<div class="popup_Change_Success">
			<div class="popup_Change_Success_window">
				<%=messageContent%>
			</div>
		</div>
		<!--[정인국] 비밀번호가 존재하지 않는 경우  -->
		<div class="popup_Change_Fail">
			<div class="popup_Change_Fail_window">
				<%=messageContent%>
			</div>
		</div>
	</div>
</body>

</html>