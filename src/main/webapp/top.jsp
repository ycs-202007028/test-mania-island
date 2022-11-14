<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<head>
<meta charset="UTF-8">
<title>top</title>
</head>
<body>

	<div class="wrapper row1">
		<div id="logo" style="display: flex; justify-content: flex-end;">
			<% 
		String manager = (String)session.getAttribute("manager");
		String userID = null;
		//	로그인을 하지 않은 상태
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(session.getAttribute("manager") != null)
			manager = (String)session.getAttribute("manager");

			if(userID == null && manager == null){
		%>
			<a href="login.jsp"
				style="padding: 5px 10px 8px 0px; color: black; font-size: large;">
				로그인 </a> <a href="join.jsp"
				style="padding: 5px 10px 8px 0px; color: black; font-size: large;">
				회원가입 </a>
			<%
			} else if(userID != null && manager == null) {
		
            %>
			<a href="mypages.jsp"
				style="padding: 5px 10px 8px 0px; color: black; font-size: large;">마이페이지</a>
			<a href="logoutOK.jsp"
				style="padding: 5px 10px 8px 0px; color: black; font-size: large;">로그아웃</a>
			<%
            } else{
            	%>
    			<a href="managerUser.jsp"
    				style="padding: 5px 10px 8px 0px; color: black; font-size: large;">관리자 페이지</a>
    			<a href="user_Drop.jsp"
    				style="padding: 5px 10px 8px 0px; color: black; font-size: large;">회원 삭제</a>
    			
    			<a href="logoutOK.jsp"
    				style="padding: 5px 10px 8px 0px; color: black; font-size: large;">로그아웃</a>
    			<%
            }
            %>
		</div>
	</div>

	<div class="wrapper row3" style="font-size: large;">
		<header id="header" class="hoc clear">
			<div id="logo" class="fl_left">

				<h1>
					<a href="main.jsp">
					<img alt="logo" src="images/logo.png" style="margin-top: auto; margin-bottom: auto; width: 120px;
					display: flex; justify-content: flex-start;" /></a>
				</h1>
			</div>
			<nav id="mainav" class="fl_right">
				<ul class="clear" style="margin-top: auto; margin-bottom: auto; display: flex; justify-content: flex-end;">
					<li class="active"><a href="main.jsp">Home</a></li>
					<li><a class="drop" href="#">테스트</a>
						<ul>
							<li><a href="gallery.jsp?kind=banggoosuk">방구석 연구소</a></li>
							<li><a href="gallery.jsp?kind=ktest">ktest</a></li>
							<li><a href="gallery.jsp?kind=etc">기타</a></li>
						</ul></li>
					<li><a href="board.jsp">커뮤니티</a></li>
					<li><a href="MBTI.jsp">MBTI?</a></li>
				</ul>
			</nav>
		</header>
	</div>
	<hr>
</body>
</html>