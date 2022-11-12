<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="reply.Test_Reply"%>
<%@ page import="reply.Test_ReplyDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	//sresponse.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글 수정 완료</title>

</head>
<body>
	<%
	Test_ReplyDAO test_replyDAO = new Test_ReplyDAO();
	int result;
	
		String userID = null;
		if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
			userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.
		}
		int t_id = 0;
		if (request.getParameter("t_id") != null){
			t_id = Integer.parseInt(request.getParameter("t_id"));
		}
		int tr_ID = 0;
		if (request.getParameter("tr_ID") != null){
			tr_ID = Integer.parseInt(request.getParameter("tr_ID"));
		}
		String tr_Content = null;
		if (request.getParameter("tr_Content")!=null){
			tr_Content = request.getParameter("tr_Content");
		}
		
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 
		
		if (t_id == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		Test_Reply test_reply = new Test_ReplyDAO().getTest_Reply(tr_ID);
		if (!userID.equals(test_reply.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("history.back()");
			script.println("</script>");				
		} else {
	 		if (test_reply.getTr_Content().equals("")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				
				result = test_replyDAO.update(tr_ID, tr_Content);
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('댓글수정에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='testinfo.jsp?t_id="+t_id+"'");
					script.println("</script>");
				}
			}
		}
	 		
	%>
</body>
</html>