<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
<meta charset="utf-8">
<title>����������</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0" />
<link rel="stylesheet" href="project.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script type="text/javascript">
	var clickWord = ""; // �ܾ��
	var DoubleClickCheck = new Array();
	function KingWordGame1_click(event) {
		// alert("��ư1�� �����̽��ϴ�.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT1').style.backgroundColor = '#ffc834';
	}

	function KingWordGame2_click(event) {
		// alert("��ư2�� �����̽��ϴ�.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT2').style.backgroundColor = '#ffc834';
	}

	function KingWordGame3_click(event) {
		// alert("��ư3�� �����̽��ϴ�.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT3').style.backgroundColor = '#ffc834';
	}

	function KingWordGame4_click(event) {
		// alert("��ư4�� �����̽��ϴ�.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT4').style.backgroundColor = '#ffc834';
	}
	function KingWordGame5_click(event) {
		// alert("��ư5�� �����̽��ϴ�.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT5').style.backgroundColor = '#ffc834';
	}

	function KingWordGame6_click(event) {
		// alert("��ư6�� �����̽��ϴ�.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT6').style.backgroundColor = '#ffc834';
	}

	function KingWordGame7_click(event) {
		// alert("��ư7�� �����̽��ϴ�.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT7').style.backgroundColor = '#ffc834';
	}

	function KingWordGame8_click(event) {
		// alert("��ư8�� �����̽��ϴ�.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT8').style.backgroundColor = '#ffc834';
	}
	function KingWordGame9_click(event) {
		// alert("��ư9�� �����̽��ϴ�.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT9').style.backgroundColor = '#ffc834';
	}

	function KingWordGame10_click(event) {
		// alert("��ư10�� �����̽��ϴ�.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT10').style.backgroundColor = '#ffc834';
	}

	function KingWordGame11_click(event) {
		// alert("��ư11�� �����̽��ϴ�.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT11').style.backgroundColor = '#ffc834';
	}

	function KingWordGame12_click(event) {
		// alert("��ư12�� �����̽��ϴ�.");
		clickWord = clickWord + event;
		alert(clickWord);
		document.querySelector('#KWGQ_BT12').style.backgroundColor = '#ffc834';
	}
</script>



</head>

<body id="page_KingWordGame" class="page_main page_normal"
	class="background">
	<header class="page_main">
		<div class="L_headerbar"></div>
		<div class="C_headerbar">
			<div class="KingWordGameTitle">������� �ܾ����</div>
		</div>
		<div class="R_headerbar">
			<div class="UI login"></div>
		</div>
	</header>
	<div class="viewBox">
		<div class="ControlBox">
			<div class="page_main KingWordGamePanel">
					<button id="KWGQ_BT1" class="KWGQ_BT" value="${li.1 }"
						onclick="KingWordGame1_click(this.value)">��</button>
					<button id="KWGQ_BT2" class="KWGQ_BT" value="��"
						onclick="KingWordGame2_click(this.value)">��</button>
					<button id="KWGQ_BT3" class="KWGQ_BT" value="��"
						onclick="KingWordGame3_click(this.value)">��</button>
					<button id="KWGQ_BT4" class="KWGQ_BT" value="��"
						onclick="KingWordGame4_click(this.value)">��</button>
					<button id="KWGQ_BT5" class="KWGQ_BT" value="��"
						onclick="KingWordGame5_click(this.value)">��</button>
					<button id="KWGQ_BT6" class="KWGQ_BT" value="��"
						onclick="KingWordGame6_click(this.value)">��</button>
					<button id="KWGQ_BT7" class="KWGQ_BT" value="��"
						onclick="KingWordGame7_click(this.value)">��</button>
					<button id="KWGQ_BT8" class="KWGQ_BT" value="��"
						onclick="KingWordGame8_click(this.value)">��</button>
					<button id="KWGQ_BT9" class="KWGQ_BT" value="��"
						onclick="KingWordGame9_click(this.value)">��</button>
			</div>
			<footer class="page_main KingWordGamefooter">
				<div class="KW_back KW_BTstyle">
					<a href="/">�ڷ�</a>
				</div>
				<div class="KW_regame KW_BTstyle">�ٽ��ϱ�</div>
				<div class="KW_Hint KW_BTstyle">��Ʈ</div>
			</footer>
		</div>
		<div class="DisplayBox">
			<div class="KWGQ_quiz">

				<div class="KWGQ_Stage_panel">Stage 1-1</div>

				<div class="KWGQ_quiz_panel">
					������ ����, �ֽ� ���� ���� �ϴ� <br> ������� ���� ��� �̴�. <br> ���򿡴� ��Ʈ����
					���忡�� <br> ���� ���δٰ� �Ѵ�.<br>
				</div>
			</div>
			<div class="info_panel flex">
				<div class="point_panel KingWordGameporint flex">
					������ȸ
					<div class="Star_point">������</div>
					�����ְ�����
					<div class="Heart_point">�ڡ١�</div>
				</div>
				<div class="kingimg"></div>
			</div>
		</div>
	</div>

</body>

</html>
