<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>

</head>
<body>
	<h2>로그인</h2>
		<form action="loginOK.jsp" method="post">
		<div>
			ID
				<input type="text" name="id" placeholder="ID" />
		</div>
		<br>
		<div>
			PW
				<input type="password" name="pw" placeholder="PW" />
		</div>
		<hr>
				<input type="submit" value="로그인"/>
				<input type="button" value="회원가입" onclick="javascript:window.location='join.jsp'"/>
			</form>
</body>
</html>