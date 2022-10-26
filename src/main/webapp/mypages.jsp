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

<div class = "div1"> 
<div class="box1">
    	<img src="images/demo/gallery/01.png" class="profile"/>    	
    	<h2 class="center" style="margin:20px ">이름</h2>
</div>

<div class="box2">
    	<img src="images/demo/gallery/01.png" class="profile"/>    	
    	<h2 class="center" style="margin:20px ">이름</h2>
</div>
</div>

<div class = "div2"> 
<div class="box3">
    	<progress class="progress" value="50" min="0" max="100"></progress>
</div>

<div class="box4">
    	
</div>
</div>

</body>
</html>