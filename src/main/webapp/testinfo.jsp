<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>T.M.I</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link href="layout/styles/testinfo.css" rel="stylesheet" type="text/css"
	media="all">
</head>
<body id="top">
	<!-- Top Background Image Wrapper -->
	<jsp:include page="top.jsp" flush="false" />
	<div class="hoc clear">
		<%
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  String id = request.getParameter("t_id");
  String title = "";
  String content = "";
  String img = "";
  String sql;
  int i = 0;

  try{
  	String jdbcUrl = "jdbc:mysql://localhost:3306/BBS?useUnicode=yes&characterEncoding=UTF8";
  	String dbId = "root";
  	String dbPass = "root";
  	Class.forName("com.mysql.jdbc.Driver");
  	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
  	
  	//test에서 타이틀, 테스트 종류, 테스트 상세, 테스트 이미지 불러오기
  	sql = "select t_img, t_title, t_content from test where t_id = ?";
  	pstmt = conn.prepareStatement(sql);
  	pstmt.setString(1, id);
  	rs = pstmt.executeQuery();
  	
  	while(rs.next()){
  		title = rs.getString("t_title");
  		content = rs.getString("t_content");
  		img = rs.getString("t_img");  		
  	}
  %>

		<table>
			<tr></tr>
			<tr></tr>
		</table>

		<div class="div1">
			<div class="imgbox">
				<img src=<%=img %>>
			</div>
			<div class="puzzle">
				<div class="titlefont"><%=title %></div>
				<div class="subfont"><%=content %></div>
				<button id="go"
					onclick="location.href='test.jsp?t_id=<%=id%>&img=<%=img%>'">테스트
					시작하기</button>
			</div>
		</div>
		<hr>
		<div class="div2">
			<div class="comment">
				<div class="box1">
					<img src="images/demo/avatar.png" class="profile" /> <input
						id="comment-input" placeholder="댓글을 입력해 주세요." />
				</div>
				<button id="submit">등록</button>
			</div>

			<script src="js/scripts.js?ver=123"></script>
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
		</div>
	</div>
</body>
</html>