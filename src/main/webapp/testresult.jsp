<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML>
<html lang="kr">
<head>
<style>
ul {
	background: #FFC000;
	padding: 6px;
	text-align: right;
}

#mar {
	margin: 15px 25px 15px 0px;
}

#rego {
	border: none;
	border-radius: 20px;
	width: 200px;
	height: 50px;
	background: #FFC000;
	top: 200px;
	left: 1300px;
	position: absolute;
	text-align: center;
	color: white;
	display: block;
	vertical-align: middle;
	font-size: 15pt;
	font-weight: bold;
}

#submit {
	border: none;
	border-radius: 20px;
	width: 100px;
	height: 50px;
	background: #FFC000;
	top: 650px;
	left: 900px;
	position: absolute;
	text-align: center;
	color: white;
	display: block;
	vertical-align: middle;
	font-size: 15pt;
	font-weight: bold;
}

#comment-input {
	border-style: bold;
	border-bottom-color: #FFC000;
	border-right: 0px;
	border-top: 0px;
	border-left: 0px;
}

#other {
	border: none;
	border-radius: 20px;
	width: 210px;
	height: 50px;
	background: #FFC000;
	top: 700px;
	left: 70px;
	position: absolute;
	text-align: center;
	color: white;
	display: block;
	vertical-align: middle;
	font-size: 15pt;
	font-weight: bold;
}

#back {
	border-color: #FFC000;
	border-radius: 20px;
	width: 1500px;
	height: 250px;
	background: #FFFFFF;
	top: 715px;
	left: 50px;
	position: absolute;
}
</style>
<title>테스트 결과</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="../layout/styles/layout.css" rel="stylesheet"
	type="text/css" media="all">
</head>
<body id="top">
	<!-- Top Background Image Wrapper -->
	<jsp:include page="top.jsp" flush="false" />

	<br>
	<br>
	<br>
	<hr>
	<p>
		<%
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  String id = request.getParameter("t_id");
  String content = "";
  String img = "";
  String title = "";
  String sql;
  int count;
  int i = 0;

  try{
  	String jdbcUrl = "jdbc:mysql://localhost:3306/BBS?useUnicode=yes&characterEncoding=UTF8";
  	String dbId = "root";
  	String dbPass = "root";
  	Class.forName("com.mysql.jdbc.Driver");
  	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
  	
  	sql = "select count(*) from test_result where t_id = ?";
  	pstmt = conn.prepareStatement(sql);
  	pstmt.setString(1,id);
  	rs = pstmt.executeQuery();
  	
  	while(rs.next()){
  		count = Integer.parseInt(rs.getString(1));
  	}
  	
  	//test에서 타이틀, 테스트 종류, 테스트 상세, 테스트 이미지 불러오기
  	sql = "select r_content, r_img from test_result where t_id = ? and s_id = ?";
  	pstmt = conn.prepareStatement(sql);
  	pstmt.setString(1, id);
  	pstmt.setString(2, Integer.toString(i+1));
  	rs = pstmt.executeQuery();
  	
  	while(rs.next()){
  		content = rs.getString("r_content");
  		img = rs.getString("r_img");  		
  	}
  	
  	sql = "select t_title from test where t_id = ?";
  	pstmt = conn.prepareStatement(sql);
  	pstmt.setString(1, id);
  	rs = pstmt.executeQuery();
  	
  	while(rs.next()){
  		title = rs.getString("t_title");		
  	}
  	if(content != null){
  %>
	
	<div style="padding: 60px 20px 40px 50px;">
		<b style="font-size : 150%"><%=title %></b><br>
		<img src=<%=img %> alt="크롤링부분" align="left" width="400" height="400"
			style="margin-right: 2%"/> <br>
		<span><%=content %></span>
		<!--<footer><a class="btn" href="######">크롤링부분</a></footer><br>-->
		<button id="rego" align="right" onclick='testinfo.jsp?t_id=<%=id%>'>테스트
			다시하기</button>
	</div>
<%
  	}else{
  		%>
  		<div style="padding: 60px 20px 40px 50px;">
  		<b style="font-size : 150%"><%=title %></b><br>
		<img src=<%=img %> alt="크롤링부분" align="left" width="400" height="400"
			style="margin-right: 2%"/> 
		
		<button id="rego" align="right" onclick='testinfo.jsp?t_id=<%=id%>'>테스트
			다시하기</button>
	</div>
  		<%
  	}
%>
	<fieldset style="margin: 2.7%">
		<legend> 다른 테스트 하러가기 </legend>
		<img src="https://cdn.banggooso.com/assets/images/uploadImg/1664416656(PC).png"
			width="350" height="350" href="https://www.banggooso.com/gl/136/"
			style="margin: 2%"/>
		<img src="https://cdn.banggooso.com/assets/images/uploadImg/1665044743(PC).jpg"
			width="350" height="350" href="https://www.banggooso.com/gl/138/"
			style="margin: 2%"/>
		<img src="https://cdn.banggooso.com/assets/images/uploadImg/1663055970(PC).jpg"
			width="350" height="350"
			href="https://www.metavv.com/content/10039931" style="margin: 2%"/>
	</fieldset>

	<%
	
}catch(SQLException ex){
	ex.printStackTrace();
} finally {
	if (pstmt != null)
	try {
		pstmt.close();
	} catch (SQLException sqle) {
	}

	if (conn != null)
	try {
		conn.close();
	} catch (SQLException sqle) {
	}
	}
%>

	<!--<script src="script.js?ver=123"></script>-->
</body>
</html>