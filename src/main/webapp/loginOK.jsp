<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
	<% 
	// 관리자 전용 ID/PW
	//String MasterID = (String)application.getInitParameter("MasterID");
	//String MasterPW = (String)application.getInitParameter("MasterPassword");
    //String MasterName = (String)application.getInitParameter("MasterName");
    
    // login.jsp에서 POST로 받아온 값
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    
    // DB에서 id에 맞는 정보들을 가져온 값
    String uid = null;
    String upw = null;
    String name = null;
    
    
    // DB연결
    Connection conn=null;
	PreparedStatement pstmt = null;
	String str = "";
	String prnM=null;
	
	try{
       String jdbcUrl="jdbc:mysql://localhost:3306/tmi?useUnicode=yes&characterEncoding=UTF8";
    String dbId="root";
    String dbPass="jsp2021";
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
    
    // SQL문으로 DB내에서 로그인하려는 ID와 PW 이름 검색
    String sql = "select id, pw, name from member where id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    ResultSet result = pstmt.executeQuery();
    
    // 결과 레코드 하나씩마다 ID PW 이름 변수에 입력
    while(result.next())
    {
    	uid = result.getString("id");
    	upw = result.getString("pw");
    	name = result.getString("name");
    }
    
    // 에러 처리
	}catch(SQLException ex){
	    ex.printStackTrace();
	}finally{
	    if(pstmt !=null)
	        try{pstmt.close();}catch(SQLException sqle){}

	    if(conn !=null)
	        try{conn.close();}catch(SQLException sqle){}
	}

    // 로그인 결과 처리 ( 로그인 성공시 세션 처리 )
    //if (id.equals(MasterID) && pw.equals(MasterPW)) // 관리자 로그인시
    //{
    	//session.setAttribute("MLoginID", MasterID);   // 로그인 성공을 나타내는 특정 속성 설정
        //session.setAttribute("MName" , MasterName);
%>
<!-- 
<script>
	alert("관리자로 로그인 되었습니다.");
	location.href="main.jsp";
</script>
 -->
<%
    //}
    System.out.println(uid);
    if(id.equals(uid) && pw.equals(upw)) //아이디와 패스워드 모두 일치
    {  
     	session.setAttribute("LoginID", id);   // 로그인 성공을 나타내는 특정 속성 설정
     	session.setAttribute("Name" , name);
%>
<script>
	alert("로그인 되었습니다.");
	location.href="main.jsp";
</script>
<%
	}
	else if (id.equals(uid)){
%>
<script>
alert("패스워드가 다릅니다.");
history.go(-1);
</script>
<%
	}else {
%>
<script>
alert("존재하지 않는 ID입니다.");
history.go(-1);
</script>
<%
}
%>