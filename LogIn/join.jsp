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
<link rel="stylesheet" type="text/css" href="css/join.css">
<title>회원가입</title>

<style type="text/css">
	body {
		background-image : url(img/back.png);
		background-repeat : no-repeat;
		background-size : cover;
	}
</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	// 아이디 중복 확인
	function idChk() {
		var doc = document.getElementsByName("myid")[0];
		if(doc.value.trim()=="" || doc.value==null) {
			alert("아이디를 입력해주세요.");
		} else {
			var target = "logincontroller.jsp?command=idchk&id=" + doc.value.trim();
			open(target, "", "width=200, height=200");
		}
	}
	
	function idChkContirm() {
		var chk = document.getElementsByName("myid")[0].title;
		if(chk == 'n') {
			alert("아이디 중복체크를 해주세요");
			document.getElementsByName("myid")[0].focus();
		}
	}
	
	
	// 비밀번호 일치 확인
	function check_pw() {
		var pw = document.getElementById("pw").value;
		
		if(document.getElementById("pw").value != '' && document.getElementById("pw2").value != ''){
            if(document.getElementById("pw").value==document.getElementById("pw2").value){
                document.getElementById("check").innerHTML='비밀번호가 일치합니다.'
                document.getElementById("check").style.fontSize="11px";
                document.getElementById("check").style.color="blue";
            }
            else{
                document.getElementById("check").innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById("check").style.fontSize="11px";
                document.getElementById("check").style.color="red";
            }
        }
	}
	
	// 핸드폰 번호 자동 하이픈 입력
	function inputPhoneNumber(obj) {
		var number = obj.value.replace(/[^0-9]/g, "");
		var phone = "";
		if(number.length < 4) {
			return number;
		} else if(number.length < 7) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3);
		} else if(number.length < 11) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 3);
			phone += "-";
			phone += number.substr(6);
		} else {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 4);
			phone += "-";
			phone += number.substr(7);
		}
		obj.value = phone;
	}


	// 우편번호
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

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
<form action="logincontroller.jsp" method="post">
  <input type="hidden" name="command" value="insertuser">
  <div class="textwrap">
    <div class="imgbg">
      <img src="img/bgimg.png" class="bgimg" width="1185px" height="590px" style="box-shadow:10px 10px 40px 5px #898989;">
    </div>
    <div class="maintext">
      <div class="container"><br>
	  <h1 style="text-align:left; margin-left:30px; margin-left:30px; letter-spacing:3px;">SIGN UP</h1>
	  <p class="required">
	    <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
	    필수 입력 사항
	  </p>
	  <div class="base_table">
	  <table>
		<tbody>
		  <tr>
		    <th>
			  아이디 <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"><br>
			  <input type="text" name="myid" title="n" required>&nbsp;
			  <input type="button" value="중복확인" onclick="idChk();">
			</th>
		    <th>
			  이름 <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"><br>
			  <input type="text" name="myname" onclick="idChkConfirm();" required>
			</th>
		  </tr>
		  <tr>
		    <th>
		      비밀번호 <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"><br>
		      <input type="password" name="mypw" id="pw" onclick="idChkConfirm();" onchange="check_pw()" required>
		    </th>
		    <th id="pwChk">
			  비밀번호 확인 <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"><br>
			  <input type="password" id="pw2" onchange="check_pw()">&nbsp;<span id="check"></span>
			</th>
		  </tr>
		  <tr>
		    <th>
			  주소 <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"><br>
			  <input type="text" name="mypostcode" id="sample6_postcode" onclick="idChkConfirm();" required>&nbsp;
			  <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호  >"><br>
			  <input type="text" name="myaddr" id="sample6_address" style="margin-top:5px;" placeholder="  주소"><br>
			  <input type="text" name="myadd_addr" id="sample6_detailAddress" style="margin-top:5px;" placeholder="  상세주소"><br>
			  <input type="text" id="sample6_extraAddress" placeholder="  참고항목">
			</th>
		    <th>
		      휴대전화 <img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"><br>
		      <input type="text" size="5" name="myphone" onKeyup="inputPhoneNumber(this);" maxlength="13" onclick="idChkConfirm();"  required><br>
		      
	          성별<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          <input type="radio" id="female" name="gender" value="F" checked><label for="female"> 여자</label>
	          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	  <input type="radio" id="male" name="gender" value="M"><label for="male"> 남자</label>
		    </th>
		  </tr>
		</tbody>
	  </table>
	  </div>
      </div>
	<div class="button">
      <input type="submit" class="btn_image" value="Sign Up!"><br>
    </div>
  </div>
  </div>
</form>
    
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