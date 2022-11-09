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
int i;

try{
	%>
	<div><%=userID %>
	님의 테스트 결과 내역</div>
	<table>
<<<<<<< HEAD
	<tr>
	<td>1</td><td><a href = "t_resultView.jsp">test이름</a></td>
	</tr>
	<tr>
	<td>2</td><td><a href = "t_resultView.jsp">test이름1</a></td>
	</tr>
=======
		<tr>
			<td>1</td>
			<td><a href="t_resultView.jsp">test이름</a></td>
		</tr>
>>>>>>> 1bc5f1c1dae6b86b5a7391327e0c455e0a6b292f
		<%
	//user테이블에서 테스트 아이디, 결과 아이디 가져옴
	sql = "select t_id, s_id from user where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userID);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		t_id = rs.getString("t_id");
		s_id = rs.getString("s_id");
	}

	if(t_id != null){
		String test_array[] = t_id.split(",");
		String result_array[] = s_id.split(",");
		for(i = 0; i < test_array.length; i++){
			sql = "select t_title from test where t_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(test_array[i]));
			rs = pstmt.executeQuery();

			while(rs.next()){
				t_test = rs.getString("t_title");
			}
			%>
			<tr>
				<td><%=i+1 %></td><td><a href = "t_resultView.jsp?t_id=<%=test_array[i]%>&s_id=<%=result_array[i]%>"><%=t_test %></a></td>
			</tr>
			<%
		}
	}else{
		%>
<<<<<<< HEAD
		<div>테스트 결과 내역이 없습니다!</div>
		<button type="button" onclick="location.href='main.jsp'">테스트
			하러 가기</button>
=======
		<%=test_array[i-1] %>
		<tr>
			<td><%=i %></td>
			<td><a href="t_resultView.jsp?t_id=<%=test_array[i-1]%>"><%=t_test %></a></td>
		</tr>
>>>>>>> 1bc5f1c1dae6b86b5a7391327e0c455e0a6b292f
		<%
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