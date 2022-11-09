<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="reply.Reply"%>
<%@ page import="reply.ReplyDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<link href="layout/styles/testinfo.css" rel="stylesheet" type="text/css" media="all">
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
<title>Insert title here</title>
</head>
<body>
	<!-- Top 호출-->
	<jsp:include page="top.jsp" flush="false" />

	<%
	  Connection conn = null;
	  PreparedStatement pstmt = null;
	  ResultSet rs = null;
	  String id = request.getParameter("t_id");
	  String title = "";
	  String content = "";
	  String img = "";
	  String sql;
	  // 댓글 사용자 이미지 가져오기 
	  String userID = (String)session.getAttribute("userID");
	  String mbti = null;
	  String img1 = ""; 

	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/BBS?useUnicode=yes&characterEncoding=UTF8";
		String dbId = "root";
		String dbPass = "root";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
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
		
		
	int replyID = 0;

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
		
		int b_ID = 0;
		// url에 b_ID가 넘어온다면 b_ID 변수에 정보 저장
		if(request.getParameter("b_ID") != null){
			b_ID = Integer.parseInt(request.getParameter("b_ID"));
		}
		if(b_ID==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");	
		}
		int pageNumber = 1; // 기본페이지
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		Bbs bbs = new BbsDAO().getBbs(b_ID);
	%>

	<!-- 게시판 시작 -->

	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;"><font
							color="black">게시글 글 보기</font></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%= bbs.getB_Title().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&tr;") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= bbs.getId() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td><%= bbs.getB_Date().substring(0, 11) + bbs.getB_Date().substring(11, 13) + "시" + bbs.getB_Date().substring(14, 16) + "분" %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getB_Content().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&tr;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			<a href="board.jsp" class="btn btn-primary">목록</a>
			<%
				if(userID != null && userID.equals(bbs.getId())){
			%>
			<a href="update.jsp?b_ID=<%=b_ID%>" class="btn btn-primary">수정</a> <a
				onclick="return confirm('정말로 삭제하시겠습니까?')"
				href="b_deleteOK.jsp?b_ID=<%=b_ID%>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
			<a href="write.jsp"><input type="submit"
				class="btn btn-primary pull-right" value="글쓰기" /></a>
		</div>
	</div>

	<!-- 댓글 -->
	<div style="padding: 10px 20px 40px 50px;">
		<form action="replyOK.jsp?b_ID=<%= b_ID %>" method="post">
			<!-- 데이터 불러오기 -->
			<%
			ReplyDAO replyDAO=new ReplyDAO();
			ArrayList<Reply> list=replyDAO.getList(b_ID, pageNumber);
			for(int i=list.size()-1;i>=0;i--){
				//test에서 타이틀, 테스트 종류, 테스트 상세, 테스트 이미지 불러오기
				sql = "select replyID from reply where replyContent = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, list.get(i).getReplyContent());
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					replyID = Integer.parseInt(rs.getString("replyID"));
				}	
							
		%><hr>
		<h1><img src=<%=img1 %> class="profile" /><%= list.get(i).getUserID() %></h1>
		<p><%= list.get(i).getR_Date().substring(0, 11) + list.get(i).getR_Date().substring(11, 13) + "시" + list.get(i).getR_Date().substring(14, 16) + "분" %>
		</p>
		<%= list.get(i).getReplyContent() %>
		<p><a href="reply_update.jsp?b_ID=<%=b_ID%>&replyID=<%=replyID%>"
						class="btn btn-primary">수정</a> 
		</p><br>
		
				<%
			}
		%>
		<div class="comment">
		<img src=<%=img1 %> class="profile" />
		<input id="comment-input" type="text" name="replyContent"
						maxlength="150" placeholder="댓글을 입력해 주세요."
						style="width: 1600px; height: 70px; font-size: 25px;">
		<a href="replyOK.jsp"><input id="submit" type="submit"
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
</body>
</html>