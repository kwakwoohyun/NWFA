<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
<meta charset="utf-8">
<title>����������</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0" />
<link rel="stylesheet" href="project.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

</head>

<body id="page_KingWordGameLobby" class="page_main page_normal"
	class="background">
	<header class="page_main">
		<div class="L_headerbar"></div>
		<div class="C_headerbar">
			<div class="KingWordGameTitle">�������� ����</div>
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
					<button id="KWG_stage1" class="KWG_Level" value="��"
						onclick="KingWordGame2_click(this.value)">
						<div class="KWG_Levelno">1</div>

					</button>
					<button id="KWG_stage1" class="KWG_Level" value="��"
						onclick="KingWordGame2_click(this.value)">
						<div class="KWG_Levelno">2</div>

					</button>
					<button id="KWG_stage1" class="KWG_Level" value="��"
						onclick="KingWordGame2_click(this.value)">
						<div class="KWG_Levelno">3</div>

					</button>
					<button id="KWG_stage1" class="KWG_Level" value="��"
						onclick="KingWordGame2_click(this.value)">
						<div class="KWG_Levelno">4</div>

					</button>
					<button id="KWG_stage1" class="KWG_Level" value="��"
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

				<button id="KWG_stage1" class="KWG_stage" value="��"
					onclick="location.href='KingWordGame'">
					<div class="KWG_stageno">1</div>
					<div class="KWG_stagestar">�ڡڡ�</div>
				</button>
				<button id="KWG_stage1" class="KWG_stage" value="��"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">2</div>
					<div class="KWG_stagestar">�ڡڡ�</div>
				</button>
				<button id="KWG_stage1" class="KWG_stage" value="��"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">3</div>
					<div class="KWG_stagestar">�ڡڡ�</div>
				</button>
				<button id="KWG_stage1" class="KWG_stage" value="��"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">4</div>
					<div class="KWG_stagestar">�ڡڡ�</div>
				</button>
				<button id="KWG_stage1" class="KWG_stage" value="��"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">5</div>
					<div class="KWG_stagestar">�ڡڡ�</div>
				</button>
				<button id="KWG_stage1" class="KWG_stage" value="��"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">6</div>
					<div class="KWG_stagestar">�ڡڡ�</div>
				</button>
				<button id="KWG_stage1" class="KWG_stage" value="��"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">7</div>
					<div class="KWG_stagestar">�ڡڡ�</div>
				</button>
			</div>
			<div class="KWG_stageline">

				<button id="KWG_stage1" class="KWG_stage" value="��"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">8</div>
					<div class="KWG_stagestar">�ڡڡ�</div>
				</button>
				<button id="KWG_stage1" class="KWG_stage" value="��"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">9</div>
					<div class="KWG_stagestar">�ڡڡ�</div>
				</button>
				<button id="KWG_stage1" class="KWG_stage" value="��"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">10</div>
					<div class="KWG_stagestar">�ڡڡ�</div>
				</button>
				<button id="KWG_stage1" class="KWG_stage" value="��"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">11</div>
					<div class="KWG_stagestar">�ڡڡ�</div>
				</button>
				<button id="KWG_stage1" class="KWG_stage" value="��"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">12</div>
					<div class="KWG_stagestar">�ڡڡ�</div>
				</button>
				<button id="KWG_stage1" class="KWG_stage" value="��"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">13</div>
					<div class="KWG_stagestar">�ڡڡ�</div>
				</button>
				<button id="KWG_stage1" class="KWG_stage" value="��"
					onclick="KingWordGame2_click(this.value)">
					<div class="KWG_stageno">��</div>
					<div class="KWG_stagestar">�ڡڡ�</div>
				</button>
			</div>

		</div>
		<footer class="page_main KingWordGamefooter">
			<div class="KW_back KW_BTRstyle">
				<a href="/">�ڷ�</a>
			</div>
			<div class="KW_BTNewStart KW_BTRstyle">�������� 1-1 ���� �����ϱ�</div>
			<div class="visibilityhidden KW_BTRstyle">����Ű</div>
		</footer>
</body>

</html>
