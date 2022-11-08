<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="layout/styles/connect.css" rel="stylesheet" type="text/css"
	media="all">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<title>login</title>
</head>
<body>

	<div class="hoc clear">
		<div class="box">

			<fieldset class="allform">
				<legend>
					<a href="main.jsp"><img alt="logo" src="images/logo.png">
					</a>
				</legend>
				<form action="loginOK.jsp" method="post">
					<input type="text" class="user" placeholder="아이디" name="id"
						maxlength="20" />
					<hr>
					<input type="password" class="ps" placeholder="비밀번호" name="pw"
						maxlength="20" />
					<hr>
					<div class="divlog">
						<button type="submit" class="btnlogin" value="로그인">로그인</button>
						<button type="submit" class="btnsign" value="회원가입">회원가입</button>
					</div>
				</form>
			</fieldset>
		</div>
	</div>

	<div class="footer" id="footer">
		<div class="wrapper row5">
			<div id="copyright" class="hoc clear">
				<p class="fl_left">
					Copyright &copy; 2022 컴퓨터소프트웨어학과 - <a target="_blank"
						href="https://github.com/ycs-202007028/test-mania-island"
						title="3학년 1반 - 1조">T.M.I</a>
				</p>
			</div>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>