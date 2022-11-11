<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T.M.I</title>
</head>
<link href="layout/styles/mypages.css" rel="stylesheet" type="text/css"	media="all">
<link href="layout/styles/test.css" rel="stylesheet" type="text/css"	media="all">
<body>
	<!-- Top Background Image Wrapper -->
	<jsp:include page="top.jsp" flush="false" />
	<div class="hoc clear">
	<%
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  String id = request.getParameter("t_id");
  String content = "";
  String select = "";
  String img = request.getParameter("img");
  String sql;
  
  String num = request.getParameter("i");
  int i;
  if(num == null)
	  i = 0;
  else{
	  i = Integer.parseInt(num);
	  i++;
  }
  
  int score;
  if(request.getParameter("score") != null)
		  score = Integer.parseInt(request.getParameter("score"));
  else
	  score = 0;
  
  try{
  	String jdbcUrl = "jdbc:mysql://localhost:3306/BBS?useUnicode=yes&characterEncoding=UTF8";
  	String dbId = "root";
  	String dbPass = "root";
  	Class.forName("com.mysql.jdbc.Driver");
  	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
  	
  	//test에서 타이틀, 테스트 종류, 테스트 상세, 테스트 이미지 불러오기
  	sql = "select s_content, s_select from test_select where t_id = ?";
  	pstmt = conn.prepareStatement(sql);
  	pstmt.setString(1, id);
  	rs = pstmt.executeQuery();
  	
  	while(rs.next()){
  		content = rs.getString("s_content");
  		select = rs.getString("s_select"); 		
  	}
  	
  	String[] Array_content= content.split(",");
  	String[] Array_select = select.split(",");
  	%>
  	
  	<div style="text-align: center">
		<div><%=i + 1%>
			/
			<%=Array_content.length + 1 %></div>
		<progress class="progress" value=<%=i %> min="1"
			max=<%=Array_content.length %>></progress>
			
		<!-- 테스트 이미지 출력 -->
			<img class="testimg" src=<%=img %>>
		<%
  	
  	if(i < Array_content.length){
  		%>
		<div class="qanda">
  		
  		<!-- 질문 출력  -->
		<div class="q"><%=Array_content[i] %><br> </div>
		<!-- 선택지(1) -->
		<div class="a1">
				<a href="test.jsp?t_id=<%=id%>&img=<%=img%>&i=<%=i%>&score=<%=score+1%>">
				<%=Array_select[i+i] %></a><br> </div>
		<!-- 선택지(2) -->	
		<div class="a2">	
				<a href="test.jsp?t_id=<%=id%>&img=<%=img%>&i=<%=i%>&score=<%=score+3%>">
				<%=Array_select[i+i+1] %></a><br> </div>
		</div>
		<%
  	}
	
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