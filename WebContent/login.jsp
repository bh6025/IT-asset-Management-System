<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>LOGIN</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
  </head>

  <body background = "loginLotte.jpg" >
    <div class="container">
      <form class="form-signin" action="loginConfirm.do" method="post">
      <h2 class="form-signin-heading">롯데 IT 자산 관리 시스템</h2>
      
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="text" name="userID" id="inputEmail" class="form-control" placeholder="ID" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="userPW" id="inputPassword" class="form-control" placeholder="Password">
        
       	<button class="btn btn-md btn-primary btn-block" type="submit">Log-in</button>
      </form>
    </div> 
  </body>
</html>
