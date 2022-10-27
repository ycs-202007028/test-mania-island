<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/custom.css" />
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<!-- Top 호출-->
	<jsp:include page = "top.jsp" flush = "false"/>
	<hr>
	
    <div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form action="joinOK.jsp" method="post">
					<h3 style="text-align: center;">회원가입</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="name" maxlength="20"/>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="id" maxlength="20"/>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="pw" maxlength="20"/>
					</div>
					<div class="form-group">
						<input type="date" class="form-control" placeholder="날짜" name="date" maxlength="20"/>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="e-mail" name="email" maxlength="20"/>
					</div>
					<div class="form-group" style="text-align: left:">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active">
								<input type="radio" name="gender autocomplete="off" value="male" checked />남자
							</label>
							<label class="btn btn-primary">
								<input type="radio" name="gender" autocomplete="off" value="female"/>여자
							</label>
						</div>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="MBTI" name="mbti" maxlength="20"/>
					</div>															
					<input type="submit" class="btn btn-primary form-control" value="회원가입"/>
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>