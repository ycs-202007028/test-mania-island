<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="reply.Test_Reply"%>
<%@ page import="reply.Test_ReplyDAO"%>
<!DOCTYPE html>
<html>
<head>
<title>T.M.I</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="layout/styles/mypages.css" rel="stylesheet" type="text/css"	media="all">
<link href="layout/styles/testinfo.css" rel="stylesheet" type="text/css"	media="all">
</head>
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
  String title = "";
  String content = "";
  String img = "";
  
  //댓글 사용자 이미지 가져오기 
  String userID = (String)session.getAttribute("userID");
  String mbti = "";
  String img1 = ""; 

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

	
	int t_id = 0;
	
	if(request.getParameter("t_id") != null){
		t_id = Integer.parseInt(request.getParameter("t_id"));
	}
	
	int pageNumber = 1; // 기본페이지
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	
	
  	
  %>
		<div class="div1">
			<div class="imgbox">
				<img style="width:100% !important;" src=<%=img %>>
			</div>
			<div class="puzzle">
				<div class="titlefont"><%=title %></div>
				<div class="subfont"><%=content %></div>
				<button id="go" onclick="location.href='test.jsp?t_id=<%=id%>&img=<%=img%>'">테스트 시작하기</button>

			</div>
		</div>
		<hr>
		<!-- 테스트 댓글 부분 -->
		<form action="test_replyOK.jsp?t_id=<%= t_id %>" method="post">
		
		<div class="comment">
		<img src=<%=img1 %> class="profile" />
		<input id="comment-input" type="text" name="tr_Content" maxlength="150" placeholder="댓글을 입력해 주세요.">
		<a style="margin-top:auto; margin-bottom:20px; width: 150px; height: 30px;" href="test_replyOK.jsp">
		<input id="submit" class="submit1" type="submit" value="등록" /></a>				
		</div>
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
				String mbti_img = null;
				
				sql = "select mbti from user where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, list.get(j).getUserID());
				rs = pstmt.executeQuery();
				while(rs.next()){
					mbti_img = rs.getString("mbti");
				}
				
				mbti_img = (String)mbti_img.toUpperCase().trim();
				String img2 = "";
				
				switch(mbti_img){
				case "ENFJ" :
					img2 = "images/mbti/ENFJ.jpg";
					break;
				case "ENFP" :
					img2 = "images/mbti/ENFP.jpg";
					break;
				case "ENTJ" :
					img2 = "images/mbti/ENTJ.jpg";
					break;
				case "ENTP" :
					img2 = "images/mbti/ENTP.jpg";
					break;
				case "ESFJ" :
					img2 = "images/mbti/ESFJ.jpg";
					break;
				case "ESFP" :
					img2 = "images/mbti/ESFP.jpg";
					break;
				case "ESTJ" :
					img2 = "images/mbti/ESTJ.jpg";
					break;
				case "ESTP" :
					img2 = "images/mbti/ESTP.jpg";
					break;
				case "INFJ" :
					img2 = "images/mbti/INFJ.jpg";
					break;
				case "INFP" :
					img2 = "images/mbti/INFP.jpg";
					break;
				case "INTJ" :
					img2 = "images/mbti/INTJ.jpg";
					break;
				case "INTP" :
					img2 = "images/mbti/INTP.jpg";
					break;
				case "ISFJ" :
					img2 = "images/mbti/ISFJ.jpg";
					break;
				case "ISFP" :
					img2 = "images/mbti/ISFP.jpg";
					break;
				case "ISTJ" :
					img2 = "images/mbti/ISTJ.jpg";
					break;
				default :
					img2 = "images/mbti/ISTP.jpg";
					break;
				}
							
		%>
		<div class="div3">
		<!-- 사용자 이미지 프로 -->
		<img src=<%=img2 %> class="profile" />
		
		<div class="div5">
		<div class="div4">
		<!-- 사용자 이름 -->
		<h1 class="username"><%= list.get(j).getUserID() %></h1>
		<!-- 작성 날짜 -->
		<p class="comdate"><%= list.get(j).getTr_Date().substring(0, 11) + list.get(j).getTr_Date().substring(11, 13) + "시" + list.get(j).getTr_Date().substring(14, 16) + "분" %>
		</p>
		<!-- 수정 버튼 -->
		<p style="margin-right: 5px;"><a href="test_reply_update.jsp?t_id=<%=t_id%>&tr_ID=<%=tr_ID%>" class="btnupdate">수정</a> </p>
		<!-- 삭제 버튼 -->
		<p style="margin-left: 5px;"><a onclick="return confirm('정말로 삭제하시겠습니까?')" href="test_reply_deleteOK.jsp?t_id=<%=t_id%>&tr_ID=<%=tr_ID%>" class="btnupdate">삭제</a> </p>
		</div>	
		
		<div class="comfont">
		 <%= list.get(j).getTr_Content() %> 
		</div>
		
		</div>
		</div>
		<hr>
			<%
			}
		%>
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