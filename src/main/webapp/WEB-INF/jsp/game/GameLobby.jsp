<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>�κ�</title>
    <meta name="viewport" content="width=device-width; initial-scale=1.0" />
    <link rel="stylesheet" href="project.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
      <script type="text/javascript">

      var ranking =["134", "222", "33"];
      var gameNo = 0;
      function click_Sejong(){
        gameNo = 0;
        $(".gameRail").css({'margin-left':'25%'})
        $(".gameNumber div").css({'background-color':'#ff5050'})
        $(".gameNumber .game1").css({'background-color':'#fad644'})
        $(".GameName").text('������� ���� ��ŷ')
        $(".GameRank").text(ranking[gameNo]+'��')
      }
      function click_WordQuiz(){
        gameNo = 1;
        $(".gameRail").css({'margin-left':'-25%'})
        $(".gameNumber div").css({'background-color':'#ff5050'})
        $(".gameNumber .game2").css({'background-color':'#fad644'})
        $(".GameName").text('���� ������ ��ŷ')
        $(".GameRank").text(ranking[gameNo]+'��')
      }
      function click_Talk(){
        gameNo = 2;
        $(".gameRail").css({'margin-left':'-75%'})
        $(".gameNumber div").css({'background-color':'#ff5050'})
        $(".gameNumber .game3").css({'background-color':'#fad644'})
        $(".GameName").text('������ �� ��ŷ')
        $(".GameRank").text(ranking[gameNo]+'��')
      }
      function click_GameStart(){
        if (gameNo == 0) {
          location.href='KingWordGameLobby';
        }

        else if (gameNo == 1) {
          location.href='YaminGameLobby/1/2';
        }

        else if (gameNo == 2) {
          location.href='http://www.naver.com';
        }


      }

    </script>
  </head>
  <body id="page_mainLobby">
    <div id="layer_background">
      <div id="mainLobby_background">
        <!-- ���� #ff5050-->
      </div>
    </div>
    <div id="layer_control">
      <header class="page_main">
        <div class="L_headerbar">
          <img id="mainLobbyLOGO" src="icon/game.svg">
        </div>
        <div class="C_headerbar">
          <div class="mainlobbyTitle">
            ������ �������ּ���
          </div>
        </div>
        <div class="R_headerbar">
           <%
      	String login = (String)session.getAttribute("userID");
      	if(login==null){
      %>
        <div class="UI login"  onclick="location.href='login'">
          <!-- <object type="image/svg+xml" data="icon/user.svg"></object> -->
        </div>
        <%}else {%>
        <div class="UI login" onclick="location.href='personal'">
        </div>
        <%} %>
        </div>
      </header>
      <div class="gameList">
        <div class="gameRail">
          <div id="game_Sejong" class="game" onclick="click_Sejong();">
            <div id="game_Sejong_TEXT">
              <span>�������</span><br>
              <span>�ܾ����</span>
            </div>
            <div id="game_Sejong_IMG">

            </div>
          </div>
          <div id="game_WordQuiz" class="game" onclick="click_WordQuiz();">
            <div id="game_WordQuiz_TEXT">
              <span>����!</span><br>
              <span>������</span>
            </div>
            <div id="game_WordQuiz_IMG">

            </div>
          </div>
          <div id="game_Talk" class="game" onclick="click_Talk();">
            <div id="game_Talk_TEXT">

            </div>
            <div id="game_Talk_IMG">

            </div>
          </div>
        </div>
      </div>
      <div class="gameSelector">
        <div class="gameNumber">
          <div class="game1" onclick="click_Sejong();">

          </div>
          <div class="game2" onclick="click_WordQuiz();">

          </div>
          <div class="game3" onclick="click_Talk();">

          </div>
        </div>
        <div class="gameInfo">
          <div>

          </div>
          <div class="gameStart">
            <button id="gameStartBotton" type="button" name="gameStart" onclick="click_GameStart();">�����ϱ�</button>

          </div>
          <div class="gameRanking">
            <div class="RankPlace">
              <div class="img_gamerank">
                <img src="icon/rank.svg" alt="��ŷ">
              </div>
              <div>
                ��&nbsp;&nbsp;ŷ
              </div>
            </div>
            <div class="GameNamePlace">
              <div class="GameName">
                ������� ���� ��ŷ
              </div>
              <div class="GameRank">
                123��
              </div>
            </div>
          </div>
        </div>

      </div>
      <footer class="page_main KingWordGamefooter">
        <div class="KW_back RED_UIstyle">
          <a href="/">�ڷ�</a>
        </div>
        <div class="visibilityhidden RED_UIstyle">

        </div>
        <div class="visibilityhidden RED_UIstyle">

        </div>
      </footer>
    </div>
    <div id="layer_modal">
    </div>
  </body>
</html>
