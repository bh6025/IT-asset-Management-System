<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>asset Management</title>
    
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
      	
      	<!-- @@@@@@ IT 자산 검색 @@@@@@ -->
      	
      	<form class="form-signin" name="select_machine" action="assetSearch.do" method="post">
            <div class="form-group" id="item">
                <label for="inputItem" class="col-lg-1 control-label">자산유형</label>
                <div class="col-lg-2">
                    <select class="form-control" name="category" id="category" onChange="showSub(this.options[this.selectedIndex].value);">
                    	<option value ="NULL">----</option>
                        <option value ="PC">PC</option>
                        <option value ="HW">HW</option>
                        <option value ="SV">SV</option>
                        <option value ="NW">NW</option>  
                        <option value ="SW">SW</option>                                              
                    </select>
                </div>
            </div>
            
            <div class="form-group" id="item">
                <label for="inputItem" class="col-lg-1 control-label">자산명</label>
            </div>
            

            <div class="form-group" id="option">
            
                    <select class="form-control" name="NULL" id="NULL" style="display: ;max-width:15%;">
                        <option value ="NULL">----</option>                     
                    </select>
            
                    <select class="form-control" name="PC" id="PC" style="display: none;max-width:15%;">
                        <option value ="NULL">----</option> 
                        <option value ="Desktop">Desktop</option>
                        <option value ="Notebook">Notebook</option>                        
                        <option value ="etc">etc</option>                       
                    </select>

                    <select class="form-control" name="HW" id="HW" style="display: none;max-width:15%;">
                        <option value ="NULL">----</option>                     
                        <option value ="Storage">Storage</option>
                        <option value ="HW parts">HW parts</option> 
                        <option value ="etc">etc</option> 
                    </select>


                    <select class="form-control" name="SV" id="SV" style="display: none;max-width:15%;">
                    	<option value ="NULL">----</option>
                        <option value ="Windows server">Windows server</option>
                        <option value ="Unix server">Unix server</option>                        
                        <option value ="Linux server">Linux server</option>                       
                        <option value ="etc">etc</option> 
                    </select>

                    <select class="form-control" name="NW" id="NW" style="display: none;max-width:15%;">
                    	<option value ="NULL">----</option>
                        <option value ="Router">Router</option>
                        <option value ="Switch">Switch</option>                        
                        <option value ="Hub">Hub</option>                       
                        <option value ="etc">etc</option> 
                    </select>
  

                    <select class="form-control" name="SW" id="SW" style="display: none;max-width:15%;">
                    	<option value ="NULL">----</option>
                        <option value ="Windows server">OS</option>
                        <option value ="Unix server">DBMS</option>                        
                        <option value ="Linux server">MiddleWare</option>
                        <option value ="Development Tool">Development Tool</option>                       
                        <option value ="etc">etc</option> 
                    </select>
                   </div>                     
            <div class="form-group" id="item">
                <label for="inputItem" class="col-lg-1 control-label">제품명</label>
                <div class="col-lg-3">
                	<input type="text" name="productName" id="productName" class=form-control placeholder = "제품명 직접입력">
                </div>
            </div>
            
            <div class="form-group" id="search">
                <div class="col-lg-2">
                    <input type="text" name="regiUser" id="regiUser" class=form-control placeholder = "등록자">
                </div>
                 <div class="col-lg-2">
                    <input type="text" name="regiState" id="regiState" class=form-control placeholder = "자산상태">
                </div>
                <div class="col-lg-2">
                    <input type="text" name="location" id="location" class=form-control placeholder = "위치">
                </div>
            </div>
       	  <button class="btn btn-primary" type="submit">검색하기</button>
        </form>
      	<br>
      	
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
	  	      <button class="btn-warning" onclick="location.href='assetModify.jsp?code=${assets.code}&location=${assets.location}&regiState=${assets.regiState}'">수정</button>
	  	      <button class="btn-danger" onclick="location.href='assetDelete.do?code=${assets.code}'">완전삭제</button>
	  	      </td>
	  	    </tr>
	  	  </c:forEach>
	  	</tbody>
	  </table>
    </div>
<script language = "javascript"> 
function showSub(obj) {
    f = document.forms.select_machine;

    if(obj == "NULL") {
        f.NULL.style.display = "";
        f.PC.style.display = "none";
        f.HW.style.display = "none";
        f.SV.style.display = "none";
        f.NW.style.display = "none";
        f.SW.style.display = "none";
    } else if(obj == "PC") {
        f.NULL.style.display = "none";
        f.PC.style.display = "";
        f.HW.style.display = "none";
        f.SV.style.display = "none";
        f.NW.style.display = "none";
        f.SW.style.display = "none";
    } else if(obj == "HW") {
    	f.NULL.style.display = "none";
    	f.PC.style.display = "none";
        f.HW.style.display = "";
        f.SV.style.display = "none";
        f.NW.style.display = "none";
        f.SW.style.display = "none";
    } else if (obj == "SV"){
    	f.NULL.style.display = "none";
    	f.PC.style.display = "none";
        f.HW.style.display = "none";
        f.SV.style.display = "";
        f.NW.style.display = "none";
        f.SW.style.display = "none";
     } else if (obj == "NW"){
    	 f.NULL.style.display = "none";
    	 f.PC.style.display = "none";
         f.HW.style.display = "none";
         f.SV.style.display = "none";
         f.NW.style.display = "";
         f.SW.style.display = "none";
      } else if (obj == "SW"){
    	  f.NULL.style.display = "none";
    	  f.PC.style.display = "none";
          f.HW.style.display = "none";
          f.SV.style.display = "none";
          f.NW.style.display = "none";
          f.SW.style.display = "";
       }
}
</script> 

  </body>
</html>
