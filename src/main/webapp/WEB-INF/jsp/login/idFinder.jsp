<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
<meta charset="utf-8">
<title>메인페이지</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0" />
<link rel="stylesheet" href="project.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
	function mySubmit(index) {
		if (index == 1) {
			document.finder.action = './IDFinder';
		}
		if (index == 2) {
			document.finder.action = './PwFinder';
		}
		document.finder.submit();
	}

	// 모달창용
	function popup_remove() {
		$("#layer_modal .popup_Fail_email_window").css('top', '-20vh');
		$("#layer_modal .popup_Find_PW_window").css('top', '-20vh');
		$("#layer_modal .popup_Fail_email_window").css('visibility', 'visible');
		$("#layer_modal .popup_Find_PW_window").css('visibility', 'visible');
	}
	function popup_Fail_email() {
		$("#layer_modal .popup_Fail_email_window").css('top', '0vh');
		$("#layer_modal .popup_Fail_email_window").css('visibility', 'visible');
	}
	function popup_Find_PW() {
		$("#layer_modal .popup_Find_PW_window").css('top', '0vh');
		$("#layer_modal .popup_Find_PW_window").css('visibility', 'visible');
	}

	function popup_ID() {
		// 게임오버 팝업을 뛰우는 함수
		// $(".popup_IDfind").show().css('display', 'flex');
		$("#layer_control").css({
			'filter' : 'blur(15px)',
			'-webkit-filter' : 'blur(15px)',
			'-moz-filter' : 'blur(15px)',
			'-o-filter' : 'blur(15px)',
			'-ms-filter' : 'blur(15px)'
		});
		$(".popup_IDfind").css('top', '0vh');

	}
	function popup_IDundo() {
		// 게임오버 팝업을 뛰우는 함수
		// $(".popup_IDfind").show().css('display', 'flex');
		$("#layer_control").css({
			'filter' : 'blur(0px)',
			'-webkit-filter' : 'blur(0px)',
			'-moz-filter' : 'blur(0px)',
			'-o-filter' : 'blur(0px)',
			'-ms-filter' : 'blur(0px)'
		});
		$(".popup_IDfind").css('top', '-100vh');

	}

	var modal_case = 0;
	// modal_case = 0 정상
	// modal_case = 1 아이디찾기
	// modal_case = 2 비밀번호찾기
	// modal_case = -1 잘못된 이메일
	$(document).ready(function() {
		popup_remove()
		if (modal_case == 1) {
			popup_ID()
		} else if (modal_case == 2) {
			popup_Find_PW()
			setTimeout(popup_remove, 2000)
		} else if (modal_case == -1) {
			popup_Fail_email()
			setTimeout(popup_remove, 2000)
		}
	});
</script>
</head>

<body id="page_idfinder" class="page_main page_normal"
	class="background">
	<div id="layer_background">
		<div class="background_Login"></div>
	</div>
	<div id="layer_control">
		<header class="page_main">
			<%
				String userID = null;
				String messageContent = null;
				if (session.getAttribute("messageContent") != null) {
					messageContent = (String) session.getAttribute("messageContent");
				}
				String messageType = null;
				if (session.getAttribute("messageType") != null) {
					messageType = (String) session.getAttribute("messageType");
				}
				if (messageContent != null) {
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
				<div class="personal_titleBar">| 아이디찾기</div>
			</div>
			<div class="R_headerbar"></div>
		</header>
		<article class="page_main">
			<div class="login_main">
				<section class="login_page">
					<div class="login_Introduce">
						<div class="login_Introduce_text">
							아이디를 찾기 위해서 가입시 입력한 <br>이메일을 입력해주세요

						</div>
					</div>
					<div class="container">
						<form method="post" name="finder" action="./IDFinder"
							id="IDFinder">
							<div class="account_form">
								<label for="이메일">이메일</label> <input class="account_form_input"
									type="text" name="userEmail" value="" placeholder="이메일을 입력하세요">
							</div>
							<input type="button" class="IDfind" value="아이디 찾기"
								onclick='mySubmit(1)' /> <input type="button" class="PWfind"
								value="비밀번호 찾기" onclick='mySubmit(2)' />
						</form>
					</div>
				</section>
				<section class="intro">
					<div class="intro_text1">
						아이디&amp;비밀번호를 찾을수 있습니다.<br>
					</div>
					<div class="intro_text2">
						<span><mark>이메일 입력후 아이디 찾기</mark>를 누르시면 아이디를 찾을수 있습니다</span><br>
						<span>비밀번호를 잊어버리신경우 <mark>가입시 입력이메일을 입력후 </mark></span><br> <span>비밀번호발송을
							누르시면 해당 이메일로 임시비밀번호를 발송해드립니다. </span><br> <span>임시비밀번호로 <mark>로그인하신후에
								개인설정에서 비밀번호를 변경하실수</mark> 있습니다.
						</span>
					</div>
					<div class="intro_text3">
						이메일은 가입시에 등록하신<br> 이메일을 적어주셔야 합니다.<br>
					</div>
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
		<div class="popup_find">
			<!--[정인국] 아이디찾기  -->
			<div class="popup_IDfind">
				<div class="popup_IDfind_Text">아이디를 찾았습니다!</div>
				<div class="popup_IDfind_ID" id="MYID"><%=messageContent%></div>
				<div class="popup_IDfind_exit" id="Moveexit"
					onclick="popup_IDundo();">창닫기</div>
			</div>
			<!--[정인국] 아이디가 존재하지 않는 경우  -->
			<div class="popup_Fail_email">
				<div class="popup_Fail_email_window"><%=messageContent%></div>
			</div>
			<!--[정인국] 비밀번호 발송 -->
			<div class="popup_Find_PW">
				<div class="popup_Find_PW_window"><%=messageContent%></div>
			</div>
		</div>
	</div>
</body>

</html>
