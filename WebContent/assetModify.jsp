<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>register Asset</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
  </head>

  <body background = "loginLotte.jpg" >
      <div class="container">
      <%
      	session = request.getSession();
      	String id = (String) session.getAttribute("id");
      	String grade = (String) session.getAttribute("grade");
      	String gradeName;
      	String code = request.getParameter("code");
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
      	  
      	  <form class="form-signin" action="assetModify.do" method="post">
            <div class="form-group" id="assetName">
                <label for="inputName" class="col-lg-2 control-label">자산명</label>
                <div class="col-lg-10">
                    <label class="col-lg-2 control-label"> <%= code %></label>
                    <input type="hidden" name ="code" value="<%=code%>">
                </div>
            </div>
            
            <div class="form-group" id="modiState">
                <label for="inputMajor" class="col-lg-2 control-label">자산 상태</label>
                <div class="col-lg-10">
                    <select class="form-control" name="modiState" id="modiState">
                        <option>inProgress</option>
                        <option>developing</option> 
                        <option>not used</option> 
                        <option>trash</option>                                                                     
                    </select>
                </div>
            </div>
            <div class="form-group" id="modiLocation">
                <label for="inputName" class="col-lg-2 control-label">위치</label>
                <div class="col-lg-10">
                    <input type="text" name="modiLocation" id="modiLocation" class=form-control>
                </div>
            </div>
       	  <button class="btn btn-md btn-primary btn-block" type="submit">자산 수정하기</button>
        </form>
      </div>
  </body>
</html>
