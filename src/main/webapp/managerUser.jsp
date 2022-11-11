<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 게시판</title>
</head>

<br>
<br>
<!-- 게시판 내 글 삭제 및 기타 기능 추가 -->
<form action="delete.jsp" method="post">
	<fieldset>
		<legend align="center">&nbsp;항목 관리</legend>
		<table class="table text-center">
		<button type="submit" class="user_delete" value="회원 삭제" onclick="javascript: form.action='user_delete.jsp';">회원 삭제</button>
		<button type="submit" class="board_delete" value="게시글 삭제" onclick="javascript: form.action='b_deleteOK.jsp';">게시글 삭제</button>
		<button type="submit" class="comments_delete" value="댓글 삭제">댓글 삭제</button>
	</fieldset>
</form>
</body>
</html>