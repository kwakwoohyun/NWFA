<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta charset="utf-8">
<title>사전</title>
<link rel="stylesheet" href="/project.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
history.pushState(null, null, location.href);
window.onpopstate = function(event) {
	history.go(1);
};
	function setWord(justice, mean) {
    	document.querySelector('#justice').innerHTML = justice;
    	document.querySelector('#mean').innerHTML = mean;
        $("tr").click(function(){     
            $('tr').css({
          	'color': '#000000'
        	})
        	  $(this).css({
          	'color': '#ff5050'
        	})
        })
 	}
	// 수정정인국
	   function bt(num){
	     $('.wordlist_menu > button').css({
	      'background-color': '#cda705',
	      'color': '#fff'
	    })
	    $('.wordlist_menu > button:nth-of-type('+num+')').css({
	      'background-color': '#fdeca5',
	      'color': '#000'
	  })}

	function Search_click(){
		location.href='/searchWord/'+$('#search').val();
	}
	
	function setFavorite(word_id,dic_id){
		location.href='/favoriteWord/'+word_id+"/"+dic_id;
	}
	function removeFavorite(word_id,dic_id){
		location.href='/unfavoriteWord/'+word_id+"/"+dic_id;
	}
	function alls(){
		bt(1);
		document.querySelector('#all').style.display = 'block';
		document.querySelector('#favorite').style.display= 'none';
		document.querySelector('#year15').style.display = 'none';
		document.querySelector('#year16').style.display = 'none';
		document.querySelector('#year17').style.display = 'none';
		document.querySelector('#year18').style.display = 'none';
		document.querySelector('#year19').style.display = 'none';
		document.querySelector('#yamin').style.display = 'none';
	}
	function favorite(){
		bt(2);
		document.querySelector('#all').style.display = 'none';
		document.querySelector('#favorite').style.display= 'block';
		document.querySelector('#year15').style.display = 'none';
		document.querySelector('#year16').style.display = 'none';
		document.querySelector('#year17').style.display = 'none';
		document.querySelector('#year18').style.display = 'none';
		document.querySelector('#year19').style.display = 'none';
		document.querySelector('#yamin').style.display = 'none';
	}
	function year15(){
		bt(3);
		document.querySelector('#year15').style.display = 'block';
		document.querySelector('#all').style.display = 'none';
		document.querySelector('#favorite').style.display= 'none';
		document.querySelector('#year16').style.display = 'none';
		document.querySelector('#year17').style.display = 'none';
		document.querySelector('#year18').style.display = 'none';
		document.querySelector('#year19').style.display = 'none';
		document.querySelector('#yamin').style.display = 'none';
	}
	function year16(){
		bt(4);
		document.querySelector('#all').style.display = 'none';
		document.querySelector('#favorite').style.display= 'none';
		document.querySelector('#year15').style.display = 'none';
		document.querySelector('#year16').style.display = 'block';
		document.querySelector('#year17').style.display = 'none';
		document.querySelector('#year18').style.display = 'none';
		document.querySelector('#year19').style.display = 'none';
		document.querySelector('#yamin').style.display = 'none';
	}
	function year17(){
		bt(5);
		document.querySelector('#all').style.display = 'none';
		document.querySelector('#favorite').style.display= 'none';
		document.querySelector('#year15').style.display = 'none';
		document.querySelector('#year16').style.display = 'none';
		document.querySelector('#year17').style.display = 'block';
		document.querySelector('#year18').style.display = 'none';
		document.querySelector('#year19').style.display = 'none';
		document.querySelector('#yamin').style.display = 'none';
	}
	function year18(){
		bt(6);
		document.querySelector('#all').style.display = 'none';
		document.querySelector('#favorite').style.display= 'none';
		document.querySelector('#year15').style.display = 'none';
		document.querySelector('#year16').style.display = 'none';
		document.querySelector('#year17').style.display = 'none';
		document.querySelector('#year18').style.display = 'block';
		document.querySelector('#year19').style.display = 'none';
		document.querySelector('#yamin').style.display = 'none';
	}
	function year19(){
		bt(7);
		document.querySelector('#all').style.display = 'none';
		document.querySelector('#favorite').style.display= 'none';
		document.querySelector('#year15').style.display = 'none';
		document.querySelector('#year16').style.display = 'none';
		document.querySelector('#year17').style.display = 'none';
		document.querySelector('#year18').style.display = 'none';
		document.querySelector('#year19').style.display = 'block';
		document.querySelector('#yamin').style.display = 'none';
	}
	function yamin(){
		bt(8);
		document.querySelector('#all').style.display = 'none';
		document.querySelector('#favorite').style.display= 'none';
		document.querySelector('#year15').style.display = 'none';
		document.querySelector('#year16').style.display = 'none';
		document.querySelector('#year17').style.display = 'none';
		document.querySelector('#year18').style.display = 'none';
		document.querySelector('#year19').style.display = 'none';
		document.querySelector('#yamin').style.display = 'block';
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
						<input id="search" type="text" name="word" />
					</div>
					<div class="Search_btn" onclick="Search_click()">검색</div>
				</div>
				<!-- 단어사전 -->
				<div class="wordlist_menu">
					<button type="button" id="list_ALL" name="button"
						onclick="location.href='/dictionary/1'">모두</button>
					<button type="button" id="list_Favorites" name="button"
						onclick="favorite();">즐겨찾기</button>
					<button type="button" id="list_A" name="button" onclick="year15();">2015</button>
					<button type="button" id="list_B" name="button" onclick="year16();">2016</button>
					<button type="button" id="list_C" name="button" onclick="year17();">2017</button>
					<button type="button" id="list_D" name="button" onclick="year18();">2018</button>
					<button type="button" id="list_E" name="button" onclick="year19();">2019</button>
					<button type="button" id="list_Yamin" name="button"
						onclick="yamin();">야민정음</button>
				</div>
				<div class="Dictionary_list" style="display: block">
					<table id="all">
						<c:choose>
							<c:when test="${searchSize == 0}">
								<c:forEach items="${word}" var="word">
									<tr>
										<c:choose>
											<c:when test="${word.favorite eq 1}">
												<th onclick="removeFavorite(${word.word_id },1);">★</th>
											</c:when>
											<c:otherwise>
												<th onclick="setFavorite(${word.word_id },1);">☆</th>
											</c:otherwise>
										</c:choose>
										<th style="text-align: left"
											onclick="setWord('${word.justice }','${word.mean }');">${word.justice}</th>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach items="${search}" var="word">
									<c:choose>
										<c:when test="${word.favorite eq 1}">
											<tr>
												<th onclick="removeFavorite(${word.word_id },1);">★</th>
												<th style="text-align: left"
													onclick="setWord('${word.justice }','${word.mean }');">${word.justice}</th>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
												<th onclick="setFavorite(${word.word_id },1);">☆</th>
												<th style="text-align: left"
													onclick="setWord('${word.justice }','${word.mean }');">${word.justice}</th>

											</tr>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<table id="favorite" style="display: none">
						<c:forEach items="${word}" var="word">
							<c:choose>
								<c:when test="${word.favorite eq 1}">
									<tr id="wordrow">
										<th onclick="removeFavorite(${word.word_id },2);">★</th>
										<th style="text-align: left"
											onclick="setWord('${word.justice }','${word.mean }');">${word.justice}</th>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
					</table>
					<table id="year15" style="display: none">
						<c:forEach items="${word}" var="word">
							<c:if test="${word.year eq '2015'}">
								<c:choose>
									<c:when test="${word.favorite eq 1}">
										<tr id="wordrow">
											<th onclick="removeFavorite(${word.word_id },3);">★</th>
											<th style="text-align: left"
												onclick="setWord('${word.justice }','${word.mean }');">${word.justice}</th>
										</tr>
									</c:when>
									<c:otherwise>
										<tr id="wordrow">
											<th onclick="setFavorite(${word.word_id },3);">☆</th>
											<th style="text-align: left"
												onclick="setWord('${word.justice }','${word.mean }');">${word.justice}</th>
										</tr>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach>
					</table>
					<table id="year16" style="display: none">
						<c:forEach items="${word}" var="word">
							<c:if test="${word.year eq '2016'}">
								<c:choose>
									<c:when test="${word.favorite eq 1}">
										<tr id="wordrow">
											<th onclick="removeFavorite(${word.word_id },4);">★</th>
											<th style="text-align: left"
												onclick="setWord('${word.justice }','${word.mean }');">${word.justice}</th>
										</tr>
									</c:when>
									<c:otherwise>
										<tr id="wordrow">
											<th onclick="setFavorite(${word.word_id },4);">☆</th>
											<th style="text-align: left"
												onclick="setWord('${word.justice }','${word.mean }');">${word.justice}</th>
										</tr>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach>
					</table>
					<table id="year17" style="display: none">
						<c:forEach items="${word}" var="word">
							<c:if test="${word.year eq '2017'}">
								<c:choose>
									<c:when test="${word.favorite eq 1}">
										<tr id="wordrow">
											<th onclick="removeFavorite(${word.word_id },5);">★</th>
											<th style="text-align: left"
												onclick="setWord('${word.justice }','${word.mean }');">${word.justice}</th>
										</tr>
									</c:when>
									<c:otherwise>
										<tr id="wordrow">
											<th onclick="setFavorite(${word.word_id },5);">☆</th>
											<th style="text-align: left"
												onclick="setWord('${word.justice }','${word.mean }');">${word.justice}</th>
										</tr>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach>
					</table>
					<table id="year18" style="display: none">
						<c:forEach items="${word}" var="word">
							<c:if test="${word.year eq '2018'}">
								<tr id="wordrow">
									<c:choose>
										<c:when test="${word.favorite eq 1}">
											<th onclick="removeFavorite(${word.word_id });">★</th>
											<th style="text-align: left"
												onclick="setWord('${word.justice }','${word.mean }');">${word.justice}</th>
										</c:when>
										<c:otherwise>
											<th onclick="setFavorite(${word.word_id });">☆</th>
											<th style="text-align: left"
												onclick="setWord('${word.justice }','${word.mean }');">${word.justice}</th>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:if>
						</c:forEach>
					</table>
					<table id="year19" style="display: none">
						<c:forEach items="${word}" var="word">
							<c:if test="${word.year eq '2019'}">
								<tr id="wordrow">
									<c:choose>
										<c:when test="${word.favorite eq 1}">
											<th onclick="removeFavorite(${word.word_id });">★</th>
											<th style="text-align: left"
												onclick="setWord('${word.justice }','${word.mean }');">${word.justice}</th>
										</c:when>
										<c:otherwise>
											<th onclick="setFavorite(${word.word_id });">☆</th>
											<th style="text-align: left"
												onclick="setWord('${word.justice }','${word.mean }');">${word.justice}</th>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:if>
						</c:forEach>
					</table>
					<table id="yamin" style="display: none">
						<c:forEach items="${word}" var="word">
							<c:if test="${word.gameNum eq '2'}">
								<tr id="wordrow">
									<c:choose>
										<c:when test="${word.favorite eq 1}">
											<th onclick="removeFavorite(${word.word_id });">★</th>
											<th style="text-align: left"
												onclick="setWord('${word.justice }','${word.mean }');">${word.justice}</th>
										</c:when>
										<c:otherwise>
											<th onclick="setFavorite(${word.word_id });">☆</th>
											<th style="text-align: left"
												onclick="setWord('${word.justice }','${word.mean }');">${word.justice}</th>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
				<script>
				if(${dic_id} == 1){
					alls();
				}else if(${dic_id}==2){
					favorite();
				}else if(${dic_id}==3){
					year15();
				}else if(${dic_id}==4){
					year16();
				}else if(${dic_id}==5){
					year17();
				}else if(${dic_id}==6){
					year18();
				}else if(${dic_id}==7){
					year19();
				}else if(${dic_id}==8){
					yamin();
				}
				</script>
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
						<div class="UI login" onclick="location.href='/personal'"></div>
					</div>
				</header>
				<div class="Dictionary_Content"></div>
				<c:choose>
					<c:when test="${searchSize == 0}">
						<div class="word" id="justice">${word[0].justice }</div>
						<div class="Content">
							<div class="maintext" id="mean" style="text-align: center;">${word[0].mean }</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="word" id="justice"></div>
						<div class="Content">
							<div class="maintext" id="mean" style="text-align: center;"></div>
						</div>
					</c:otherwise>
				</c:choose>

			</div>
		</div>

	</div>
	<div id="layer_modal"></div>
</body>
</html>
