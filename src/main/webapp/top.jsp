<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<head>
<meta charset="UTF-8">
<title>top</title>
</head>
<body>
	
	<div class="wrapper row1">
	<div id="logo" style="display:flex; justify-content: flex-end; ">
	<% 
            String master = (String)session.getAttribute("MLoginID");
            String id = (String)session.getAttribute("LoginID");
            //	로그인을 하지 않은 상태
            if(master==null && id==null)
            {
            %>
               <a href="login.jsp" style = "padding: 5px 10px 8px 0px; color: black;" > 로그인 </a>
               <a href="join.jsp" style = "padding: 5px 10px 8px 0px; color: black;"> 회원가입 </a> 
            <%
            } else {
            %>
            	<a href=# style = "padding: 5px 10px 8px 0px; ;">마이페이지</a>
            <%
            }
            %>
            </div>
    </div>
    
	<div class="wrapper row3">
    <header id="header" class="hoc clear"> 
       <div id="logo" class="fl_left">
       
        <h1><a href="main.jsp"><img alt="logo" src="images/logo.png" style="width:120px"/></a></h1>
      </div>
      <nav id="mainav" class="fl_right">
        <ul class="clear">
          <li class="active"><a href="main.jsp">Home</a></li>
          <li><a class="drop" href="#">테스트</a>
            <ul>
              <li><a href="#">연예</a></li>
              <li><a href="#">퀴즈</a></li>
              <li><a href="#">심리</a></li>
              <li><a href="#">유형</a></li>
            </ul>
          </li>
          <li><a href="#">커뮤니티</a></li>
          <li><a href="#">MBTI?</a></li>
        </ul>
      </nav>
      </header>
      </div>
</body>
</html>