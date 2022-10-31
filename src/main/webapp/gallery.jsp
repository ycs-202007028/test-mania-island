<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<!DOCTYPE html>
<html>
<head>
<title>T.M.I</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<!-- Top Background Image Wrapper -->
 <jsp:include page = "top.jsp" flush = "false"/>
<!-- End Top Background Image Wrapper -->
<div class="wrapper row3">

<%
	String kind = (String)request.getParameter("kind");
	String category = "";
	String s_page = request.getParameter("page");
	String name = "";
	
	int page_num;
	if(s_page == null)
		page_num = 1;
	else
		page_num = Integer.parseInt(s_page);
	
	switch(kind){
	case "love" :
		category = "연애";
		name = category;
		break;
	case "quiz" :
		category = "퀴즈";
		name = category;
		break;
	case "mind" :
		category = "심리";
		name = "미궁";
		break;
	case "cate" :
		category = "유형";
		name = category;
		break;
	}
	%>
  <main class="hoc container clear"> 
    <!-- main body -->
    <div class="content"> 
      <div id="gallery">
        <figure>
          <header class="heading"><%=category %></header>
          <ul class="nospace clear">
	<%
	
	double total = 0.0; //게시판마다 게시글이 총 몇개인지 확인
	int board_num; //한페이지에 10개씩 몇 페이지 나오는지 확인 올림처리 
	
    String t_title = null; //테스트 제목
    String t_img = null; //테스트 이미지
    String t_content = null; //테스트 상세내용
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    
    try{
    	String jdbcUrl = "jdbc:mysql://localhost:3306/BBS?useUnicode=yes&characterEncoding=UTF8";
		String dbId = "root";
		String dbPass = "root";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		String sql = "select count(*) from test where t_kind like ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+name+"%");
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			total = rs.getInt(1); //몇개인지 확인
		}
		int num = (int)total+1;
		total = total/12;
		board_num = (int)Math.ceil(total);
		
		//sql문으로 db에 번호, 제목, 작성자, 종류, 날짜 검색
		sql = "select t_img, t_title, t_content from test where t_kind like ? order by t_id limit ?,?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+name+"%");
		pstmt.setInt(2, (page_num-1)*12);
		pstmt.setInt(3, 12);
		rs = pstmt.executeQuery();
		int i = 0;
		
		//각각의 결과 레코드를 변수에 입력
		while(rs.next()){
			t_img = rs.getString("t_img");
			t_title = rs.getString("t_title");
			t_content = rs.getString("t_content");
			
			if(i % 4 == 0){
%>

            <li class="one_quarter first"><a href="#">
            	<img src=<%=t_img %> alt=""/><div> </div>
            	<div style="font-size:130%; font-weight:BOLD;"><%=t_title %></div>
            	<div><%=t_content %></div>
            </a></li>
            <% 	
			}
			else {
				%>
				<li class="one_quarter"><a href="#">
            	<img src=<%=t_img %> alt=""/><div> </div>
            	<div style="font-size:130%; font-weight:BOLD;"><%=t_title %></div>
            	<div><%=t_content %></div>
            	</a></li>
				<%
			}
			i++;
		}
            %>
          </ul>
        </figure>
      </div>
      <nav class="pagination">
        <ul>
          <li><a href="#">&laquo; 이전</a></li>
            <%
			for(i=1; i<=board_num; i++){
				if(i == page_num){
					%>
					<li class="current">
					<a href="gallery.jsp?kind=<%=kind%>&page=<%=i%>"><%=i%></a>
	      			</li>
					<%
				}else{
			%>
          <li>
			<a href="gallery.jsp?kind=<%=kind%>&page=<%=i%>"><%=i%></a>
	      </li>
	      <%
				}
	      	} 
	      %>
          <li><a href="#">다음 &raquo;</a></li>
        </ul>
      </nav>
    </div>
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>

<div class="wrapper row5">
  <div id="copyright" class="hoc clear"> 
    <p class="fl_left">Copyright &copy; 2022 - All Rights Reserved - <a target="_blank" href="#" title="3학년 1반 - 1조">Disease</a></p>
  </div>
</div>
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.flexslider-min.js"></script>
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
</body>
</html>