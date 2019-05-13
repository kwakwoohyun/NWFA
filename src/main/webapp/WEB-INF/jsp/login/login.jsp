<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="project.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body id="page_account" class="page_main page_normal" class="background">
	<header class="page_main">
    <div class="L_headerbar">
      <div id="mini_logo">
      </div>
    </div>
    <div class="C_headerbar">
      <div class="personal_titleBar">
        | 로그인
      </div>
    </div>
    <div class="R_headerbar">

    </div>
  </header>
  <article class="page_main">
    <div class="login_main">
      <section class="login_page">
      <div class="login_Introduce">
        세대공감! 퀴즈게임 모두의 신조어에<br>
        다시오신것을 환영합니다.
      </div>
	<div class="container">
				<form method="post" action="loginAction" id="loginAction">
					<div class="account_form">
        <label for="이메일">아이디</label>
        <input class="account_form_input" type="text" name="userID" value="" placeholder="아이디를 입력하세요">
      </div>
      <div class="account_form">
        <label for="이메일">비밀번호</label>
        <input class="account_form_input" type="password" name="userPassword" value="" placeholder="비밀번호를 입력하세요">
      </div>
      <div class="find_id">
        <a href="accounts">회원가입</a>
        <a href="#">아이디찾기</a>
      </div>
      <div class="login_id"><a href="#"onclick="document.getElementById('loginAction').submit();">
				        로그인
				      </a></div>
				</form>
			</div>
	</section>
      <section class="intro">
        <div class="">
        회원이 아니라고요?<br>
        회원으로 무료로 가입하세요
        </div>
        <div class="">
          세대공감 퀴즈게임 모두의 신조어에 가입하세요.<br>
          자신의 점수와 랭킹을 볼 수 있습니다.<br>
          더 쉽고 가족과 가까이 대화할 수 있습니다.<br>
        </div>
        <div class="">
          단 1분만에<br>
          간단하게 가입 하실 수 있습니다<br>
          어디서나 자신의 게정으로<br>
          게임하실 수 있습니다 <br>
        </div>
      </section>
    </div>
  </article>
  <footer class="page_main Userfooter">
    <div class="KW_back KW_BTstyle">
      <a href="/">뒤로</a>
    </div>
    <div class="KW_regame KW_BTstyle">

    </div>
    <div class="KW_Hint KW_BTstyle">

    </div>
  </footer>

</body>
</html>