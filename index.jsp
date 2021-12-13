<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html;charset=UTF-8"); %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="login.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
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
            <input type="button" value="SIGN WITH KAKAO" id="kakao">
           </div>
        </div>
           </form>
          <div class="caption">
            <a href="">Forgot Password?</a>
          </div>

    </section>

    <script>
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