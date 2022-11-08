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
String userID = (String)session.getAttribute("userID");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql;

String jdbcUrl = "jdbc:mysql://localhost:3306/BBS?useUnicode=yes&characterEncoding=UTF8";
String dbId = "root";
String dbPass = "root";
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

String t_id = null;
String s_id = null;
String t_test = null;

try{
	%>
	<%=userID %>
	님의 테스트 결과 내역
	<table>
		<tr>
			<td>1</td>
			<td><a href="t_resultView.jsp">test이름</a></td>
		</tr>
		<%
//user테이블에서 테스트 아이디, 결과 아이디 가져옴
sql = "select t_id from user where id = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, userID);
rs = pstmt.executeQuery();

while(rs.next()){
	t_id = rs.getString("t_id");
	int i = 1;
	String test_array[] = t_id.split(",");
	if(t_id == null){
		%>
		<%=test_array[i-1] %>
		<div>테스트 결과 내역이 없습니다!</div>
		<button type="button" onclick="location.href='main.jsp'">테스트
			하러 가기</button>
		<%
	}else{
	//test테이블에서 테스트 아이디로 테스트 제목 가져옴
	sql = "select t_title from test where t_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, test_array[i-1]);
	rs = pstmt.executeQuery();

	while(rs.next()){
		t_test = rs.getString("t_test");
	}
		%>
		<%=test_array[i-1] %>
		<tr>
			<td><%=i %></td>
			<td><a href="t_resultView.jsp?t_id=<%=test_array[i-1]%>"><%=t_test %></a></td>
		</tr>
		<%
	}
	i++;
}
%>
	</table>
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