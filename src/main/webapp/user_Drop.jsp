<%@page import="io.opentelemetry.exporter.logging.SystemOutLogRecordExporter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="layout/styles/manageruser.css" rel="stylesheet" type="text/css"	media="all">
<title>회원삭제</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<!-- Top Background Image Wrapper -->
	<jsp:include page="top.jsp" flush="false" />		
	<div class="hoc clear">		
		<%
		// DB에서 id에 맞는 정보들을 가져온 값
		String id = null; // 아이디
		String name = null; //이름
		String birth = null; //생일
		String email = null; //이메일
		String gender = null; //성별
		String mbti = null; //mbti
		
		int i=1;
		
		String content = null; //댓글내용
		String date = null; // 작성 신청 날짜
		int r_id; //댓글 번호
		int b_id; //게시글 번호
		String b_title; //게시글 제목
		
		String user = (String)session.getAttribute("userID");
		String manager = (String)session.getAttribute("manager");

		//DB연결
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			%>
			<div class="gru">
			<form action="user_deleteOK.jsp" method="post">
			<table class ="contents">
			<thead class="conth">
			<tr>
				<th>선택</th>				
				<th>ID</th>
				<th>이름</th>
				<th>생일</th>
				<th>이메일</th>
				<th>성별</th>
				<th>mbti</th>
				</tr>
			</thead>
			<%
			String jdbcUrl = "jdbc:mysql://localhost:3306/BBS?useUnicode=yes&characterEncoding=UTF8";
			String dbId = "root";
			String dbPass = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

			// SQL문으로 DB내에서 로그인하려는 ID와 PW 이름 검색
			if(manager != null){
				sql = "select id, name, birth, email, gender, mbti from user";
				pstmt = conn.prepareStatement(sql);
			}else if(user != null){
				sql = "select id, name, birth, email, gender, mbti from user where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user);
			}
			ResultSet result = pstmt.executeQuery();

			// 결과 레코드 하나씩마다 ID PW 이름 변수에 입력
			while (result.next()) {
				id = result.getString("id");
				name = result.getString("name");
				birth = result.getString("birth");
				email = result.getString("email");
				gender = result.getString("gender");
				mbti = result.getString("mbti");
		%>		
		<tbody>
				<tr>
					<td><input type="checkbox" name="userck" value="<%=id%>"></td>
					<td><%=id%></td>
					<td><%=name %></td>
					<td><%=birth%></td>
					<td><%=email%></td>
					<td><%=gender%></td>
					<td><%=mbti%></td>
				</tr>
		
		<%
			}
		%>
	</tbody>
	</table>
	<div class="btnarea">
	<button class ="delete" type="submit" value="게시글 삭제">회원 삭제</button>
	</div></div>
	</form>
	<%
	// 에러 처리
	} catch (SQLException ex) {
		ex.printStackTrace();
	}
	%>	
	</div>	
	<div class="wrapper row5">
      <div id="copyright" class="hoc clear">
         <p class="fl_left">
            Copyright &copy; 2022 컴퓨터소프트웨어학과 - <a target="_blank"
               href="https://github.com/ycs-202007028/test-mania-island"
               title="3학년 1반 - 1조">T.M.I</a>
         </p>
      </div>
</body>
</html>