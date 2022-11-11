<%@page import="io.opentelemetry.exporter.logging.SystemOutLogRecordExporter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button onclick="location.href='user_delete.jsp'">다시 검색</button>
	<%
		String uid = "";
		uid = (String) session.getAttribute("textbox"); //이부분 뭘해도 null로 입력값이 들어가는데 이부분만 완성하면될듯
		UserDAO udao = new UserDAO();
		int result = 0;
		result = (int) udao.deleteUser(uid);
		
		out.println("입력한 아이디 : "+uid);
		out.println("에러 코드 : "+result);
		
 		if(uid == null || uid == ""){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제할 아이디를 입력하세요.')");
			script.println("</script>");
		}else{
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원 아이디를 다시 검색하세요.')");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원 삭제가 완료되었습니다.')");
				script.println("location.href = 'managerUser.jsp'");
				script.println("</script>");
			}
		}
	
	%>
	<script>
/* 		function SearchID(){ //reply_deleteOK.jsp 참고하고 만듦
 			const uid = document.getElementById('id').value;
		
			if(uid == ""){
				alert("삭제할 아이디를 입력하세요");
			}else{
				const udao = new UserDAO();
	 		 	const result = udao.deleteUser(uid); //이부분만 먹히면 완성임
	 			if(result == -1){
					alert("회원 삭제에 실패했습니다.");
					history.back();
				}else{
					alert("회원 삭제에 성공했습니다.");
					location.href = "managerUser.jsp";
				}
	 			alert(result);
			}
		} */
	</script>
</body>
</html>