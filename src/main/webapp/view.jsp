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
	<hr>
	<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql;

	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/BBS?useUnicode=yes&characterEncoding=UTF8";
		String dbId = "root";
		String dbPass = "root";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		
	int replyID = 0;
	
		String userID = null;
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
			<div id="comment-count">댓글 0</div>
			<!-- 데이터 불러오기 -->
			<%
			ReplyDAO replyDAO=new ReplyDAO();
			Reply reply = new Reply();
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
		%>
			<table>
				<tr>

					<td style="text-align: left;"><%= list.get(i).getUserID() %></td>
					<td style="text-align: left;"><%= list.get(i).getReplyContent() %></td>
					<td><%= list.get(i).getR_Date().substring(0, 11) + list.get(i).getR_Date().substring(11, 13) + "시" + list.get(i).getR_Date().substring(14, 16) + "분" %>
					</td>
					<td><a href="reply_update.jsp?b_ID=<%=b_ID%>&replyID=<%=replyID%>"
						class="btn btn-primary">수정</a> <a
						onclick="return confirm('정말로 삭제하시겠습니까?')"
						href="reply_deleteOK.jsp?b_ID=<%=b_ID%>" class="btn btn-primary">삭제</a>

					</td>
				</tr>

				<%
			}
			
		%>
			</table>
			<table>
				<tr>
					<td><%=userID %></td>
					<td><input id="comment-input" type="text" name="replyContent"
						maxlength="50" placeholder="댓글 남기기 어때?"
						style="width: 1200px; height: 70px; font-size: 25px;"></td>
					<td><a href="replyOK.jsp"><input id="submit" type="submit"
							value="등록" /></a></td>
			</table>
		</form>
	</div>

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
</body>
</html>