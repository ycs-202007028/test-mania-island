<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="layout/styles/testres.css" rel="stylesheet" type="text/css"	media="all">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
</head>
<body>
	<!-- Top Background Image Wrapper -->
	<jsp:include page="top.jsp" flush="false" />
	<div class="hoc clear">

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
	<fieldset class="testres">
	<div class="testBox">
	<a class="testlabel"><%=title %></a>
	</div>		
		<%
  	if(content != null){
  %>	
		<div class="t_res"">
			<img src=<%=img %> alt="크롤링부분"
				style="margin-right: 2%; width: 400; height: 400" /> <br> 
				<span class="note"><%=content %></span>
			<button type="button" class="rego"
				onclick="location.href='testinfo.jsp?t_id='+<%=id%>">테스트
				다시하기</button>
		</div>
		<%
  	}else{
  		%>
		<div class="t_res" >
			<img src=<%=img %> alt="크롤링부분"
				style="margin-right: 2%; width: 400; height: 400" /><br>
			<button type="button" class="rego"
				onclick="location.href='testinfo.jsp?t_id='+<%=id%>">테스트
				다시하기</button>
		</div>
		<%
  	}
%>
	</fieldset>
	
	<hr>
	<div class="otherBox">
	<a class="otherlabel">다른 테스트 하러 가기</a>
	</div>
	<fieldset class="othertest">
	<%
	String t_img = "";
	String t_title = "";
	String id_t = "";
  	//test에서 타이틀, 테스트 종류, 테스트 상세, 테스트 이미지 불러오기
  	sql = "select t_img, t_title, t_id from test order by t_id limit 3";
  	pstmt = conn.prepareStatement(sql);
  	rs = pstmt.executeQuery();
  	
  	while(rs.next()){
  		t_title = rs.getString("t_title");
  		t_img = rs.getString("t_img");  
  		id_t = rs.getString("t_id");
	%>
	
	<li class="one_third">
		<a href="testinfo.jsp?t_id=<%=id_t%>">
			<img style=" width: 90%; height: 180px; object-fit :contain;" src=<%=t_img %> alt="" />
		</a>
		<div class="fontall">
			<a class="fonttitle"><%=t_title %></a>
		</div>
		
	</li>
	
	<%
  	}
	%>
	</fieldset>
	

	<%
	sql = "select t_id, s_id from user where id=?";
  	pstmt = conn.prepareStatement(sql);
  	pstmt.setString(1, userID);
  	rs = pstmt.executeQuery();
  	
  	String t_id = null; //진행한 테스트 아이디 저장 ex)'1,2,3,4'
  	String s_id2 = null; //테스트 결과 아이디 저장 ex)'2,5,6,8'
  	while(rs.next()){
  		t_id = rs.getString("t_id");
  		s_id2 = rs.getString("s_id");
  	}
  	
  	if(t_id == null){
  		t_id = id;
  		s_id2 = s_id;
  		sql = "update user set t_id = ?, s_id = ? where id = ?";
	  	pstmt = conn.prepareStatement(sql);
	  	pstmt.setString(1, t_id);
	  	pstmt.setString(2, s_id2);
	  	pstmt.setString(3, userID);
	  	pstmt.executeUpdate();
  	}else if(t_id != null){
  		String t_array[] = t_id.split(",");
	  	String s_array[] = s_id2.split(",");
	  	if(Integer.parseInt(t_array[0]) == Integer.parseInt(id)){
	  		//테스트를 처음 하고 한번 더 했을 때 결과 재저장
	  		if(t_array.length == 1){
	  			t_id = id;
	  			s_id2 = s_id;
	  			sql = "update user set t_id = ?, s_id = ? where id = ?";
	  		  	pstmt = conn.prepareStatement(sql);
	  		  	pstmt.setString(1, t_id);
	  		  	pstmt.setString(2, s_id2);
	  		  	pstmt.setString(3, userID);
	  		  	pstmt.executeUpdate();
	  		//다른 테스트 실행 후 처음 한 테스트 한번 더 했을 때 결과 재저장
	  		}else{
		  		t_id = id;
		  		s_id2 = s_id;
		  		for(i=1; i<t_array.length; i++){
		  			t_id = t_id + "," + t_array[i];
		  			s_id2 = s_id2 + "," + s_array[i];
		  		}
		  		sql = "update user set t_id = ?, s_id = ? where id = ?";
			  	pstmt = conn.prepareStatement(sql);
			  	pstmt.setString(1, t_id);
			  	pstmt.setString(2, s_id2);
			  	pstmt.setString(3, userID);
			  	pstmt.executeUpdate();
	  		}
	  	//첫번째 테스트랑 현재 진행한 테스트가 다를 때
	  	}else if(Integer.parseInt(t_array[0]) != Integer.parseInt(id)){
	  		if(t_array.length == 1){
	  			t_id = t_array[0] + "," + id;
		  		s_id2 = s_array[0] + "," + s_id;
		  		sql = "update user set t_id = ?, s_id = ? where id = ?";
			  	pstmt = conn.prepareStatement(sql);
			  	pstmt.setString(1, t_id);
			  	pstmt.setString(2, s_id2);
			  	pstmt.setString(3, userID);
			  	pstmt.executeUpdate();
	  		}
	  		else if(t_array.length > 1){
	  			t_id = t_array[0];
		  		s_id2 = s_array[0];
		  		int flag = 0; //현재 테스트를 이전에도 진행한 적 있는지 확인
		  		for(i=1; i<t_array.length; i++){
		  			//이전에 진행한 테스트와 현재 테스트가 같을 때
		  			if(Integer.parseInt(t_array[i]) == Integer.parseInt(id)){
		  				t_array[i] = id;
		  				s_array[i] = s_id;
		  				flag = 1;
		  			}
		  			t_id = t_id + "," + t_array[i];
		  			s_id2 = s_id2 + "," + s_array[i];
		  			//이전에 진행한 테스트와 현재 테스트가 다를 때
		  			if(Integer.parseInt(t_array[i]) != Integer.parseInt(id) && i == t_array.length-1 && flag == 0){
			  			t_id = t_id + "," + id;
			  			s_id2 = s_id2 + "," + s_id;
		  			}
		  			
		  		}
		  		sql = "update user set t_id = ?, s_id = ? where id = ?";
			  	pstmt = conn.prepareStatement(sql);
			  	pstmt.setString(1, t_id);
			  	pstmt.setString(2, s_id2);
			  	pstmt.setString(3, userID);
			  	pstmt.executeUpdate();
	  		}
	  	}
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
	</div> 
	<div class="wrapper row5">
		<div id="copyright" class="hoc clear">
			<p class="fl_left">
				Copyright &copy; 2022 컴퓨터소프트웨어학과 - <a target="_blank"
					href="https://github.com/ycs-202007028/test-mania-island"
					title="3학년 1반 - 1조">T.M.I</a>
			</p>
		</div>
	</div>
</body>
</html>