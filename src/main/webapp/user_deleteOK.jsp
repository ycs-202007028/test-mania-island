<%@page import="io.opentelemetry.exporter.logging.SystemOutLogRecordExporter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 삭제</title>
</head>
<body>
	<button onclick="location.href='user_delete.jsp'">다시 검색</button>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
			userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제할 아이디를 입력하세요.')");
			script.println("location.href = 'user_Drop.jsp'");
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
		

			UserDAO userdao = new UserDAO();
			int result = userdao.delete(tr_ID);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원 삭제에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else { // 회원삭제 성공
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
				}
	%>
</body>
</html>