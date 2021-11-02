<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<li><a href="MainPage.jsp">HOME</a></li>
						<li><a href="#about">ABOUT</a></li>
						<li><a href="#">유기동물 공고</a></li>
						<li><a href="Mail.jsp">유기동물 제보</a></li>
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
				<div class="main_text01">
				<h1 id="about">ABOUT</h1>
				<div class="contents1">사지말고 입양하세요</div>
				
			<!-- amount end -->
			<!-- mail start -->
				<form method="post" class="gform" data-email="example@email.net"
					action="https://script.google.com/macros/s/AKfycbwPgep2yk-CPjB2LT-2UBYn0I6dsxhbi9h1QSGcQzYsVjYMTwY/exec"
					enctype="multipart/form-data">
					<table border="1" cellpadding="0" cellspacing="0">
						<tr>
							<td>Title</td>
							<td><input type="text" name="name" size="40"></td>
						</tr>
						<tr>
							<td>Email</td>
							<td><input type="text" name="email" size="40"></td>
						</tr>
						<tr>
							<td>Content</td>
							<td><textarea name="message" rows="10" cols="40"></textarea></td>
						</tr>

						<tr>
							<td>File</td>
							<td><input type="file" name="attachment"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="Submit"></td>
						</tr>
					</table>
				</form>

				<!-- mail end -->


			<!-- footer start -->
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