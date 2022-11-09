<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="layout/styles/join.css" rel="stylesheet" type="text/css"
	media="all">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<!-- Top 호출-->
	<jsp:include page="top.jsp" flush="false" />

<div class="hoc clear">
	<div class="box">
	<fieldset class="allform">
	<legend >회원가입</legend>
	
		<form action="joinOK.jsp" method="post">
						<input type="text" class="na" placeholder="이름"
							name="name" maxlength="20" /><hr>
						<input type="text" class="user" placeholder="아이디"
							name="id" maxlength="20" /><hr>
						<input type="password" class="ps" placeholder="비밀번호"
							name="pw" maxlength="20" /><hr>
						<input type="date" class="da" placeholder="날짜"
							name="birth" maxlength="20" /><hr>
						<input type="email" class="em" placeholder="e-mail"
							name="email" maxlength="20" /><hr>
					<div class="">
						<div class="div">
						<div class="box1" data-toggle="buttons"> 
							<input type="radio" class="ra" id="male" name="gender" autocomplete="off" value="male" />
							<label for="male">남자</label></div>
						<div class="box2" data-toggle="buttons">
							<input type="radio" class="ra" id="female" name="gender" autocomplete="off" value="female" />
							<label for="female">여자</label></div>
						
					</div><hr>
					</div>
					<div class="mb">
						<input type="text" placeholder="MBTI" name="mbti" maxlength="20" /></div><hr>
					<input type="submit" class="btnok" value="회원가입" />
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