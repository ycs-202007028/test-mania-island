<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reply.ReplyDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="reply" class="reply.Reply" scope="page"/>
<jsp:setProperty name="reply" property="replyContent"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test 댓글</title>
</head>
<body>
		
</body>
</html>