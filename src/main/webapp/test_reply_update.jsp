<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="reply.Test_Reply"%>
<%@ page import="reply.Test_ReplyDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/custom.css">

<title>테스트 댓글 수정</title>
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
		int t_id = 0; 
		if(request.getParameter("t_id") != null){
			t_id = Integer.parseInt(request.getParameter("t_id"));
		}
		if (t_id == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		
		//작성한 글이 작성한 자 본인인지 확인 
		Test_Reply test_reply = new Test_ReplyDAO().getTest_Reply(t_id);
		if(!userID.equals(test_reply.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		int tr_ID = 0;
		if (request.getParameter("tr_ID") != null){
			tr_ID = Integer.parseInt(request.getParameter("tr_ID"));
		}
		
		Test_ReplyDAO test_replyDAO = new Test_ReplyDAO();
		String tr_Content = test_replyDAO.getUpdateTest_Reply(tr_ID);
	%>

	<div class="container" align="center">
		<div class="col-lg-10">
			<div class="jumbotron" style="padding-top: 1px;">
				<h3>
					<br>댓글 수정
				</h3>
				<form action="test_reply_updateOK.jsp" name=c_commentUpdate>
					<input type="text" id="update" style="width: 400px; height: 50px;"
						maxlength=1024 value="<%= tr_Content %>" name="tr_Content">
					<input type="hidden" value="<%=t_id %>" name="t_id"> <input
						type="hidden" value="<%=tr_ID %>" name="tr_ID"> <input
						type="submit" value="수정"> <br> <br>
				</form>
			</div>
		</div>
		<div class="col-lg-10"></div>
	</div>
</body>

</html>