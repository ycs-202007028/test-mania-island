<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE HTML>
<html lang="kr">
<head>
 <style>
	ul { background : #FFC000; padding: 6px; text-align: right;}
	#mar { margin: 15px 25px 15px 0px;}
	#rego { border:none; border-radius : 20px; width: 200px; height: 50px; background:#FFC000; top: 200px; left:1300px; position: absolute; text-align:center; color: white; display:block; vertical-align:middle; font-size:15pt; font-weight:bold;}
	#submit { border:none; border-radius:20px; width:100px; height:50px; background:#FFC000; top:650px; left:900px; position:absolute; text-align:center; color:white; display:block; vertical-align:middle; font-size:15pt; font-weight:bold;}
	#comment-input { border-style:bold; border-bottom-color:#FFC000; border-right:0px; border-top:0px; border-left:0px;}
	#other { border:none; border-radius : 20px; width: 210px; height: 50px; background:#FFC000; top: 700px; left:70px; position: absolute; text-align:center; color: white; display:block; vertical-align:middle; font-size:15pt; font-weight:bold;}
	#back { border-color:#FFC000; border-radius:20px; width:1500px; height:250px; background:#FFFFFF; top:715px; left:50px; position:absolute;}
 </style>
  <title>테스트 결과</title>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
 <link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">  
<!-- Top Background Image Wrapper -->
<jsp:include page = "top.jsp" flush = "false"/>

  <br><br><br>
  <hr>
  <p>
  <%
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  String id = request.getParameter("t_id");
  String title = "";
  String img = "";
  String sql;
  int i = 0;

  try{
  	String jdbcUrl = "jdbc:mysql://localhost:3306/BBS?useUnicode=yes&characterEncoding=UTF8";
  	String dbId = "root";
  	String dbPass = "root";
  	Class.forName("com.mysql.jdbc.Driver");
  	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
  	
  	//test에서 타이틀, 테스트 종류, 테스트 상세, 테스트 이미지 불러오기
  	sql = "select t_img, t_title from test where t_id = ?";
  	pstmt = conn.prepareStatement(sql);
  	pstmt.setString(1, id);
  	rs = pstmt.executeQuery();
  	
  	while(rs.next()){
  		title = rs.getString("t_title");
  		img = rs.getString("t_img");  		
  	}
  %>
  
   <div style="padding:60px 20px 40px 50px;">
    <img src=<%=img %> alt="크롤링부분" align="left" width="400" height="400" style="margin-right:2%">
   <span style="margin-top:20px; font-size:20px; color:#FFC000;"><b><%=title %></b></span>
   <br>
    <span style="margin-top:20px; font-size:30px;"><b>보기만 해도 상큼 시원한<br>반전 매력 레몬</b></span>
   <br><br><br>
   <span style="font-size:25px;">"그래서 결론이 뭔데?"</span>
   <br><br><br>
   <span style="font-size:20px;"><b>#평소에 나는..</b></span>
   <br>
   <span style="font-size:20px;">현실적이고 객관적인 판단으로 주위 사람들에게 팩폭을 날리는 상큼 시큼 레몬의 과즙미가 가득해요!<br>언제나 최고 효율적인 판단을 하기 때문에 어정쩡한 논리로 나에게 반박하는 사람을 이해 못 해요.<br></span>
   <br><br>
   <span style="font-size:20px;"><b>#내가 달콤해지는 순간은..</b></span>
    <br>
   <span style="font-size:20px;">모두가 결론만 딱딱 말해서 순식간에 팀플이 마무리되었어요.<br>불합리한 상황에서 나의 논리적인 말로 문제를 해결했어요.</span>
   <!--<footer><a class="btn" href="######">크롤링부분</a></footer><br>-->
    <button id="rego" align="right" onclick="https://www.banggooso.com/gl/58/">테스트 다시하기</button>
   </div>
  </p>
  
  <fieldset style="margin:2.7%">
     <legend>  다른 테스트 하러가기 </legend>
   <img src="https://cdn.banggooso.com/assets/images/uploadImg/1664416656(PC).png" width="350" height="350" href="https://www.banggooso.com/gl/136/" style="margin:2%">
     <img src="https://cdn.banggooso.com/assets/images/uploadImg/1665044743(PC).jpg" width="350" height="350" href="https://www.banggooso.com/gl/138/" style="margin:2%">
   <img src="https://cdn.banggooso.com/assets/images/uploadImg/1663055970(PC).jpg" width="350" height="350" href="https://www.metavv.com/content/10039931" style="margin:2%">
  </fieldset>

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

    <!--<script src="script.js?ver=123"></script>-->
</body>
</html>