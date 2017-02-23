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
      	  <form class="form-signin" name="select_machine" action="registerAsset.do" method="post">

            <div class="form-group" id="item">
                <label for="inputItem" class="col-lg-1 control-label">자산유형</label>
                <div class="col-lg-2">
                    <select class="form-control" name="category" id="category" onChange="showSub(this.options[this.selectedIndex].value);">
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
            
                    <select class="form-control" name="PC" id="PC" style="display: ;max-width:15%;">
                        <option value ="Desktop">Desktop</option>
                        <option value ="Notebook">Notebook</option>                        
                        <option value ="etc">etc</option>                       
                    </select>

                    <select class="form-control" name="HW" id="HW" style="display: none;max-width:15%;">                    
                        <option value ="Storage">Storage</option>
                        <option value ="HW parts">HW parts</option>
                        <option value ="etc">etc</option> 
                    </select>


                    <select class="form-control" name="SV" id="SV" style="display: none;max-width:15%;">
                        <option value ="Windows server">Windows server</option>
                        <option value ="Unix server">Unix server</option>                        
                        <option value ="Linux server">Linux server</option>                       
                        <option value ="etc">etc</option> 
                    </select>

                    <select class="form-control" name="NW" id="NW" style="display: none;max-width:15%;">
                        <option value ="Router">Router</option>
                        <option value ="Switch">Switch</option>                        
                        <option value ="Hub">Hub</option>                       
                        <option value ="etc">etc</option> 
                    </select>
  

                    <select class="form-control" name="SW" id="SW" style="display: none;max-width:15%;">
                        <option value ="OS">OS</option>
                        <option value ="DBMS">DBMS</option>                        
                        <option value ="MiddleWare">MiddleWare</option>
                        <option value ="Development Tool">Development Tool</option>                       
                        <option value ="etc">etc</option> 
                    </select>
                   </div> 
            
            <div class="form-group" id="productName">
                <label for="inputName" class="col-lg-1 control-label">제품명</label>
                <div class="col-lg-3">
                    <input type="text" name="productName" id="productName" class=form-control>
                </div>
            </div>
            
            <div class="form-group" id="regiState">
                <label for="inputMajor" class="col-lg-1 control-label">자산 상태</label>
                <div class="col-lg-3">
                    <select class="form-control" name="regiState" id="regiState">
                        <option>introduction</option>
                        <option>in use</option> 
                        <option>idle</option> 
                        <option>discard</option>                                                                     
                    </select>
                </div>
            </div>
            
            <div class="form-group" id="location">
                <label for="inputName" class="col-lg-1 control-label">위치</label>
                <div class="col-lg-3">
                    <input type="text" name="location" id="location" class=form-control>
                </div>
            </div>
            <br><br>
       	  <button class="btn btn-md btn-primary btn-block" type="submit">자산 등록하기</button>
        </form>
      </div>
      <script language = "javascript"> 
function showSub(obj) {
    f = document.forms.select_machine;

    if(obj == "PC") {
        f.PC.style.display = "";
        f.HW.style.display = "none";
        f.SV.style.display = "none";
        f.NW.style.display = "none";
        f.SW.style.display = "none";
    } else if(obj == "HW") {
    	f.PC.style.display = "none";
        f.HW.style.display = "";
        f.SV.style.display = "none";
        f.NW.style.display = "none";
        f.SW.style.display = "none";
    } else if (obj == "SV"){
		f.PC.style.display = "none";
        f.HW.style.display = "none";
        f.SV.style.display = "";
        f.NW.style.display = "none";
        f.SW.style.display = "none";
     } else if (obj == "NW"){
    	 f.PC.style.display = "none";
         f.HW.style.display = "none";
         f.SV.style.display = "none";
         f.NW.style.display = "";
         f.SW.style.display = "none";
      } else if (obj == "SW"){
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
