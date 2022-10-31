<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>T.M.I</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/custom.css" />
</head>
<body id="top">
<!-- Top Background Image Wrapper -->
<jsp:include page = "top.jsp" flush = "false"/>
<hr>
  <div id="pageintro" class="hoc clear"> 
    <div class="flexslider basicslider">

<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String title[] = new String[3];
String id[] = new String[3];
String content[] = new String[3];
String n_img[] = new String[3];
String sql;
int i = 0;

try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/BBS?useUnicode=yes&characterEncoding=UTF8";
	String dbId = "root";
	String dbPass = "root";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
	//test에서 타이틀, 테스트 종류, 테스트 상세, 테스트 이미지 불러오기
	sql = "select t_img, t_title, t_content, t_id from test order by t_id desc limit 3";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		title[i] = rs.getString("t_title");
		content[i] = rs.getString("t_content");
		n_img[i] = rs.getString("t_img");
		id[i] = rs.getString("t_id");
		i++;
		
	}
	%>
    <ul class="slides">
    <li>
      <article>
      	<h3 class="heading">NEW</h3>
      	<a href="testinfo.jsp?t_id=<%=id[0]%>">
        <img src=<%=n_img[0] %> style="display: block; margin: 0 auto; width:600px; height:300px"/><br>
        <%=title[1] %><br>
        </a>
      </article>
    </li>
    <li>
      <article>
        <h3 class="heading">NEW</h3>
        <a href="testinfo.jsp?t_id=<%=id[1]%>">
        <img src=<%=n_img[1] %> style="display: block; margin: 0 auto; width:600px; height:300px"/><br>
        <%=title[1] %><br>
        </a>
      </article>
    </li>
    <li>
      <article>
        <h3 class="heading">NEW</h3>
        <a href="testinfo.jsp?t_id=<%=id[2]%>">
        <img src=<%=n_img[2] %> style="display: block; margin: 0 auto; width:600px; height:300px"/><br>
        <%=title[2] %><br>
        </a>
      </article>
    </li>
  </ul>

	</div>
</div>

<!-- End Top Background Image Wrapper -->
<%
//test에서 타이틀, 테스트 종류, 테스트 상세, 테스트 이미지 불러오기
sql = "select t_img, t_title, t_id from test where t_id <= 3";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
i = 0;

while(rs.next()){
	id[i] = rs.getString("t_id");
	title[i] = rs.getString("t_title");
	n_img[i] = rs.getString("t_img");
	i++;	
}
%>
<div class="wrapper">
  <div class="hoc clear"> 
	<div style="border-radius:10px; width:67px; background-color:#F7AD19; color:#FFFFFF; font-size:150%; padding:5px;text-align:center;">Best3</div>
    <figure id="introblocks">
      <ul class="nospace group">
        <li class="one_third first"><a href="testinfo.jsp?t_id=<%=id[0]%>"><img src=<%=n_img[0] %> alt=""><%=title[0] %></a></li>
        <li class="one_third"><a href="testinfo.jsp?t_id=<%=id[1]%>"><img src=<%=n_img[1] %> alt=""><%=title[1] %></a></li>
        <li class="one_third"><a href="testinfo.jsp?t_id=<%=id[2]%>"><img src=<%=n_img[2] %> alt=""><%=title[2] %></a></li>
      </ul>
    </figure>
  </div>
</div>
<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <article class="group btmspace-80">
    </article>
    <hr class="btmspace-80">
    <div style="border-radius:10px; width:67px; background-color:#F7AD19; color:#FFFFFF; font-size:150%; padding:5px;text-align:center;">연애</div>
    <figure id="introblocks">
    <ul class="nospace group overview">
<%
	//test에서 타이틀, 테스트 종류, 테스트 상세, 테스트 이미지 불러오기
	sql = "select t_img, t_title, t_id from test where t_kind like '%연애%' limit 3";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	i = 0;

	while(rs.next()){
		id[i] = rs.getString("t_id");
		title[i] = rs.getString("t_title");
		n_img[i] = rs.getString("t_img");
		i++;	
	}
%>
      <li class="one_third">
        <a href="testinfo.jsp?t_id=<%=id[0]%>"><img src=<%=n_img[0] %> alt=""><%=title[0] %></a>
      </li>
      <li class="one_third">
        <a href="testinfo.jsp?t_id=<%=id[1]%>"><img src=<%=n_img[1] %> alt=""><%=title[1] %></a>
      </li>
      <li class="one_third">
        <a href="testinfo.jsp?t_id=<%=id[2]%>"><img src=<%=n_img[2] %> alt=""><%=title[2] %></a>
      </li>
     </ul>
     </figure>
     <div style="border-radius:10px; width:67px; background-color:#F7AD19; color:#FFFFFF; font-size:150%; padding:5px;text-align:center;">유형</div>
     <figure id="introblocks">
     <ul class="nospace group overview">
<%
	//test에서 타이틀, 테스트 종류, 테스트 상세, 테스트 이미지 불러오기
	sql = "select t_img, t_title, t_id from test where t_kind like '%유형%' limit 3";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	i = 0;

	while(rs.next()){
		id[i] = rs.getString("t_id");
		title[i] = rs.getString("t_title");
		n_img[i] = rs.getString("t_img");
		i++;	
	}
%>
      <li class="one_third">
        <a href="testinfo.jsp?t_id=<%=id[0]%>"><img src=<%=n_img[0] %> alt=""><%=title[0] %></a>
      </li>
      <li class="one_third">
        <a href="testinfo.jsp?t_id=<%=id[1]%>"><img src=<%=n_img[1] %> alt=""><%=title[1] %></a>
      </li>
      <li class="one_third">
        <a href="testinfo.jsp?t_id=<%=id[2]%>"><img src=<%=n_img[2] %> alt=""><%=title[2] %></a>
      </li>
     </ul>
     </figure>
     <div style="border-radius:10px; width:67px; background-color:#F7AD19; color:#FFFFFF; font-size:150%; padding:5px;text-align:center;">퀴즈</div>
     <figure id="introblocks">
     <ul class="nospace group overview">
     <%
	//test에서 타이틀, 테스트 종류, 테스트 상세, 테스트 이미지 불러오기
	sql = "select t_img, t_title, t_id from test where t_kind like '%퀴즈%' limit 3";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	i = 0;

	while(rs.next()){
		id[i] = rs.getString("t_id");
		title[i] = rs.getString("t_title");
		n_img[i] = rs.getString("t_img");
		i++;	
	}
%>
      <li class="one_third">
        <a href="testinfo.jsp?t_id=<%=id[0]%>"><img src=<%=n_img[0]%> alt=""><%=title[0] %></a>
      </li>
      <li class="one_third">
        <a href="testinfo.jsp?t_id=<%=id[1]%>"><img src=<%=n_img[1]%> alt=""><%=title[1] %></a>
      </li>
      <li class="one_third">
        <a href="testinfo.jsp?t_id=<%=id[2]%>"><img src=<%=n_img[2]%> alt=""><%=title[2] %></a>
      </li>
     </ul>
     </figure>
     <div style="border-radius:10px; width:67px; background-color:#F7AD19; color:#FFFFFF; font-size:150%; padding:5px;text-align:center;">심리</div>
     <figure id="introblocks">
     <ul class="nospace group overview">
     <%
	//test에서 타이틀, 테스트 종류, 테스트 상세, 테스트 이미지 불러오기
	sql = "select t_img, t_title, t_id from test where t_kind like '%미궁%' limit 3";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	i = 0;

	while(rs.next()){
		id[i] = rs.getString("t_id");
		title[i] = rs.getString("t_title");
		n_img[i] = rs.getString("t_img");
		i++;	
	}
%>
      <li class="one_third">
        <a href="testinfo.jsp?t_id=<%=id[0]%>"><img src=<%=n_img[0]%> alt=""><%=title[0] %></a>
      </li>
      <li class="one_third">
        <a href="testinfo.jsp?t_id=<%=id[1]%>"><img src=<%=n_img[1]%> alt=""><%=title[1] %></a>
      </li>
      <li class="one_third">
        <a href="testinfo.jsp?t_id=<%=id[2]%>"><img src=<%=n_img[2]%> alt=""><%=title[2] %></a>
      </li>
    </ul>
    </figure>
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<div class="wrapper row5">
  <div id="copyright" class="hoc clear"> 
    <p class="fl_left">Copyright &copy; 2022 컴퓨터소프트웨어학과- <a target="_blank" href="#" title="3학년 1반 - 1조">T.M.I</a></p>
  </div>
</div>
	<%
	
}catch(SQLException ex){
	ex.printStackTrace();
} finally {
	if (pstmt != null)
	try {
		pstmt.close();
	} catch (SQLException sqle) {
	}

	if (conn != null)
	try {
		conn.close();
	} catch (SQLException sqle) {
	}
	}
%>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.flexslider-min.js"></script>
</body>
</html>