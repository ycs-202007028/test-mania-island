<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title> Insert title here </title>
</head>
<body>
<%			// 학번
String name = request.getParameter("name");				// 이름
String id = request.getParameter("id");					// ID
String pw = request.getParameter("pw");				    // PW
String birth = request.getParameter("birth");			// 생일
String nickname = request.getParameter("nickname");		// 닉네임
String email = request.getParameter("email");		    // EMAIL
String gender = request.getParameter("gender");			// 성별
String mbti = request.getParameter("mbti");				// mbti
%>
<%
String prnM=null;

Connection conn=null;
PreparedStatement pstmt = null;
String str = "";

try{
    String jdbcUrl="jdbc:mysql://localhost:3306/tmi?useUnicode=yes&characterEncoding=UTF8";
    String dbId="root";
    String dbPass="jsp2021";
    Class.forName("com.mysql.jdbc.Driver");

    conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
    String sql = "insert into member values(?,?,?,?,?,?,?,?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    pstmt.setString(2, name);
    pstmt.setString(3, pw);
    pstmt.setString(4, birth);
    pstmt.setString(5, nickname);
    pstmt.setString(6, email);
    pstmt.setString(7, gender);
    pstmt.setString(8, mbti);
    pstmt.executeUpdate();
%>
	<script>
		alert("회원가입이 완료되었습니다!!");
		location.href="main.jsp";
	</script>
<%
}catch(SQLException e){
%>
    <script>
    	alert("이미 회원이 있습니다!");
    	history.go(-1);
    </script>
<%
}finally{
    if(pstmt !=null)
        try{pstmt.close();}catch(SQLException sqle){}

    if(conn !=null)
        try{conn.close();}catch(SQLException sqle){}
}
%>