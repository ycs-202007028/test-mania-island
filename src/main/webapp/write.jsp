<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/custom.css" />
<title>글 작성</title>
</head>
<body>
	<!-- Top 호출-->
	<jsp:include page = "top.jsp" flush = "false"/>
	<hr>
	
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>

	<!-- 게시판 시작 -->

	<div class="container">
		<div class="row">

			<form action="writeOK.jsp" method="post">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;"><font color="black">
								게시판 글쓰기 </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="b_Title" maxlength="50" /></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="b_Content" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>	
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기" />
			</form>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>