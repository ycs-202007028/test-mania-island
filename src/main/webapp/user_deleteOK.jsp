<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%    
	String u_chk[] = request.getParameterValues("userck"); //user_deleteOK.jsp에서 넘어온 댓글 삭제 체크 값 배열
	String writer = (String)session.getAttribute("userID"); //로그인 한 사람의 이름
    String manager = (String)session.getAttribute("MName"); //마스터 로그인 시
    
    int i;
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    String sql = null;
    try{
    	String jdbcUrl = "jdbc:mysql://localhost:3306/BBS?useUnicode=yes&characterEncoding=UTF8";
		String dbId = "root";
		String dbPass = "root";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		//게시글 삭제
		if(u_chk != null){
			for(i = 0; i < u_chk.length; i++){
				//게시글 삭제하면 해당 게시글에 있는 댓글 삭제
				sql = "delete from reply where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, u_chk[i]);
				pstmt.executeUpdate();
				sql = "delete from test_reply where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, u_chk[i]);
				pstmt.executeUpdate();
				sql = "delete from user where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, u_chk[i]);
				pstmt.executeUpdate();
			}
		}
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'user_Drop.jsp'");
		script.println("</script>");
		
	    }catch(SQLException ex){
	    	ex.printStackTrace();
	    } finally {
			if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException sqle) {
			}
	    }
    %>
</body>
</html>