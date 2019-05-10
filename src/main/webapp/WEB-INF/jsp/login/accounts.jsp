<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="project.css">
<title>회원가입</title>
</head>
<body id="page_account" class="page_main page_normal" class="background">
  <header class="page_main">
    <div class="L_headerbar">
      <div id="mini_logo">
      </div>
    </div>
    <div class="C_headerbar">
      <div class="personal_titleBar">
        | 회원가입
      </div>
    </div>
    <div class="R_headerbar">

    </div>
  </header>
  <article class="page_main">
    <div class="account_main">
      <section class="account">
      
      <div class="container">
 <form method="post" action="userRegister" id="userRegister">
	 <div class="account_form">
        <label for="이메일">아이디</label>
        <input class="account_form_input" type="text" name="userID" id="userID" value="" placeholder="아이디를 입력하세요" maxLength="20">
      </div>
      <div class="account_form">
        <label for="이메일">비밀번호</label>
        <input class="account_form_input" type="password" name="userPassword1" id="userPassword1" value="" placeholder="비밀번호를 입력하세요" maxLength="20">
      </div>
      <div class="account_form">
        <label for="이메일">비밀번호 확인</label>
        <input class="account_form_input" type="password" name="userPassword2" id="userPassword2" value="" placeholder="비밀번호를 한번더 입력하세요" maxLength="20">
      </div>
      <div class="account_form">
        <label for="이메일">이름</label>
        <input class="account_form_input" type="text" name="userName" id="userName" value="" placeholder="이름을 입력하세요" maxLength="20">
      </div>
      <div class="account_form">
        <label for="이메일">나이 </label>
        <input class="account_form_input" type="text" name="userAge" id="userAge" value="" placeholder="나이를 입력하세요">
      </div>
      <div class="account_form">
        <label for="이메일">성별을 입력하세요</label>
        <div class="account_form_sex">
          남자
          <input type="radio" name="userGender" value="남자">
          여자
          <input type="radio" name="userGender" value="여자">
        </div>
      </div>
      <div class="account_form">
        <label for="이메일">이메일</label>
        <input class="account_form_input" type="text" name="userEmail" id="userEmail" value="" placeholder="이메일을 입력하세요" maxLength="30">
      </div>
		<div class="make_id"><a href="#"onclick="document.getElementById('userRegister').submit();">
        회원가입
      </a></div>
      <%
	  String messageContent = null;
	if(session.getAttribute("messageContent") != null){
		messageContent = (String) session.getAttribute("messageContent");
	}
	 String messageType = null;
		if(session.getAttribute("messageType") != null){
			messageType = (String) session.getAttribute("messageType");
		} 
			if(messageContent != null){
				if(messageContent == "회원가입에 성공했습니다."){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='login'");
					script.println("</script>");
				}
    %>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="이메일"><%= messageContent %></label>
	<%
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
			}
	%>
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
          어디서나 자신의 계정으로<br>
          게임하실 수 있습니다 <br>
        </div>
      </section>
    </div>
  </article>
   <footer class="page_main Userfooter">
    <div class="KW_back KW_BTstyle">
      <a href="index.jsp">뒤로</a>
    </div>
    <div class="KW_regame KW_BTstyle">

    </div>
    <div class="KW_Hint KW_BTstyle">

    </div>
  </footer> 
</body>
</html>