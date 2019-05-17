<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>메인페이지</title>
  <meta name="viewport" content="width=device-width; initial-scale=1.0" />
  <link rel="stylesheet" href="project.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script type="text/javascript">
    var sidebar = "ranking"; // 단어변수

    $(document).ready(function() {
      $(".personal_content>div").hide();
      $("#personal_ranking").show();
    });

    function personal_click(event) {
      sidebar = event;
      $(".personal_sidebt").css("background-color", "#fad644");
      $("#personal_logoutbt").css("background-color", "#ff5050");
      $(".personal_content>div").hide();
      if (sidebar == "ranking") {
        $("#personal_ranking").show();
        $("#personal_rankingbt").css("background-color", "#ffc000")
        $(".personal_titleBar").text("| 랭킹")

      } else if (sidebar == "score") {
        $("#personal_score").show();
        $("#personal_scorebt").css("background-color", "#ffc000")
        $(".personal_titleBar").text("| 점수")
      } else if (sidebar == "achievements") {
        $("#personal_achievements").show();
        $("#personal_achievementsbt").css("background-color", "#ffc000")
        $(".personal_titleBar").text("| 도전과제")
      } else if (sidebar == "setting") {
        $("#personal_setting").show();
        $("#personal_settingbt").css("background-color", "#ffc000")
        $(".personal_titleBar").text("| 개인설정")
      } else if (sidebar == "logout") {
        $("#personal_logout").show();
        $("#personal_logoutbt").css("background-color", "#ffc000")
      }
    }
  </script>
</head>

<body id="page_personal">
  <div id="layer_background">
    <div id="personal_background">
      <!-- 배경색 #ff5050-->
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
          | 랭킹
        </div>
      </div>
      <div class="R_headerbar">

      </div>
    </header>
    <div class="personal_main">
      <div class="personal_sidebar">
        <div class="personal_bts">
          <div id="personal_rankingbt" class="personal_sidebt" value="ranking" onclick="personal_click('ranking')">
            랭킹
          </div>

          <div id="personal_scorebt" class="personal_sidebt" value="score" onclick="personal_click('score')">
            점수
          </div>
          <div id="personal_achievementsbt" class="personal_sidebt" value="achievements" onclick="personal_click('achievements')">
            도전과제
          </div>
          <div id="personal_settingbt" class="personal_sidebt" value="setting" onclick="personal_click('setting')">
            개인설정
          </div>
        </div>
        <div class="logout_bt">
          <div id="personal_logoutbt" class="personal_sidebt" value="logout" onclick="location.href='logout'">
            로그오프
          </div>
        </div>

      </div>
      <div class="personal_content">
        <div id="personal_ranking">
          지금 당신의 신조어 실력은 ?
        </div>
        <div id="personal_score">
          <div class="score_game_Sejong">
            <div class="score_game_imgarea">
              <div class="score_game_img">
              </div>
              <div class="score_game_img_text">
                세종대왕 단어게임
              </div>
            </div>
            <div class="score_Star_area">
              <div class="score_Star_text">
                모운 별의 숫자
              </div>
              <div class="score_Star_point">
                <div class="star_img">
                  ★
                </div>
                <div class="score_Star" id="score_Star_Sejong">
                  84개
                </div>
              </div>

            </div>
            <div class="score_Stage_area">
              <div class="score_Stage_text">
                최고 도달 스테이지
              </div>
              <div class="score_Stage" id="score_Stage_Sejong">
                Stage 4 - 2
              </div>
            </div>
          </div>
          <div class="score_game_WordQuiz">
            <div class="score_game_imgarea">
              <div class="score_game_img">
              </div>
              <div class="score_game_img_text">
                도전 줄임말 !
              </div>
            </div>
            <div class="score_Star_area">
              <div class="score_Star_text">
                모운 별의 숫자
              </div>
              <div class="score_Star_point">
                <div class="star_img">
                  ★
                </div>
                <div class="score_Star" id="score_Star_WordQuiz">
                  84개
                </div>
              </div>

            </div>
            <div class="score_Stage_area">
              <div class="score_Stage_text">
                최고 도달 스테이지
              </div>
              <div class="score_Stage" id="score_Stage_WordQuiz">
                Stage 4 - 2
              </div>
            </div>
          </div>
          <div class="score_game_Talk">
            <div class="score_game_imgarea">
              <div class="score_game_img">
              </div>
              <div class="score_game_img_text">
                신조어톡
              </div>
            </div>
            <div class="score_Star_area">
              <div class="score_Star_text">
                모운 별의 숫자
              </div>
              <div class="score_Star_point">
                <div class="star_img">
                  ★
                </div>
                <div class="score_Star" id="score_Star_Talk">
                  84개
                </div>
              </div>

            </div>
            <div class="score_Stage_area">
              <div class="score_Stage_text">
                최고 도달 스테이지
              </div>
              <div class="score_Stage" id="score_Stage_Talk">
                Stage 4 - 2
              </div>
            </div>
          </div>
        </div>
        <div id="personal_achievements">
          <div class="personal_achievements_point_area">
            <div class="personal_achievements_point_Text">
              나의 도전과제 점수
            </div>
            <div class="personal_achievements_point">
              450점
            </div>
          </div>
          <div class="personal_achievements_btarea">
            <div class="">
              전체
            </div>
            <div class="">
              신조어 업적
            </div>
            <div class="">
              게임 업적
            </div>
            <div class="">
              기타업적
            </div>
          </div>
          <div class="personal_achievements_list">
            <!-- 업적들 -->
            <div class="achievement">
              <div class="achievement_Obj">
                <div class="achievement_Left">
                  <div class="achievement_Thumbnail">
                    이미지
                  </div>
                  <div class="achievement_Text">
                    <div class="achievement_Name">
                      마춤뻡이 가장 쉬웠어요
                    </div>
                    <div class="achievement_Info">
                      <div class="achievement_Tag">
                        [신조어]
                      </div>
                      <div class="achievement_Summary">
                        야민정음 관련 모든 문제 풀기
                      </div>
                    </div>
                  </div>
                </div>
                <div class="achievement_Right">
                  <div class="achievement_Point">
                    50점
                  </div>
                  <div class="achievement_Clear">

                  </div>
                </div>
              </div>
            </div>
            <div class="achievement">
              <div class="achievement_Obj">
                <div class="achievement_Left">
                  <div class="achievement_Thumbnail">
                    이미지
                  </div>
                  <div class="achievement_Text">
                    <div class="achievement_Name">
                      말넘심.. ㄷㄷ
                    </div>
                    <div class="achievement_Info">
                      <div class="achievement_Tag">
                        [신조어톡]
                      </div>
                      <div class="achievement_Summary">
                        게임에서 5번 이상 상대를 나가게하기
                      </div>
                    </div>
                  </div>
                </div>
                <div class="achievement_Right">
                  <div class="achievement_Point">
                    20점
                  </div>
                  <div class="achievement_Clear">

                  </div>
                </div>
              </div>
            </div>
            <div class="achievement">
              <div class="achievement_Obj">
                <div class="achievement_Left">
                  <div class="achievement_Thumbnail">
                    이미지
                  </div>
                  <div class="achievement_Text">
                    <div class="achievement_Name">
                      라떼는 말이야
                    </div>
                    <div class="achievement_Info">
                      <div class="achievement_Tag">
                        [신조어]
                      </div>
                      <div class="achievement_Summary">
                        2010년 이전에 만들어진 신조어 10개 풀기
                      </div>
                    </div>
                  </div>
                </div>
                <div class="achievement_Right">
                  <div class="achievement_Point">
                    30점
                  </div>
                  <div class="achievement_Clear">
                    달성
                  </div>
                </div>
              </div>
            </div>
            <div class="achievement">
              <div class="achievement_Obj">
                <div class="achievement_Left">
                  <div class="achievement_Thumbnail">
                    이미지
                  </div>
                  <div class="achievement_Text">
                    <div class="achievement_Name">
                      즐기시게 놔둬
                    </div>
                    <div class="achievement_Info">
                      <div class="achievement_Tag">
                        [사전]
                      </div>
                      <div class="achievement_Summary">
                        사전에서 즐겨찾기 50개 하기
                      </div>
                    </div>
                  </div>
                </div>
                <div class="achievement_Right">
                  <div class="achievement_Point">
                    20점
                  </div>
                  <div class="achievement_Clear">
                    달성
                  </div>
                </div>
              </div>
            </div>
            <div class="achievement">
              <div class="achievement_Obj">
                <div class="achievement_Left">
                  <div class="achievement_Thumbnail">
                    이미지
                  </div>
                  <div class="achievement_Text">
                    <div class="achievement_Name">
                      형이 거기서 왜 나와?
                    </div>
                    <div class="achievement_Info">
                      <div class="achievement_Tag">
                        [신조어]
                      </div>
                      <div class="achievement_Summary">
                        해당업적을 따기 위한 조건
                      </div>
                    </div>
                  </div>
                </div>
                <div class="achievement_Right">
                  <div class="achievement_Point">
                    50점
                  </div>
                  <div class="achievement_Clear">
                    달성
                  </div>
                </div>
              </div>
            </div>
            <div class="achievement">
              <div class="achievement_Obj">
                <div class="achievement_Left">
                  <div class="achievement_Thumbnail">
                    이미지
                  </div>
                  <div class="achievement_Text">
                    <div class="achievement_Name">
                      이름
                    </div>
                    <div class="achievement_Info">
                      <div class="achievement_Tag">
                        [신조어]
                      </div>
                      <div class="achievement_Summary">
                        해당업적을 따기 위한 조건
                      </div>
                    </div>
                  </div>
                </div>
                <div class="achievement_Right">
                  <div class="achievement_Point">
                    50점
                  </div>
                  <div class="achievement_Clear">
                    달성
                  </div>
                </div>
              </div>
            </div>
            <div class="achievement">
              <div class="achievement_Obj">
                <div class="achievement_Left">
                  <div class="achievement_Thumbnail">
                    이미지
                  </div>
                  <div class="achievement_Text">
                    <div class="achievement_Name">
                      이름
                    </div>
                    <div class="achievement_Info">
                      <div class="achievement_Tag">
                        [신조어]
                      </div>
                      <div class="achievement_Summary">
                        해당업적을 따기 위한 조건
                      </div>
                    </div>
                  </div>
                </div>
                <div class="achievement_Right">
                  <div class="achievement_Point">
                    50점
                  </div>
                  <div class="achievement_Clear">
                    달성
                  </div>
                </div>
              </div>
            </div>

            <!-- 업적들 -->
          </div>
        </div>
        <div id="personal_setting">
          <div class="setting_passwd">
            <div class="setting_passwd_text">
              계정 비밀번호 변경
            </div>
            <div class="setting_passwd_box">
              <div class="setting_passwd_info">
                계정의 비밀번호를 변경할수 있습니다.<br>
                이메일 인증이 필요합니다.
              </div>
              <div class="setting_passwd_bt">
              비밀번호 변경
              </div>
            </div>
          </div>
          <div class="setting_profile">
            <div class="setting_profile_text">
              프로필 이미지 설정
            </div>
            <div class="setting_profile_box">
              <div class="setting_profile_img">

              </div>
              <div class="setting_profile_img">

              </div>
              <div class="setting_profile_img">

              </div>
              <div class="setting_profile_img">

              </div>
              <div class="setting_profile_img">

              </div>
              <div class="setting_profile_img">

              </div>
            </div>
          </div>
        </div>
        <div id="personal_logout">

        </div>
      </div>
    </div>
    <footer class="page_main Userfooter">
      <div class="KW_back KW_BTstyle">
        <a href="/">뒤로</a>
      </div>
      <div class="visibilityhidden KW_BTstyle">

      </div>
      <div class="visibilityhidden KW_BTstyle">

      </div>
    </footer>
  </div>
  <div id="layer_modal">
  </div>
</body>

</html>