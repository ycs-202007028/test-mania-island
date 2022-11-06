<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/custom.css" />
<title>게시판</title>
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</style>
</head>
<body>
	<!-- Top 호출-->
	<jsp:include page="top.jsp" flush="false" />
	<hr>

	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1; // 기본페이지
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>

	<!-- 게시판 시작 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="4"
							style="background-color: #eeeeee; text-align: center;"><font
							color="black">게시판</font></th>
					</tr>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;"><font
							color="black">번호</font></th>
						<th style="background-color: #eeeeee; text-align: center;"><font
							color="black">제목</font></th>
						<th style="background-color: #eeeeee; text-align: center;"><font
							color="black">작성자</font></th>
						<th style="background-color: #eeeeee; text-align: center;"><font
							color="black">작성일</font></th>
					</tr>
				</thead>
				<!-- 데이터 불러오기 -->
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i=0; i<list.size(); i++){
					%>
					<tr>
						<td><%= list.get(i).getB_ID() %></td>
						<td><a href="view.jsp?b_ID=<%=list.get(i).getB_ID()%>"><%= list.get(i).getB_Title() %></a></td>
						<td><%= list.get(i).getId() %></td>
						<td><%= list.get(i).getB_Date().substring(0, 11) + list.get(i).getB_Date().substring(11, 13) + "시" + list.get(i).getB_Date().substring(14, 16) + "분" %></td>
					</tr>
					<%
						}
					%>

				</tbody>
			</table>
			<!-- 다음, 이전 페이지 버튼 -->
			<%
				if(pageNumber != 1){
			%>
			<a href="board.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arraw-left">이전</a>
			<%
				} 
				if(bbsDAO.nextPage(pageNumber + 1)) {
			%>
			<a href="board.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>

			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>