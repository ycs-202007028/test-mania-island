<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import = "user.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	삭제할 아이디 검색:<input type="text" id="id" size="20">
	<button onclick="SearchID()">아이디 검색</button>
	<%
		UserDAO udao = new UserDAO();
	%>
	
	<script>
		function SearchID(){ //reply_deleteOK.jsp 참고하고 만듦
			const uid = document.getElementById('id').value;
 			
			if(uid == ""){
				alert("삭제할 아이디를 입력하세요");
			}
		/* 	int result = udao.delete(uid);
			if(result == -1){
				alert("회원 삭제에 실패했습니다.");
				//history.back();	
			}else{
				alert("회원 삭제에 성공했습니다.");
				location.href = "managerUser.jsp";
			}
		}  */
	</script>

</body>
</html>