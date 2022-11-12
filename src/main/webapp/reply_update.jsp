<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="reply.Reply"%>
<%@ page import="reply.ReplyDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/custom.css">

<title>댓글 수정</title>
</head>
<body>
	<%
	
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		
		//유효한 글 판단
		int b_ID = 0; // url에 b_ID가 넘어온다면 b_ID 변수에 정보 저장
		if(request.getParameter("b_ID") != null){
			b_ID = Integer.parseInt(request.getParameter("b_ID"));
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
		
		//작성한 댓글이 작성한 자 본인인지 확인 
		Reply reply = new ReplyDAO().getReply(replyID);
		if(!userID.equals(reply.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		ReplyDAO replyDAO = new ReplyDAO();
		String replyContent = replyDAO.getUpdateReply(replyID);
	%>

	<div class="container" align="center">
		<div class="col-lg-10">
			<div class="jumbotron" style="padding-top: 1px;">
				<h3>
					<br>댓글 수정
				</h3>
				<form action="reply_updateOK.jsp" name=c_commentUpdate>
					<input type="text" id="update" style="width: 400px; height: 50px;"
						maxlength=1024 value="<%= replyContent %>" name="replyContent">
					<input type="hidden" value="<%=b_ID %>" name="b_ID"> <input
						type="hidden" value="<%=replyID %>" name="replyID"> <input
						type="submit" value="수정"> <br> <br>
				</form>
			</div>
		</div>
		<div class="col-lg-10"></div>
	</div>
</body>

</html>
