<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <style>
	ul { background : #FFC000; padding: 6px; text-align: right;}
	#mar { margin: 15px 25px 15px 0px;}
	#go { border:none; border-radius : 20px; width: 200px; height: 50px; background:#FFC000; top: 450px; left:1300px; position: absolute; text-align:center; color: white; display:block; vertical-align:middle; font-size:15pt; font-weight:bold;}
	#submit { border:none; border-radius:20px; width:100px; height:50px; background:#FFC000; top:650px; left:900px; position:absolute; text-align:center; color:white; display:block; vertical-align:middle; font-size:15pt; font-weight:bold;}
	#comment-input { border-style:bold; border-bottom-color:#FFC000; border-right:0px; border-top:0px; border-left:0px;}
 </style>
<title>테스트 설명</title>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
 <link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<!-- Top Background Image Wrapper -->
<jsp:include page = "top.jsp" flush = "false"/>
  <br><br><br>
  <hr>
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
  
  
  <p>
   <div style="padding:60px 20px 40px 50px;">
    <img src=<%=img %> alt="크롤링부분" align="left" width="500" height="300" style="margin-right:2%">
    <span style="margin-top:20px; font-size:30px;"><b><%=title %></b></span>
	<br>
	<span style="font-size:20px;"><%=content %></span>
    <!--<footer><a class="btn" href="######">크롤링부분</a></footer><br>-->
    <button id="go" align="right" onclick="location.href='testresult.jsp?t_id=<%=id%>'">테스트 시작하기</button>
   </div>
  </p>
   <br><br><br><br><br><br><br><br><br><br><br><br>
      <div style="padding:10px 20px 40px 50px;" id="form-commentInfo">
        <div id="comment-count">댓글<span id="count">0</span></div>
        <input id="comment-input" placeholder="댓글 남기기 어때?" style="width:820px;height:70px;font-size:25px;"></input>
        <button id="submit">등록</button>
    </div>
    <div id=comments>
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
    
</body>
</html>