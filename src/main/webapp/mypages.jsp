<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="layout/styles/mypages.css" rel="stylesheet" type="text/css" media="all">
<title>my pages</title>
</head>
<body>
<jsp:include page = "top.jsp" flush = "false"/>

<fieldset class ="" >
<legend>profile</legend>
<div>
	<div style="padding-bottom:10%" id="profile">
    	<img src="images/demo/gallery/01.png" width="30%" "/>
    </div>
</fieldset>

<fieldset class ="" id="info">
<legend>info</legend>
이름
생년월일
</fieldset>

<fieldset class ="" id="test">
<legend>test</legend>
<progress value="20" max="100" id = "psbar"></progress>
</fieldset>

<fieldset class ="" id="profile">
<legend>profile</legend>
</fieldset>

</body>
</html>