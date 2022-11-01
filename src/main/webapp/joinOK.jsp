<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="id" />
<jsp:setProperty name="user" property="pw" />
<jsp:setProperty name="user" property="birth" />
<jsp:setProperty name="user" property="email" />
<jsp:setProperty name="user" property="gender" />
<jsp:setProperty name="user" property="mbti" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title></title>
</head>
<body>

<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("id");
		}
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		if(user.getName() == null || user.getId() == null || user.getPw() == null || 
				user.getBirth() == null  || user.getEmail() == null  || 
				user.getGender() == null  || user.getMbti() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력되지 않은 사항이 있습니다')"); //회원가입 오류
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else { // 회원가입 성공
				session.setAttribute("userID", user.getId());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>