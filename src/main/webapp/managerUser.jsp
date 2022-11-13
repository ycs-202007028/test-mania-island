<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="layout/styles/manageruser.css" rel="stylesheet" type="text/css"	media="all">
</head>
<body>
	<!-- Top Background Image Wrapper -->
	<jsp:include page="top.jsp" flush="false" />		
	<div class="hoc clear">		
		<%
		// DB에서 id에 맞는 정보들을 가져온 값
		String id = null; // 아이디
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
			<form action="delete.jsp" method="post">
			<table class ="contents">
			<thead class="conth">
			<tr>
				<th>선택</th>
				<th>게시글번호</th>
				<th>ID</th>
				<th>제목</th>
				<th>작성날짜</th>
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
				sql = "select b_ID, id, b_Title, b_Date from board";
				pstmt = conn.prepareStatement(sql);
			}else if(user != null){
				sql = "select b_ID, id, b_Title, b_Date from board where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user);
			}
			ResultSet result = pstmt.executeQuery();

			// 결과 레코드 하나씩마다 ID PW 이름 변수에 입력
			while (result.next()) {
				id = result.getString("id");
				b_title = result.getString("b_Title");
				date = result.getString("b_Date");
				b_id = result.getInt("b_ID");
		%>		
				<tr>
					<td><input type="checkbox" name="boardck" value="<%=b_id%>"></td>
					<td><%=b_id %></td>
					<td><%=id%></td>
					<td><a href="view.jsp?b_ID=<%=b_id%>"><%=b_title%></a></td>
					<td><%=date%></td>
				</tr>
		<%
			}
		%>
	</table>
	<button type="submit" value="게시글 삭제">게시글 삭제</button>
	</form>
			
			<!-- 게시판 내 댓글 삭제 -->
			<form action="delete.jsp" method="post">
			<fieldset>
			<legend align="center">&nbsp;댓글 관리</legend>
			<table>
			<tr>
				<th>선택</th>
				<th>댓글번호</th>
				<th>ID</th>
				<th>댓글내용</th>
				<th>작성날짜</th>
			</tr>
			<%
			jdbcUrl = "jdbc:mysql://localhost:3306/BBS?useUnicode=yes&characterEncoding=UTF8";
			dbId = "root";
			dbPass = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

			// SQL문으로 DB내에서 로그인하려는 ID와 PW 이름 검색
			if(manager != null){
				sql = "select id, replyContent, r_Date, replyID from reply";
				pstmt = conn.prepareStatement(sql);
			}else if(user != null){
				sql = "select id, replyContent, r_Date, replyID from reply where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user);
			}
			result = pstmt.executeQuery();

			// 결과 레코드 하나씩마다 ID PW 이름 변수에 입력
			while (result.next()) {
				id = result.getString("id");
				content = result.getString("replyContent");
				date = result.getString("r_Date");
				r_id = result.getInt("replyID");
		%>		
				<tr>
					<td><input type="checkbox" name="replyck" value="<%=r_id%>"></td>
					<td>게시판 댓글 ID : <%=r_id %></td>
					<td><%=id%></td>
					<td><%=content%></td>
					<td><%=date%></td>
				</tr>
		<%
			}
			
			if(manager != null){
				sql = "select id, tr_Content, tr_Date, tr_ID from test_reply";
				pstmt = conn.prepareStatement(sql);
			}else if(user != null){
				sql = "select id, tr_Content, tr_Date, tr_ID from test_reply where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user);
			}
			result = pstmt.executeQuery();

			// 결과 레코드 하나씩마다 ID PW 이름 변수에 입력
			while (result.next()) {
				id = result.getString("id");
				content = result.getString("tr_Content");
				date = result.getString("tr_Date");
				r_id = result.getInt("tr_ID");
		%>		
				<tr>
					<td><input type="checkbox" name="trck" value="<%=r_id%>"></td>
					<td>테스트 댓글 ID : <%=r_id %></td>
					<td><%=id%></td>
					<td><%=content%></td>
					<td><%=date%></td>
				</tr>
		<%
			}
		%>
	</table>
	<button type="submit" value="댓글 삭제">댓글 삭제</button>
	</fieldset>
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
	</div>
	
</body>
</html>