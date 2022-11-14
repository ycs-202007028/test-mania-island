<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="layout/styles/write.css" rel="stylesheet" type="text/css"	media="all">

<title>글 작성</title>
</head>
<body>

	<!-- Top 호출-->
	<jsp:include page="top.jsp" flush="false" />
	<div class="hoc clear">
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>

	<!-- 게시판 시작 -->
			<div class="allofus">
			<div class="title"><span class="s_title">게시판 글쓰기</span></div>
			<form action="writeOK.jsp" method="post">				
			<input type="text" class="b_title"
							placeholder="글 제목" name="b_Title" maxlength="50"/>
						
			<textarea class="b_content" placeholder="글 내용" name="b_Content" maxlength="2048"></textarea>
				<div class="btnarea">
				<button type="submit" class="write" value="글쓰기" >글쓰기</button>
				</div>
			</form>
		
	</div></div>
	
	<div class="wrapper row5">
		<div id="copyright" class="hoc clear">
			<p class="fl_left">
				Copyright &copy; 2022 컴퓨터소프트웨어학과 - <a target="_blank"
					href="https://github.com/ycs-202007028/test-mania-island"
					title="3학년 1반 - 1조">T.M.I</a>
			</p>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>