<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="layout/styles/mypages.css" rel="stylesheet" type="text/css"
	media="all">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false" />
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql;

String jdbcUrl = "jdbc:mysql://localhost:3306/BBS?useUnicode=yes&characterEncoding=UTF8";
String dbId = "root";
String dbPass = "root";
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

String t_id = (String)request.getParameter("t_id");
String s_id = (String)request.getParameter("s_id");

String r_content = null;
String r_img = null;
String t_title = null;

try{
	sql = "select r_content, r_img from test_result where t_id=? and s_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, t_id);
	pstmt.setString(2, s_id);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		r_content = rs.getString("r_content");
		r_img = rs.getString("r_img");
	}
	
	sql = "select t_title from test where t_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, t_id);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		t_title = rs.getString("t_title");
	}
	
	%>
	<fieldset>
	<legend><%=t_title %></legend>
	<%
	if(r_content == null){
		%>
		<div><img src=<%=r_img %> alt="크롤링부분"
				style="margin-right: 2%; width: 400; height: 400" /></div>
		<%
	}else{
		%>
		<div><img src=<%=r_img %> alt="크롤링부분"
				style="margin-right: 2%; width: 400; height: 400" /></div>
		<div><%=r_content %></div>
		<%
	}
	%>
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
</body>
</html>