<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@page import="reply.Reply"%>
<%@page import="reply.ReplyDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/custom.css" />
<title>Insert title here</title>
</head>
<body>
	<!-- Top 호출-->
	<jsp:include page = "top.jsp" flush = "false"/>
	<hr>
	<%
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
			script.println("location.href = 'view'.jsp'");
		}
		
		int b_ID = 0;
		// url에 b_ID가 넘어온다면 b_ID 변수에 정보 저장
		if(request.getParameter("b_ID") != null){
			b_ID = Integer.parseInt(request.getParameter("b_ID"));
		}
		
		int pageNumber = 1; // 기본페이지
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		if (b_ID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		int replyID = 0;
		if (request.getParameter("replyID") != null){
			replyID = Integer.parseInt(request.getParameter("replyID"));
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
						<th colspan="3" style="background-color: #eeeeee; text-align: center;"><font color="black">게시글 글 보기</font></th>
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
					<a href="update.jsp?b_ID=<%=b_ID%>" class="btn btn-primary">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="b_deleteOK.jsp?b_ID=<%=b_ID%>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
			<a href="write.jsp"><input type="submit" class="btn btn-primary pull-right" value="글쓰기" /></a>
		</div>
	</div>
	
	<!-- 댓글 -->
		<form method="post" action="replyOK.jsp?b_ID=<%= b_ID %>">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<%-- 홀,짝 행 구분 --%>
						<tr>
							<th 
								style="background-color: #EAEAEA; text-align: left;"><font color="black">댓글</font></th>
						</tr>
					</table>
		</form>
		<form method="post" encType = "multipart/form-data" action="replyOK.jsp?b_ID=<%= b_ID %>&userID=<%=userID%>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">

					<td style="border-bottom:none;" valign="middle"><br><br><%= userID %></td>
					<td colspan="5" ><input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "commentText"></td>
					<td><br><br><input type="submit" class="btn" value="댓글 작성"></td>

						<%
						ReplyDAO replyDAO=new ReplyDAO();
						ArrayList<Reply> list=replyDAO.getList(b_ID, pageNumber);
						for(int i=list.size()-1;i>=0;i--){
								
						%>

						<tr>
						<td style="text-align: center;" colspan="3" ><%= list.get(i).getUserID() %></td>
							<td style="text-align: left;" colspan="3" ><%= list.get(i).getReplyContent() %></td>
							<td>
							<a href="reply_update.jsp?b_ID=<%= b_ID %>" class="btn btn-primary">수정</a>
							<a href="reply_deleteOK.jsp?b_ID=<%= b_ID %>" class="btn btn-primary">삭제</a>
							</td>
						</tr>
					
						<%
								}
						%>
				
			</table>
		</form>
	</div>
</div>

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>