<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.prj.dao.loginDao" %>
<%@ page import="com.prj.dto.loginDto" %>    

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html;charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/MainPage.css">
</head>

<body>

	<div>
		<div class="wrap">
			<div class="intro_bg">
				<div class="header">
					<div class="searchArea">
						<form action="">
							<input type="search" placeholder="Search">
							<span>검색</span>
						</form>
					</div>
					<ul class="nav">
						<li><a href="#">HOME</a></li>
						<li><a href="#">ABOUT</a></li>
						<li><a href="#">유기동물 공고</a></li>
						<li><a href="#">유기동물 제보</a></li>
						<li><a href="#">보호소 위치</a></li>
						<li><a href="#">쇼핑 플랫폼</a></li>
					</ul>
					<div class="login">
						<%
						if(session.getAttribute("dto")==null){
						%>
						<a href="controller.do?command=loginform">LOGIN</a>
						<%
						}else{
							out.print(session.getAttribute("dto.myname")+"님 환영합니다");
					
						%>
						
						<a href="controller.do?command=logout">LOGOUT</a>
						
						<% 
						}
						%>

					</div>
				</div>
					
				<div class="intro_text">
					<h1>내용</h1>
					<h4 class="contents1">안녕하세요 TEST</h4>
				</div>
			</div>
			<!--  intro end -->
			<ul class="amount">
				<li>
					<div>
						<div class="contents1">도움이 필요한 친구들</div>
						<div class="result">123,000링크</div>
					</div>
				</li>
				<li>
					<div>
						<div class="contents1">입양된 친구들</div>
						<div class="result">123,000링크</div>
					</div>
				</li>
				
				<li>
					<div>
						<div class="contents1">제보 현황</div>
						<div class="result">123,000링크</div>
					</div>
				</li>
				<li>
					<div>
						<div class="contents1">TEST</div>
						<div class="result">123,000링크</div>
					</div>
				</li>
			</ul>
			<!-- amount end -->
			
			<div class="main_text01">
				<h1>ABOUT</h1>
				<div class="contents1">사지말고 입양하세요</div>
				
				<ul class="icons">
					<li>
						<div class="icon_img">
							<img src="./img/icon3.svg">
						</div>
						<div class="content1_bold">TEST1</div>
						<div class="contents3">
							내용 삽입
						</div>
						<div class="more" >
							MORE
						</div>
					</li>
					<li>
						<div class="icon_img">
							<img src="./img/icon1.svg">
						</div>
						<div class="content1_bold">TEST2</div>
						<div class="contents3">
							내용 삽입
						</div>
						<div class="more" >
							MORE
						</div>
					</li>
					<li>
						<div class="icon_img">
							<img src="./img/icon2.svg">
						</div>
						<div class="content1_bold">TEST3</div>
						<div class="contents3">
							내용 삽입
						</div>
						<div class="more" >
							MORE
						</div>
					</li>
				</ul>
			</div>
			
			<!-- main_test02 -->
			<div class="main_text02">
				<h1>SERVICE</h1>
				<div class="contents1">TEST 내용 삽입</div>
				<div class="service">
					<div class="animal_photo">
						<img src="./img/animal.jpg">
					</div>
					
					<div class="contents3">
						<h2>컨텐츠 타이틀</h2>
						TEST 컨텐츠에 관련된 이야기 (기사 및 정보)
						<br>1
						<br>2
						<br>3
						<br>4
					</div>
				</div>
				
				<div class="main_text03">
					<ul>
						<li>
							<div><h1>DONATION</h1></div>
							<div>친구들에게 희망을 선물하기</div>
							<div class="more2">
								더 알아보기
							</div>
						</li>
						<li>
							<div><h1>VOULUNTEER</h1></div>
							<div>봉사관련 내용</div>
							<div class="more2">
								더 알아보기
							</div>
						</li>
					</ul>
				</div>
				<footer>
					<div>
						LOGO (로고 이미지)
					</div>
					<div>
						대 표&nbsp;&nbsp;&nbsp;홍 길 동 
						<br>서울특별시 강남구 대치동 280-3 삼익타워 1차 7F 고객상담실 
						<br>Fax/Tel. 02 - 1234 - 1234~9
						<br>COPYRIGHT 2019. TAMO. ALL RIGHT RESERVED.
					</div>
				</footer>
			</div>
			
		</div>
	</div>
</body>
</html>