<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/custom.css" />
<title>Insert title here</title>
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
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		
		//유효한 글 판단
		int b_ID = 0; // url에 b_ID가 넘어온다면 b_ID 변수에 정보 저장
		if(request.getParameter("b_ID") != null){
			b_ID = Integer.parseInt(request.getParameter("b_ID"));
		}
		if (b_ID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		
		//작성한 글이 작성한 자 본인인지 확인 
		Bbs bbs = new BbsDAO().getBbs(b_ID);
		if(!userID.equals(bbs.getId())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
	%>
	
	<!-- 게시판 시작 -->

	<div class="container">
		<div class="row">

			<form action="updateOK.jsp?b_ID=<%= b_ID %>" method="post">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
								글 수정 </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="b_Title" maxlength="50" value="<%= bbs.getB_Title() %>" /></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="b_Content" maxlength="2048" style="height: 350px;"><%= bbs.getB_Content() %></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글수정" />
			</form>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>