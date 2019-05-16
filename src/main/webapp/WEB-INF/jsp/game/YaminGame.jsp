<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>����������</title>
  <meta name="viewport" content="width=device-width; initial-scale=1.0" />
  <link rel="stylesheet" href="/project.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <script type="text/javascript">
      // [���α�] ����� ��޷��̾ �����ϴ� �������� ����Ʈ�����
      function GameOver() {
        // ���ӿ��� �˾��� �ٿ�� �Լ�
        $(".popup_GameEnd").show().css('display', 'flex');
        $("#layer_control").css({
          'filter': 'blur(15px)',
          '-webkit-filter': 'blur(15px)',
          '-moz-filter': 'blur(15px)',
          '-o-filter': 'blur(15px)',
          '-ms-filter': 'blur(15px)'
        });
        $(".popup_GameOver").css('top', '0vh');

      }

      function GameClear() {
        //  ����Ŭ���� �˾��� �ٿ�� �Լ�
        $(".popup_GameEnd").show().css('display', 'flex');
        $("#layer_control").css({
          'filter': 'blur(15px)',
          '-webkit-filter': 'blur(15px)',
          '-moz-filter': 'blur(15px)',
          '-o-filter': 'blur(15px)',
          '-ms-filter': 'blur(15px)'
        });
        $(".popup_GameClear").css('top', '0vh');

      }
      // [���α�] ���â�� �����ֱ����� �Լ���
      function popup_Reset() {
        $(".popup_GameEnd").hide(); // [���α�] ���â �ʱ� ���� ..1
        $(".popup_GameOver").css('top', '-100vh'); // [���α�] ���â �ʱ� ���� ..2
        $(".popup_GameClear").css('top', '-100vh'); // [���α�] ���â �ʱ� ���� ..3
      }


      $(document).ready(function() {
        popup_Reset() //[���α�] ���â�� �ʱ�ȭ �����ִ� �Լ� ���â�� ����ϰ� �������� �̵����� �ʴ��̻� �ʱ�ȭ�� ��������մϴ�.
        // �׽�Ʈ ����
        // setTimeout(GameClear, 2000) //[����Ŭ���� �˾�] GameClear() �� ��밡��
        // setTimeout(GameOver, 2000) //[���ӿ��� �˾�] GameOver() �� ��밡��
      });
    </script>
</head>

<body id="page_ChallengeQuizgame" class="page_ChallengeQuiz">
  <div id="layer_background">
    <div class="background_ChallengeQuiz" >
      <div class="img_teacher">

      </div>
    </div>
  </div>
  <div id="layer_control">
    <header class="page_main">
      <div class="L_headerbar">

      </div>
      <div class="C_headerbar">
        <div class="WordQuizTitle">
          ���� ������!
        </div>
      </div>
      <div class="R_headerbar">
        <div class="UI login">
        </div>
      </div>
    </header>
    <div class="viewBox">

      <div class="DisplayBox">
        <div class="quiz">

          <div class="Stage_panel">
            Stage 1-1
          </div>
          <div class="blackboard">
            <div class="blackboard_Quiz">
              ${word.mean}
            </div>
            <div class="blackboard_Quiz_Question">
              <img src="/icon/WQ1.gif">
            </div>
            <div class="blackboard_Quiz_Answer">
              <img src="/icon/WQ1.gif">
            </div>
            <div class="blackboard_img">
              <img src="/icon/chalk.png">
            </div>
          </div>

        </div>
      </div>

      <div class="ControlBox">
        <div class="info_panel flex">
          ������ȸ
          <div class="Star_point">
            ������
          </div>
          �����ְ�����
          <div class="Heart_point">
            �ڡ١�
          </div>
        </div>

        <div class="buttonbox">
          <button id="WQ_BT1" class="WQ_BT" value="��" onclick="KingWordGame1_click(this.value)">
            ��
          </button>
          <button id="WQ_BT2" class="WQ_BT" value="��" onclick="KingWordGame1_click(this.value)">
            ��
          </button>
          <button id="WQ_BT3" class="WQ_BT" value="��" onclick="KingWordGame1_click(this.value)">
            ��
          </button>
          <button id="WQ_BT4" class="WQ_BT" value="��" onclick="KingWordGame1_click(this.value)">
            ��
          </button>
          <button id="WQ_BT5" class="WQ_BT" value="��" onclick="KingWordGame1_click(this.value)">
            ��
          </button>
          <button id="WQ_BT6" class="WQ_BT" value="��" onclick="KingWordGame1_click(this.value)">
            ��
          </button>
          <!-- <button id="WQ_BT7" class="WQ_BT" value="��" onclick="KingWordGame1_click(this.value)">
          ��
        </button>
        <button id="WQ_BT8" class="WQ_BT" value="��" onclick="KingWordGame1_click(this.value)">
          ��
        </button> -->
        </div>
      </div>
      <footer class="page_main KingWordGamefooter">
        <div class="KW_back CQ_BTstyle">
          <a href="index.html">�ڷ�</a>
        </div>
        <div class="KW_regame CQ_BTstyle">
          �ٽ��ϱ�
        </div>
        <div class="visibilityhidden CQ_BTstyle">

        </div>
      </footer>
    </div>
  </div>
  <div id="layer_modal">
    <div class="popup_GameEnd">
      <div class="popup_GameClear">
        <div class="popup_GameClear_Text">
          GAME CLEAR
        </div>
        <div class="popup_GameClear_NextGame" id="NextGame">
          ���� ��������
        </div>
        <div class="popup_GameClear_Lobby" id="MoveLobby">
          �κ�� ������
        </div>
      </div>
      <div class="popup_GameOver">
        <div class="popup_GameOver_Text">
          GAME OVER
        </div>
        <div class="popup_GameOver_Regame" id="ReGame">
          ���� �ٽ��ϱ�
        </div>
        <div class="popup_GameOver_Lobby" id="MoveLobby">
          �κ�� ������
        </div>
      </div>
    </div>
  </div>
</body>

</html>
