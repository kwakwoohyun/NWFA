<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>����������</title>
  <meta name="viewport" content="width=device-width; initial-scale=1.0" />
  <link rel="stylesheet" href="project.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script type="text/javascript">
  WordQuizLevel_click

  var ranking =["134", "222", "33"];
  var WQ_Level = 0
  function WordQuizLevel_click(event){
     WQ_Level = event
    $(".WQ_Level").css({'border-color':'#ffffff'})
    $(".WQ_Level").css({'color':'#ffffff'})

    if (WQ_Level == 1) {
      $("#WQ_Level1").css({'border-color':'#ff69b2'})
      $("#WQ_Level1").css({'color':'#ff69b2'})
    }
    else if (WQ_Level == 2) {
      $("#WQ_Level2").css({'border-color':'#ff69b2'})
      $("#WQ_Level2").css({'color':'#ff69b2'})
    }
    else if (WQ_Level == 3) {
      $("#WQ_Level3").css({'border-color':'#ff69b2'})
      $("#WQ_Level3").css({'color':'#ff69b2'})
    }
    $(".WQ_BTNewStart").text('�������� '+WQ_Level+'-1 ���ͽ����ϱ�')
    // $(".GameRank").text(ranking[gameNo]+'��')
  }
  functio
  </script>
</head>

<body id="page_ChallengeQuizgameLobby" class="page_ChallengeQuiz">
  <div id="layer_background">
    <div class="background_ChallengeQuiz">

    </div>
  </div>
  <div id="layer_control">
    <header class="page_main">
      <div class="L_headerbar">

      </div>
      <div class="C_headerbar">
        <div class="WordQuizTitle">
          �������� ����
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

          <div class="blackboard">
            <div class="blackboard_Level_text">
              Stage 1
            </div>
            <div class="blackboard_Level">
              <button id="WQ_Level1" class="WQ_Level" value="1" onclick="WordQuizLevel_click(this.value)">
                <div class="WQ_Levelno">
                  1
                </div>
              </button>

              <button id="WQ_Level2" class="WQ_Level" value="2" onclick="WordQuizLevel_click(this.value)">
                <div class="WQ_Levelno">
                  2
                </div>
              </button>

              <button id="WQ_Level3" class="WQ_Level" value="3" onclick="WordQuizLevel_click(this.value)">
                <div class="WQ_Levelno">
                  3
                </div>
              </button>
            </div>
            <div class="blackboard_stage">
              <button id="WQ_stage1" class="WQ_stage" value="��"  onclick="location.href='KingWordGame.html'">
                <div class="WQ_stageno">
                  1
                </div>
                <div class="WQ_stagestar">
                  �ڡڡ�
                </div>
              </button>
              <button id="WQ_stage1" class="WQ_stage" value="��" onclick="KingWordGame2_click(this.value)">
                <div class="WQ_stageno">
                  2
                </div>
                <div class="WQ_stagestar">
                  �ڡڡ�
                </div>
              </button>
              <button id="WQ_stage1" class="WQ_stage" value="��" onclick="KingWordGame2_click(this.value)">
                <div class="WQ_stageno">
                  3
                </div>
                <div class="WQ_stagestar">
                  �ڡڡ�
                </div>
              </button>
              <button id="WQ_stage1" class="WQ_stage" value="��" onclick="KingWordGame2_click(this.value)">
                <div class="WQ_stageno">
                  4
                </div>
                <div class="WQ_stagestar">
                  �ڡڡ�
                </div>
              </button>
              <button id="WQ_stage1" class="WQ_stage" value="��" onclick="KingWordGame2_click(this.value)">
                <div class="WQ_stageno">
                  5
                </div>
                <div class="WQ_stagestar">
                  �ڡڡ�
                </div>
            </div>
            <div class="blackboard_img">
              <img src="icon/chalk.png">
            </div>
          </div>

        </div>
        <!--
      <div class="info_panel flex">
          ������ȸ
          <div class="Star_point">
            ������
          </div>
          �����ְ�����
          <div class="Heart_point">
            �ڡ١�
          </div>

      </div> -->
      </div>
    </div>
      <footer class="page_main KingWordGamefooter">
        <div class="WQ_back CQ_BTstyle">
          <a href="GameLobby">�ڷ�</a>
        </div>
        <div class="WQ_BTNewStart CQ_BTstyle">
          �������� 1-1 ���� �����ϱ�
        </div>
        <div class="visibilityhidden CQ_BTstyle">

      </footer>
    </div>
  </div>
  <div id="layer_modal">

  </div>
</body>

</html>