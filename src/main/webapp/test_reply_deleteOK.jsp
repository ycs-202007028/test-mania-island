<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="reply.Test_Reply"%>
<%@ page import="reply.Test_ReplyDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.File"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글 삭제</title>
</head>
<body>
	<%

		String userID = null;
		if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
			userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 

		int t_ID=0;
		if(request.getParameter("t_ID")!=null){
			t_ID=Integer.parseInt(request.getParameter("t_ID"));
		}
		int tr_ID=0;
		if(request.getParameter("tr_ID")!=null){
			tr_ID=Integer.parseInt(request.getParameter("tr_ID"));
		}
		
		Test_Reply test_reply = new Test_ReplyDAO().getTest_Reply(tr_ID);
		if(!userID.equals(test_reply.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
				Test_ReplyDAO Test_ReplyDAO = new Test_ReplyDAO();
				int result = Test_ReplyDAO.delete(tr_ID);
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 삭제에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else { // 글삭제 성공
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'main.jsp'");
					script.println("</script>");
				}
		}
		%>
</body>
</html>