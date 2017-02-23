<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>user Management</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
  </head>

  <body background = "loginLotte.jpg">
    <div class="container">
      <%
      	session = request.getSession();
      	String id = (String) session.getAttribute("id");
      	String grade = (String) session.getAttribute("grade");
      	String gradeName;
      %>	
      <h2 class="form-signin-heading">롯데 IT 자산 관리 시스템</h2>
      <%
      	if(grade.compareTo("1") == 0){
      		gradeName = "Master";
      %>
      	<p align="right"><button type="button" class="btn btn-default" onclick="window.location.href='loginMaster.jsp';">메인으로</button>
      	<button type="button" class="btn btn-danger" onclick="window.location.href='login.jsp';">로그아웃</button></p>
      <%
      	}else if(grade.compareTo("2") == 0){
      		gradeName = "Administer";
      %>
      	<p align="right"><button type="button" class="btn btn-default" onclick="window.location.href='loginAdminister.jsp';">메인으로</button>
      	<button type="button" class="btn btn-danger" onclick="window.location.href='login.jsp';">로그아웃</button></p>
      <% }else {
    		gradeName = "Member";
      %>
      	<p align="right"><button type="button" class="btn btn-default" onclick="window.location.href='loginMember.jsp';">메인으로</button>
      	<button type="button" class="btn btn-danger" onclick="window.location.href='login.jsp';">로그아웃</button></p>
      <% } %>

      	<p class="text-right"><%= "사용자 ID : " + id + "   사용자 등급 : " + gradeName%></p>
	  <table class="table table-striped">
	  	<thead>
	  	  <tr>
	  	    <th>#</th>
	  	    <th>userID</th>
	  	    <th>userPW</th>
	  	    <th>grade</th>
	  	    <th>name</th>
	  	    <th>수정</th>
	  	  </tr>
	  	</thead>
	  	<tbody>
	  	  <c:forEach items="${users}" var="users" varStatus = "status">
	  	  	<tr>
	  	  	  <td>${status.count}</td>
	  	  	  <td>${users.id}</td>
	  	  	  <td>${users.pw}</td>
	  	  	  <td>${users.grade}</td>
	  	  	  <td>${users.name}</td>
	  	  	  <td>
	  	      <button class="btn-info" onclick="location.href='userGradeUp.do?userID=${users.id}'">등급업</button>
	  	      <button class="btn-warning" onclick="location.href='userGradeDown.do?userID=${users.id}'">등급다운</button>
	  	      <button class="btn-danger" onclick="location.href='userDelete.do?userID=${users.id}'">아이디폐기</button>
	  	      </td>
	  	    </tr>
	  	  </c:forEach> 
	  	</tbody>
	  </table>
    </div> 
  </body>
</html>
