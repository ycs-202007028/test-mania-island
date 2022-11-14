<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T.M.I</title>
</head>
<link href="layout/styles/test.css" rel="stylesheet" type="text/css"	media="all">
<link href="layout/styles/testres.css" rel="stylesheet" type="text/css"	media="all">
<body>
	<!-- Top Background Image Wrapper -->
	<jsp:include page="top.jsp" flush="false" />
	<div class="hoc clear">
	<div class="allofus">
	<%
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  String id = request.getParameter("t_id");
  String content = "";
  String select = "";
  String img = request.getParameter("img");
  String sql;
  String title = ""; //테스트 제목 가져오기
  
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
  	
  	sql = "select t_title from test where t_id=?";
  	pstmt = conn.prepareStatement(sql);
  	pstmt.setString(1, id);
  	rs = pstmt.executeQuery();
  	while(rs.next()){
  		title = rs.getString("t_title");		
  	}
  	
  	String[] Array_content= content.split(",");
  	String[] Array_select = select.split(",");
  	%>
  	<div class="topper">
  	<div class="t_title"><%=title %></div>
	<div class="t_number"><%=i + 1%>			/			<%=Array_content.length + 1 %></div>
	</div>
	
	<div class="pros">	
	<progress class="progress" value=<%=i %> min="1"
			max=<%=Array_content.length %>></progress>
	</div>	
		<!-- 테스트 이미지 출력 -->
			<img class="testimg" src=<%=img %>>
			
		<%
  	
  	if(i < Array_content.length){
  		%>
		<div class="qanda">
  		
  		<!-- 질문 출력  -->
		<div class="q"><%=Array_content[i] %></div>
		<!-- 선택지(1) -->
		<button class="a1" onclick="location.href='test.jsp?t_id=<%=id%>&img=<%=img%>&i=<%=i%>&score=<%=score+1%>'" >
				<%=Array_select[i+i] %>
				</button>
		<!-- 선택지(2) -->	
		<button class="a2" onclick="location.href='test.jsp?t_id=<%=id%>&img=<%=img%>&i=<%=i%>&score=<%=score+3%>'" >
				<%=Array_select[i+i+1] %></button>
		</div>
		
		<%
  	}else{
  		%>
  		
		<div class="a3">
			<a href="testresult.jsp?t_id=<%=id%>&score=<%=score%>">결과 보러 가기</a><br>
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