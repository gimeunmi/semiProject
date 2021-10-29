<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/email.css">
<title>회원가입</title>

<style type="text/css">
	body {
		background-image : url(img/back.png);
		background-repeat : no-repeat;
		background-size : cover;
	}
</style>

<!-- 5자리 숫자로 이루어진 인증번호를 랜덤으로 생성 -->
<%!
	public int getRandom() {
		int random = 0;
		random = (int)Math.floor((Math.random()*(99999-1000000+1))) + 10000;
		return random;
	}
%>
</head>
<body>
  <div>
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
		  <li><a href="#">쇼핑 플렛폼</a></li>
	    </ul>
      </div>
  	</div>
  <!------------------------------------------- 헤더 영역 ------------------------------------------->
  <br><br><br><br>
  <div class="textwrap">
    <div class="imgbg">
      <img src="img/bgimg.png" class="bgimg" width="1185px" height="590px" style="box-shadow:10px 10px 40px 5px #898989;">
    </div>
    <div class="maintext">
      <div class="container"><br>
	  <h1 style="text-align:left; margin-left:30px; font-size:35px; letter-spacing:3px;">SIGN UP</h1>
	  <p>
	    <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
	  	&nbsp;회원가입을 위해 이메일 인증을 해주세요.
	  </p>
	  <div class="base_table"><br><br><br>
	<form action="/send" method="post" id="form1">
	  <table>
	  	<tr>
	  	  <td><input type="text" id="receiver" name="receiver" placeholder="  이메일을 입력하세요."></td>
	  	  <td><input type="submit" id="submit" value="인증번호발송"></td>
	  	  <td><input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=getRandom()%>"></td>
	  	</tr>
	  </table>
	</form>
	  </div>
      </div><br><br><br><br><br><br><br>
	<div class="button">
      <input type="submit" class="btn_image" value="                                               Next Step                                             >"><br>
    </div>
    <div class="sign_in">
      Already have an account? <a href="#">Sign in</a>
    </div>
  </div>
  </div>
    
    <br><br><br><br><br>
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
</body>
</html>