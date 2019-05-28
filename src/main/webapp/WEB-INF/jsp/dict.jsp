<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta charset="utf-8">
<title>사전</title>
<meta name="viewport" content="width=device-width; initial-scale=1.0" />
<link rel="stylesheet" href="/project.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
	function setWord(justice, mean) {
		document.querySelector('#justice').innerHTML = justice;
		document.querySelector('#mean').innerHTML = mean;
	}
	function setFavorite(word_id){
		location.href='/favoriteWord/'+word_id;
	}
	function removeFavorite(word_id){
		location.href='/unfavoriteWord/'+word_id;
	}
</script>
</head>
<body id="page_Dictionary">
	<div id="layer_background">
		<div id="dictionary_background">
			<!-- 배경색 #ff5050-->
		</div>
	</div>
	<div id="layer_control">
		<div class="viewBox">
			<div class="ControlBox">
				<!-- 검색창 -->
				<div class="SearchBar">
					<div class="text">단어사전</div>
					<div class="Search">
						<input type="text" name="word" />
					</div>
					<div class="Search_btn" onclick="Search_click(this.value)">
						검색</div>
				</div>
				<!-- 단어사전 -->
				<div class="wordlist_menu">
					<button type="button" id="list_ALL" name="button">모두</button>
					<button type="button" id="list_Favorites" name="button">즐겨찾기</button>
					<button type="button" id="list_A" name="button">줄임말</button>
					<button type="button" id="list_B" name="button">급식체</button>
					<button type="button" id="list_C" name="button">야민정음</button>
					<button type="button" id="list_WrongAnswer" name="button">오답</button>
				</div>
				<div class="Dictionary_list">
					<table>
						<c:forEach items="${word}" var="word">
							<tr>
								<c:choose>
									<c:when test="${word.favorite eq 1}">
										<th onclick="removeFavorite(${word.word_id });">★</th>
									</c:when>
									<c:otherwise>
										<th onclick="setFavorite(${word.word_id });">☆</th>
									</c:otherwise>
								</c:choose>
								<th style="text-align: left"
									onclick="setWord('${word.justice }','${word.mean }');">${word.justice}</th>
							</tr>
						</c:forEach>
					</table>
					<div class=""></div>
				</div>
				<footer class="page_main KingWordGamefooter">
					<div class="KW_back RED_UIstyle">
						<a href="/">뒤로</a>
					</div>
					<div class="visibilityhidden RED_UIstyle"></div>
					<div class="visibilityhidden RED_UIstyle"></div>
				</footer>
			</div>
			<div class="DisplayBox">
				<!-- 헤더메뉴 -->
				<header class="headerbar">
					<div class="L_headerbar"></div>
					<div class="C_headerbar">
						<div class="mainlobbyTitle">단어사전</div>
					</div>
					<div class="R_headerbar">
						<div class="UI login"></div>
					</div>
				</header>
				<div class="Dictionary_Content"></div>
				<div class="word" id="justice">${word[0].justice }</div>
				<div class="Content">
					<div class="maintext" id="mean" style="text-align: center;">${word[0].mean }</div>
				</div>

			</div>
		</div>

	</div>
	<div id="layer_modal"></div>
</body>
</html>
