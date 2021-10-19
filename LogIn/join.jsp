<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style type="text/css">
	.parent {
		display: flex;
	}
	.child {
		flex:1;
	}
	.left-box {
		text-align:left;
	}
	.right-box {
		text-align:right;
	}
	.main-container {
		text-align:center;
	}
	.top_main-container {
		text-align:center;
	}
	.right-box > button {
		position:realtive;
		background-color:white;
		color:skyblue;
		border-radius:38%;
		border:1px solid skyblue;
		margin-right:5px;
	}
	.left-box > button {
		background-color:transparent !important;
		background-image:none !important;
		border-color:transparent;
		margin:0;
		border: none;
		color:#FFFFFF;
		outline: 0;
	}
	.top_main-container > button {
		background-color:transparent !important;
		background-image:none !important;
		border-color:transparent;
		margin-top:20px;
		margin-bottom:15px;
	}
	
	
	
	.wrap {
		position : relative;
		width : 1200px;
		margin : 0 auto;
	}
	.container {
		width : 1200px;
		margin : 0 auto;
	}
	.info {
		float : left;
		margin-left : 90px;
	}
	.required {
		float : right;
		margin-right : 90px;
		padding-top : 8px;
		font-size : 12.5px;
	}
	.base_table {
		margin-top : 84px;
	}
	th {
		text-align : left;
		font-size : 14px;
	}
	td {
		font-size : 11px;
	}
	th, td {
		border-bottom: 1px solid #d3d3d3;
    	padding: 12px;
	}
	table {
		width : 85%;
		margin : auto;
		border-top: 1px solid #d3d3d3;
    	border-collapse: collapse;
	}
	input {
		border: 1px solid #d3d3d3;
	}
	.btn_image {
		border : none;
		background-color : #3A3A3A;
		width : 160px;
		height : 55px;
		cursor : pointer;
		font-size : 16px;
		color : white;
	}
	.button {
		width : 10%;
		margin : auto;
	}
</style>


</head>

<body>
	<div style="text-align:center" >
		<img src="./logo/logo_tmp.png" onclick="location.href='Main.jsp'">
	</div>
	<hr>
	<div class="parent">
		<div class="child">
		   <div class="left-box">
		      <button onclick="window.open('https://www.instagram.com')"><img src="./img/Instagram.png" width="50px" height="30px"></button>
		      <button onclick="window.open('https://www.facebook.com')"><img src="./img/facebookicon.png" width="50px" height="30px"></button>
		   </div>
		</div>
		<div class="child">
		   <div class="top_main-container">
		      <button type="button" id="about_info" value="" onclick="">ABOUT</button>
		      <button type="button" id="Report_LostAnimals" value="" onclick="">유실동물 제보</button>
		      <button type="button" id="Center_location" value="" onclick="">유실동물 제보</button>
		      <button type="button" id="Adoption_review" value="" onclick="">입양후기</button>
		      <button type="button" id="Go_ShoppingHome" value="" onclick="">입양후기</button>
		   </div>
		</div>
		<div class="child">
		   <div class="right-box">
		      <button type="button" id="mem_reg" value="" onclick="">회원가입</button>
		      <button type="button" id="login" value="" onclick="">로그인</button>
		      <button type="button" id="mypage" value="" onclick="">마이페이지</button>
		      <button type="button" id="searching" value="" onclick="">검색</button>   
		   </div>
		</div>
	</div>
	<!------------------------------------------- 헤더영역 ------------------------------------------->
<br><br><br><br>
<div class="wrap">
  <div class="container">
	<h1 style="text-align:center">SIGN UP</h1>
	<h3 class="info">기본정보</h3>
	<p class="required">
	  <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
	  필수 입력 사항
	</p>
	<div class="base_table">
	  <table>
	    <colgroup>
		  <col style="width:150px;">
		  <col style="width:auto;">
	    </colgroup>
	    
		<tbody>
		  <tr>
		    <th>
			  아이디 <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
			</th>
			<td>
			  <input type="text" name="id"> 아이디는 영문소문자 또는 숫자 4~16자로 입력해 주세요. (영문소문자/숫자, 4~16자)			    
			</td>
		  </tr>
		  <tr>
		    <th>
		      비밀번호 <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
		    </th>
		    <td>
		      <input type="password" name="pw"> (영문 대소문자/숫자 4자~16자)
		    </td>
		  </tr>
		  <tr>
		    <th>
			  비밀번호 확인 <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
			</th>
			<td>
			  <input type="password">
			</td>
		  </tr>
		  <tr>
		    <th>
			  이름 <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
			</th>
			<td>
			  <input type="text" name="name">
			</td>
		  </tr>
		  <tr>
		    <th>
			  주소 <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
			</th>
			<td>
			  <input type="text" size="4" name="postcode">&nbsp;
			  <img src="https://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_zipcode.gif" alt="우편번호" style=""><br>
			  <input type="text" size="35" name="addr"> 기본주소<br>
			  <input type="text" size="35" name="add_addr"> 나머지주소			  
			</td>
		  </tr>
		  <tr>
		    <th>
			  이메일 <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
			</th>
			<td>
			  <input type="text" name="email">
			</td>
		  </tr>
		  <tr>
		    <th>
		      휴대전화 <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
		    </th>
		    <td>
		      <select style="border: 1px solid #d3d3d3;">
	            <option value="010">010</option>
	            <option value="011">011</option>
	            <option value="016">016</option>
	            <option value="017">017</option>
	            <option value="018">018</option>
	            <option value="019">019</option>
	      	  </select>
	      	  - <input type="text" size="5"> - <input type="text" size="5">
		    </td>
		  </tr>
		</tbody>
	  </table>
	</div>
	<br><br>
    <h3 style="margin-left:90px">추가정보</h3>
    <div>
      <table>
        <colgroup>
		  <col style="width:150px;">
		  <col style="width:auto;">
	    </colgroup>
	    
	    <tbody>
	      <tr>
	        <th>
	          생년월일
	        </th>
	        <td>
	          <input type="text" size="7"> 년 &nbsp;<input type="text" size="5"> 월 &nbsp;<input type="text" size="5"> 일
	        </td>
	      </tr>
	      <tr>
	        <th>
	          성별
	        </th>
	        <td>
	          <input type="radio" id="female" name="gender" value="F" checked><label for="female">여자</label>
        	  &nbsp;<input type="radio" id="male" name="gender" value="M"><label for="male">남자</label>
	        </td>
	      </tr>
	    </tbody>
      </table>
    </div>
    <br><br><br>
    <div class="button">
      <input type="button" class="btn_image" value="회원가입" onclick="location.href='controller.do?command=join'">
    </div>
  </div>
</div>
</body>
</html>