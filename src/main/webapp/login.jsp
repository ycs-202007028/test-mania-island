<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link href="layout/styles/connect.css" rel="stylesheet" type="text/css" media="all">
<title>login</title>
</head>
<body>
	
<div class="hoc clear" >
	<div class="box">
		<img alt="" src="images/logo.png">
		<fieldset class="allform">
		<legend>Login</legend>
			<form action="loginOK.jsp" method="post">
						<input type="text" class="user" placeholder="아이디"
							name="id" maxlength="20" /><hr>
						<input type="password" class="ps" placeholder="비밀번호"
							name="pw" maxlength="20" /><hr>
					<button type="submit" class="btnlogin" value="로그인" >로그인</button>
				</form>
		</fieldset>
	</div>
</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>