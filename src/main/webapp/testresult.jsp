<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
#rego {
	border: none;
	border-radius: 20px;
	width: 200px;
	height: 50px;
	background: #FFC000;
	color: white;
	font-size: 15pt;
	font-weight: bold;
}
</style>
</head>
<body>
	<!-- Top Background Image Wrapper -->
	<jsp:include page="top.jsp" flush="false" />

	<hr>
		<%
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  String id = request.getParameter("t_id");
  String content = "";
  String img = "";
  String title = "";
  String sql;
  String s_id = "";
  String userID = (String)session.getAttribute("userID");
  int r_count = 0;
  int s_count = 0;
  int i = 0;
  int score = Integer.parseInt(request.getParameter("score"));

  try{
  	String jdbcUrl = "jdbc:mysql://localhost:3306/BBS?useUnicode=yes&characterEncoding=UTF8";
  	String dbId = "root";
  	String dbPass = "root";
  	Class.forName("com.mysql.jdbc.Driver");
  	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
  	
  	sql = "select count(*) from test_result where t_id = ?";
  	pstmt = conn.prepareStatement(sql);
  	pstmt.setString(1,id);
  	rs = pstmt.executeQuery();
  	
  	while(rs.next()){
  		r_count = Integer.parseInt(rs.getString(1));
  	}
  	
  	sql = "select s_content from test_select where t_id = ?";
  	pstmt = conn.prepareStatement(sql);
  	pstmt.setString(1,id);
  	rs = pstmt.executeQuery();
  	
  	while(rs.next()){
  		String[] Array_content= rs.getString("s_content").split(",");
  		s_count = Array_content.length;
  	}
  	
  	for(i = 0; i < r_count; i++){
  	if(score/s_count >= 3*(r_count-i)/s_count){
  		s_id = Integer.toString(r_count-i);
  		break;
  	}
  	}
  	//test에서 타이틀, 테스트 종류, 테스트 상세, 테스트 이미지 불러오기
  	sql = "select r_content, r_img from test_result where t_id = ? and s_id = ?";
  	pstmt = conn.prepareStatement(sql);
  	pstmt.setString(1, id);
  	pstmt.setString(2, s_id);
  	rs = pstmt.executeQuery();
  	
  	while(rs.next()){
  		content = rs.getString("r_content");
  		img = rs.getString("r_img");  		
  	}
  	
  	sql = "select t_title from test where t_id = ?";
  	pstmt = conn.prepareStatement(sql);
  	pstmt.setString(1, id);
  	rs = pstmt.executeQuery();
  	
  	while(rs.next()){
  		title = rs.getString("t_title");		
  	}
  	%>
  	<fieldset>
  	<legend><%=title %></legend>
 <%
  	if(content != null){
  %>
	<div style="padding: 20px;">
		<img src=<%=img %> alt="크롤링부분" style="margin-right: 2%;  width:400; height:400"/> <br>
		<span><%=content %></span>
		<button type="button" id="rego" onclick="location.href='testinfo.jsp?t_id='+<%=id%>">테스트 다시하기</button>
	</div>
<%
  	}else{
  		%>
  		<div style="padding: 20px;">
		<img src=<%=img %> alt="크롤링부분" style="margin-right: 2%;  width:400; height:400"/> 
		<button type="button" id="rego" onclick="location.href='testinfo.jsp?t_id='+<%=id%>">테스트 다시하기</button>
	</div>
  		<%
  	}
%>
</fieldset>
	<fieldset style="margin: 2.7%">
		<legend> 다른 테스트 하러가기 </legend>
		<img src="https://cdn.banggooso.com/assets/images/uploadImg/1664416656(PC).png"
			 href="https://www.banggooso.com/gl/136/" style="margin: 2%; width:350px; height:350px;"/>
		<img src="https://cdn.banggooso.com/assets/images/uploadImg/1665044743(PC).jpg"
			href="https://www.banggooso.com/gl/138/" style="margin: 2%; width:350px; height:350px;"/>
		<img src="https://cdn.banggooso.com/assets/images/uploadImg/1663055970(PC).jpg"
			href="https://www.metavv.com/content/10039931" style="margin: 2%; width:350px; height:350px;"/>
	</fieldset>

	<%
	sql = "select t_id, s_id from user where id = ?";
  	pstmt = conn.prepareStatement(sql);
  	pstmt.setString(1,userID);
  	rs = pstmt.executeQuery();
  	
  	String t_id = null;
  	String s_id2 = null;
  	while(rs.next()){
  		t_id = rs.getString("t_id");
  		s_id2 = rs.getString("s_id");
  	}
	if(t_id == null){
	sql = "update user set t_id = ?, s_id = ? where id = ?";
  	pstmt = conn.prepareStatement(sql);
  	pstmt.setString(1, id);
  	pstmt.setString(2, s_id);
  	pstmt.setString(3, userID);
  	pstmt.executeUpdate();
  	}else{
  		id = id + "," + t_id;
  		s_id = s_id + "," + s_id2;
  		sql = "update user set t_id = ?, s_id = ? where id = ?";
  	  	pstmt = conn.prepareStatement(sql);
  	  	pstmt.setString(1, id);
  	  	pstmt.setString(2, s_id);
  	  	pstmt.setString(3, userID);
  	  	pstmt.executeUpdate();
  	}
  		
}catch(SQLException ex){
	ex.printStackTrace();
} finally {
	try {
		pstmt.close();
	} catch (SQLException sqle) {
	}
	}
%>
</body>
</html>