<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ page import="java.io.PrintWriter" %>
   <%@ page import="com.skhu.NWFA.user.userDao.UserDAO" %>
   <%@ page import="com.skhu.NWFA.user.userModel.UserDTO" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<%
   String userID = null;
   if(session.getAttribute("userID") != null){
      userID = (String) session.getAttribute("userID");
   }
   UserDTO user = new UserDAO().getUser(userID);
%>
<head>
  <meta charset="utf-8">
  <title>메인페이지</title>
  <meta name="viewport" content="width=device-width; initial-scale=1.0" />
  <link rel="stylesheet" href="project.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script type="text/javascript">
    function popup_remove() {
      $("#layer_modal .popup_Fail_ID_window").css('top', '-20vh');
      $("#layer_modal .popup_Fail_PW_window").css('top', '-20vh');
      $("#layer_modal .popup_Fail_PW_window").css('visibility', 'visible');
      $("#layer_modal .popup_Fail_PW_window").css('visibility', 'visible');
    }
    function popup_Fail_ID() {
      $("#layer_modal .popup_Fail_ID_window").css('top', '0vh');
      $("#layer_modal .popup_Fail_ID_window").css('visibility', 'visible');
    }
    function popup_Fail_PW() {
      $("#layer_modal .popup_Fail_PW_window").css('top', '0vh');
      $("#layer_modal .popup_Fail_PW_window").css('visibility', 'visible');
    }

    $(document).ready(function() {
      $("#layer_modal .popup_Fail_ID_window").css('top', '0vh');
      // $("#layer_modal .popup_Fail_PW_window").css('top', '0vh');
      setTimeout(popup_remove, 2000)
    });
  </script>
</head>

<body id="page_pwchange" class="page_main page_normal" class="background">
  <div id="layer_background">
    <div class="background_Login">

    </div>
  </div>
  <div id="layer_control">
    <header class="page_main">
      <div class="L_headerbar">
        <div id="mini_logo">
        </div>
      </div>
      <div class="C_headerbar">
        <div class="personal_titleBar">
          | 비밀번호 변경
        </div>
      </div>
      <div class="R_headerbar">

      </div>
    </header>
    <article class="page_main">
      <div class="login_main">
        <section class="login_page">
          <div class="login_Introduce">
            <div class="login_Introduce_text">
              비밀번호를 변경하기 위해서는<br>
              현 비밀번호와 아이디를 입력하시고<br>
              새 비밀번호 입력후 버튼을 눌러주세요
            </div>
          </div>
          <div class="container">
            <form method="post" action="./userUpdate" id="userUpdate">
              <div class="account_form">
                <input class="account_form_input" style="opacity:0" type="text" name="userID" value="<%= user.getUserID() %>">
              </div>
              <!--<div class="account_form">
                <label for="이메일">비밀번호</label>
                <input class="account_form_input" type="password" name="userPassword" value="" placeholder="비밀번호를 입력하세요">
              </div> -->
              <div class="account_form2">
                <label for="이메일">변경할<br>비밀번호</label>
                <input class="account_form_input" type="password" name="userPassword1" value="" placeholder="비밀번호를 입력하세요">
              </div>
              <div class="account_form2">
                <label for="이메일">변경할<br>비밀번호확인</label>
                <input class="account_form_input" type="password" name="userPassword2" value="" placeholder="비밀번호를 입력하세요">
              </div>
              <div class="login_id"><a href="#" onclick="document.getElementById('userUpdate').submit();">
                  비밀번호 변경
                </a></div>
            </form>
          </div>
        </section>
        <section class="intro">
          <div class="intro_text1">
            비밀번호를 이곳에서 변경할수 있습니다<br>
          </div>
          <div class="intro_text2">
            <span>먼저 지금 사용중인 아이디와 비밀번호를 입력해주세요</span><br>
            <span>만약 임시비밀번호 사용중이면 임시비밀번호를 입력해주세요</span><br>
            <span>변경할 비밀번호를 신중하게 입력해주세요</span><br>
            <span>비밀번호 확인을 위해 다시한번 입력해주세요</span>
          </div>
          <div class="intro_text3">
            비밀번호는 신중하게<br>
            변경해주시기 바랍니다.<br>
          </div>
        </section>
      </div>
    </article>
    <footer class="page_main Userfooter">
      <div class="KW_back KW_BTstyle">
        <a href="personal">뒤로</a>
      </div>
      <div class="visibilityhidden KW_BTstyle">

      </div>
      <div class="visibilityhidden KW_BTstyle">

      </div>
    </footer>

  </div>
  <div id="layer_modal">
    <!--[정인국] 아이디가 존재하지 않는 경우  -->
    <div class="popup_Fail_ID">
      <div class="popup_Fail_ID_window">
        지금 비밀번호가 틀립니다
      </div>
    </div>
    <!--[정인국] 비밀번호가 존재하지 않는 경우  -->
    <div class="popup_Fail_PW">
      <div class="popup_Fail_PW_window">
         새 비밀번호가 일치하지 않습니다.
      </div>
    </div>
  </div>
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
            if(messageContent == "비밀번호 변경에 성공했습니다."){
               PrintWriter script = response.getWriter();
               script.println("<script>");
               script.println("alert('비밀번호 변경에 성공했습니다.')");
               script.println("location.href = '/'");
               script.println("</script>");
            }
    %>
         <label for="이메일"><%= messageContent %></label>
   <%
      session.removeAttribute("messageContent");
      session.removeAttribute("messageType");
         }
   %>
   <%
  if(userID == null){
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('접근할 수 없습니다.')");
      script.println("location.href = 'login'");
      script.println("</script>");
   }
  %>
</body>

</html>