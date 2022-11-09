<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="reply.Test_Reply"%>
<%@ page import="reply.Test_ReplyDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>T.M.I</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<style>
#submit {
	border: none;
	border-radius: 20px;
	width: 100px;
	height: 50px;
	background: #FFC000;
	text-align: center;
	color: white;
	display: block;
	vertical-align: middle;
	top: 550px;
	left: 900px;
	font-size: 15pt;
	font-weight: bold;
}

#comment-input {
	border-style: bold;
	border-bottom-color: #FFC000;
	align: center;
	border-right: 0px;
	border-top: 0px;
	border-left: 50px;
}
</style>
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

  String userID = (String)session.getAttribute("userID");
  String id = request.getParameter("t_id");
  String title = "";
  String content = "";
  String img = "";
  String mbti = null;
  String img1 = ""; //테스트 댓글별 프로필이미지를 저장하기 위한 변수
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
  	
  //test reply에서 프로필 이미지 불러오기
  	sql = "select mbti from user where id = ?";
  	pstmt = conn.prepareStatement(sql);
  	pstmt.setString(1, userID);
  	rs = pstmt.executeQuery();
  	
  	while(rs.next()){
  		mbti = rs.getString("mbti");
  	}
  	
  	mbti = (String)mbti.toUpperCase().trim();
  	

	switch(mbti){
	case "ENFJ" :
		img1 = "images/mbti/ENFJ.jpg";
		break;
	case "ENFP" :
		img1 = "images/mbti/ENFP.jpg";
		break;
	case "ENTJ" :
		img1 = "images/mbti/ENTJ.jpg";
		break;
	case "ENTP" :
		img1 = "images/mbti/ENTP.jpg";
		break;
	case "ESFJ" :
		img1 = "images/mbti/ESFJ.jpg";
		break;
	case "ESFP" :
		img1 = "images/mbti/ESFP.jpg";
		break;
	case "ESTJ" :
		img1 = "images/mbti/ESTJ.jpg";
		break;
	case "ESTP" :
		img1 = "images/mbti/ESTP.jpg";
		break;
	case "INFJ" :
		img1 = "images/mbti/INFJ.jpg";
		break;
	case "INFP" :
		img1 = "images/mbti/INFP.jpg";
		break;
	case "INTJ" :
		img1 = "images/mbti/INTJ.jpg";
		break;
	case "INTP" :
		img1 = "images/mbti/INTP.jpg";
		break;
	case "ISFJ" :
		img1 = "images/mbti/ISFJ.jpg";
		break;
	case "ISFP" :
		img1 = "images/mbti/ISFP.jpg";
		break;
	case "ISTJ" :
		img1 = "images/mbti/ISTJ.jpg";
		break;
	default :
		img1 = "images/mbti/ISTP.jpg";
		break;
	}
	int tr_ID = 0;

	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
	}
	
	int t_id = 0;
	
	if(request.getParameter("t_id") != null){
		t_id = Integer.parseInt(request.getParameter("t_id"));
	}
	
	int pageNumber = 1; // 기본페이지
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	
	Test_Reply test_reply = new Test_ReplyDAO().getTest_Reply(t_id);
  	
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
		<!-- 테스트 댓글 부분 -->
		<div style="padding: 10px 20px 40px 50px;">
		<form action="test_replyOK.jsp?t_id=<%= t_id %>" method="post">
			<!-- 데이터 불러오기 -->
			<%
			Test_ReplyDAO test_replyDAO=new Test_ReplyDAO();
			ArrayList<Test_Reply> list=test_replyDAO.getList(t_id, pageNumber);
			for(int j=list.size()-1;j>=0;j--){
				//test에서 타이틀, 테스트 종류, 테스트 상세, 테스트 이미지 불러오기
				sql = "select tr_ID from test_reply where tr_Content = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, list.get(j).getTr_Content());
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					tr_ID = Integer.parseInt(rs.getString("tr_ID"));
				}	
							
		%>
		<h1><img src=<%=img1 %> class="profile" /><%= list.get(j).getUserID() %></h1>
		<p><%= list.get(j).getTr_Date().substring(0, 11) + list.get(j).getTr_Date().substring(11, 13) + "시" + list.get(j).getTr_Date().substring(14, 16) + "분" %>
		</p>
		<%= list.get(i).getTr_Content() %>
		<p><a href="test_reply_update.jsp?t_id=<%=t_id%>&tr_ID=<%=tr_ID%>"
						class="btn btn-primary">수정</a> 
		</p><br>
		<hr>
				<%
			}
		%>
		<div class="comment">
		<img src=<%=img1 %> class="profile" />
		<input id="comment-input" type="text" name="tr_Content"
						maxlength="150" placeholder="댓글을 입력해 주세요."
						style="width: 1600px; height: 70px; font-size: 25px;">
		<a href="test_replyOK.jsp"><input id="submit" type="submit"
							value="등록" /></a>	
			
	</div>
	
	<script src="js/scripts.js?ver=123"></script>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
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