<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html;charset=UTF-8"); %>

    
<%@ page import="com.prj.dao.loginDao" %>
<%@ page import="com.prj.dto.loginDto" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/login.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   	<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript">


	Kakao.init('735931396e4ab6619c456beb62b3d51b');
	console.log(Kakao.isInitialized());

	 function loginWithKakao() {
		 Kakao.Auth.login({
		      success: function (response) {
				 Kakao.API.request({
					url: '/v2/user/me',
					success: function (response) {
						
					console.log(response);
					
					var email = response.kakao_account.email;
        			var gender = response.kakao_account.gender;
					
        			//location.href='controller.do?command=kakao&email='+email+"&gender="+gender;
					location.href='controller.do?command=main';


				
				},
				fail: function (error) {
					console.log(error)
				 },
			        })
			      },
			      fail: function (error) {
			        console.log(error)
			      },
			    })

	 }
	 

	</script>
</head>
<body>
    <section class="login-form">
        <h1>LOGIN</h1>
        <form action="controller.do" method="post" id="form">
        	<input type="hidden" name="command" value="login">
         	 <div class="int-area">
              <input type="text" name="id" id="id" autocomplete="off" required>
           		 <label for="id">ID</label>
          	</div>
          	<div class="int-area">
              <input type="password" name="pw" id="pw" autocomplete="off" required>
            	<label for="pw">PASSWORD</label>
          	</div>
         	 <br>
          	<div class ="btn-form">
           		<div class="btn-area">
            		 <button type="submit" id="btn">LOGIN</button>
            	</div>
            	<div class="btn-area">
              		<input type="button" value="SIGN WITH EMAIL" id="email" onclick="location.href='controller.do?command=joinform'">
           		</div>
             	<div class="btn-area">
            		<input type="button" value="SIGN WITH KAKAO" id="kakao" onclick="loginWithKakao()">
            		<p id="token-result"></p>
           		</div>
       		 </div>
           </form>
          <div class="caption">
            <a href="">Forgot Password?</a>
          </div>

    </section>


<script type="text/javascript">


      let id = $('#id'); 
      let pw = $('#pw');
      let btn = $('#btn');
  

      $(btn).on('click',function(){
        if($(id).val()==""){
          $(id).next('label').addClass('warning');
          setTimeout(function(){
            $('label').removeClass('warning')
          },1500);
        }
        else if($(pw).val()==""){
          $(pw).next('label').addClass('warning');
          setTimeout(function(){
            $('label').removeClass('warning')
          },1500);
        }
      });


    




      </script>


</body>
</html>