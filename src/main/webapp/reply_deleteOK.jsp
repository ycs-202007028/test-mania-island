<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="reply.Reply"%>
<%@ page import="reply.ReplyDAO"%>
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
		int b_ID=0;
		if(request.getParameter("b_ID")!=null){
			b_ID=Integer.parseInt(request.getParameter("b_ID"));
		}

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

		Reply reply = new ReplyDAO().getReply(b_ID);
		if(!userID.equals(reply.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		} else {
				ReplyDAO ReplyDAO = new ReplyDAO();
				int result = ReplyDAO.delete(b_ID);
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 삭제에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else { // 글삭제 성공
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'view.jsp'");
					script.println("</script>");
				}
		}
		%>
</body>
</html>