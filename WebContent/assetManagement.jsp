<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>LOGIN</title>
    
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
	  	    <th>자산코드</th>
	  	    <th>자산유형</th>
	  	    <th>도입일자</th>
	  	    <th>자산명</th>
	  	    <th>제품명</th>
	  	    <th>등록자</th>
	  	    <th>자산상태</th>
	  	    <th>위치</th>
	  	    <th>수정</th>
	  	  </tr>
	  	</thead>
	  	<tbody>
	  	  <c:forEach items="${assets}" var="assets" varStatus = "status">
	  	  	<tr>
	  	  	  <td>${status.count}</td>
	  	  	  <td>${assets.code}</td>
	  	  	  <td>${assets.category}</td>
	  	  	  <td>${assets.regiDatetime}</td>
	  	  	  <td>${assets.assetName}</td>
	  	  	  <td>${assets.productName}</td>
	  	  	  <td>${assets.regiUser}</td>
	  	  	  <td>${assets.regiState}</td>
	  	  	  <td>${assets.location}</td>
	  	  	  <td>
	  	      <button class="btn-info" onclick="location.href='assetLog.do?code=${assets.code}'">로그</button>
	  	      <button class="btn-warning" onclick="location.href='assetModify.jsp?code=${assets.code}'">수정</button>
	  	      <button class="btn-danger" onclick="location.href='assetDelete.do?code=${assets.code}'">완전삭제</button>
	  	      </td>
	  	    </tr>
	  	  </c:forEach>
	  	</tbody>
	  </table>
    </div> 
  </body>
</html>
