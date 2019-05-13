<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
<meta charset="utf-8">
<title>메인페이지</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0" />
<link rel="stylesheet" href="/project.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
             
            $( document ).ready( function() {
                 
                $("#KWG_stage1").click(function(){
                	var value = $(this).attr('value')
                	$(location).attr('href', '/KingWordGame/'+value)
                });
         
            });
            $( document ).ready( function() {
                
                $("#KWG_stage2").click(function(){
                	var value = $(this).attr('value')
                	$(location).attr('href', '/KingWordGame/'+value)
 
                });
         
            });
            $( document ).ready( function() {
                
                $("#KWG_stage3").click(function(){
                	var value = $(this).attr('value')
                	$(location).attr('href', '/KingWordGame/'+value)
 
                });
         
            });
            $( document ).ready( function() {
                
                $("#KWG_stage4").click(function(){
                	var value = $(this).attr('value')
                	$(location).attr('href', '/KingWordGame/'+value)
 
                });
         
            });
            $( document ).ready( function() {
                
                $("#KWG_stage5").click(function(){
                	var value = $(this).attr('value')
                	$(location).attr('href', '/KingWordGame/'+value)
 
                });
         
            });
            
        </script>

</head>

<body id="page_KingWordGameLobby" class="page_main page_normal"
	class="background">
	<header class="page_main">
		<div class="L_headerbar"></div>
		<div class="C_headerbar">
			<div class="KingWordGameTitle">스테이지 선택</div>
		</div>
		<div class="R_headerbar visibilityhidden">
			<div class="UI login"></div>
	</header>
	<div class="viewBox">
		<div class="KingWordLevel">
			<div class="L_KingWordLevel">
				<div class="L_KingWordLevel_info">Stage 1</div>
			</div>
			<div class="C_KingWordLevel">
				<div class="KingWordLevel_BT">
					<button id="KWG_stage0" class="KWG_Level" value="지"
						onclick="KingWordGame2_click(this.value)">
						<div class="KWG_Levelno">1</div>

					</button>
					<button id="KWG_stage0" class="KWG_Level" value="지"
						onclick="KingWordGame2_click(this.value)">
						<div class="KWG_Levelno">2</div>

					</button>
					<button id="KWG_stage0" class="KWG_Level" value="지"
						onclick="KingWordGame2_click(this.value)">
						<div class="KWG_Levelno">3</div>

					</button>
					<button id="KWG_stage0" class="KWG_Level" value="지"
						onclick="KingWordGame2_click(this.value)">
						<div class="KWG_Levelno">4</div>

					</button>
					<button id="KWG_stage0" class="KWG_Level" value="지"
						onclick="KingWordGame2_click(this.value)">
						<div class="KWG_Levelno">5</div>

					</button>
				</div>
				<div class="KingWordLevel_display"></div>
			</div>
			<div class="R_KingWordLevel"></div>
		</div>
		<div class="KingWordStage">
			<div class="KWG_stageline">

				<button id="KWG_stage1" class="KWG_stage" value="1">
					<div class="KWG_stageno">1</div>
					<div class="KWG_stagestar">★★☆</div>
				</button>
				<button id="KWG_stage2" class="KWG_stage" value="2">
					<div class="KWG_stageno">2</div>
					<div class="KWG_stagestar">★★☆</div>
				</button>
				<button id="KWG_stage3" class="KWG_stage" value="3">
					<div class="KWG_stageno">3</div>
					<div class="KWG_stagestar">★★☆</div>
				</button>
				<button id="KWG_stage4" class="KWG_stage" value="4">
					<div class="KWG_stageno">4</div>
					<div class="KWG_stagestar">★★☆</div>
				</button>
				<button id="KWG_stage5" class="KWG_stage" value="5">
					<div class="KWG_stageno">5</div>
					<div class="KWG_stagestar">★★☆</div>
				</button>
				<button id="KWG_stage6" class="KWG_stage" value="6">
					<div class="KWG_stageno">6</div>
					<div class="KWG_stagestar">★★☆</div>
				</button>
				<button id="KWG_stage7" class="KWG_stage" value="7">
					<div class="KWG_stageno">7</div>
					<div class="KWG_stagestar">★★☆</div>
				</button>
			</div>
			<div class="KWG_stageline">

				<button id="KWG_stage0" class="KWG_stage" value="지"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">8</div>
					<div class="KWG_stagestar">★★☆</div>
				</button>
				<button id="KWG_stage0" class="KWG_stage" value="지"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">9</div>
					<div class="KWG_stagestar">★★☆</div>
				</button>
				<button id="KWG_stage0" class="KWG_stage" value="지"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">10</div>
					<div class="KWG_stagestar">★★☆</div>
				</button>
				<button id="KWG_stage0" class="KWG_stage" value="지"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">11</div>
					<div class="KWG_stagestar">★★☆</div>
				</button>
				<button id="KWG_stage0" class="KWG_stage" value="지"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">12</div>
					<div class="KWG_stagestar">★★☆</div>
				</button>
				<button id="KWG_stage0" class="KWG_stage" value="지"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">13</div>
					<div class="KWG_stagestar">★★☆</div>
				</button>
				<button id="KWG_stage0" class="KWG_stage" value="지"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">★</div>
					<div class="KWG_stagestar">★★☆</div>
				</button>
			</div>

		</div>
		<footer class="page_main KingWordGamefooter">
			<div class="KW_back KW_BTRstyle">
				<a href="/">뒤로</a>
			</div>
			<div class="KW_BTNewStart KW_BTRstyle">스테이지 1-1 부터 시작하기</div>
			<div class="visibilityhidden KW_BTRstyle">더미키</div>
		</footer>
</body>

</html>
