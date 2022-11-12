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
	String r_chk[] = request.getParameterValues("replyck"); //manageUser.jsp에서 넘어온 댓글 삭제 체크 값 배열
	String tr_chk[] = request.getParameterValues("trck"); //manageUser.jsp에서 넘어온 댓글 삭제 체크 값 배열
	String b_chk[] = request.getParameterValues("boardck"); //manageUser.jsp에서 넘어온 게시글 삭제 체크 값 배열
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
		
		//게시글 댓글 삭제
		if(r_chk != null){
			for(i = 0; i < r_chk.length; i++){
			//sql문으로 db에 번호, 제목, 작성자, 종류, 날짜 검색
			sql = "delete from reply where replyID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(r_chk[i]));
			pstmt.executeUpdate();
			}
		}
		//테스트 댓글 삭제
		if(tr_chk != null){
			for(i = 0; i < tr_chk.length; i++){
			//sql문으로 db에 번호, 제목, 작성자, 종류, 날짜 검색
			sql = "delete from test_reply where tr_ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(tr_chk[i]));
			pstmt.executeUpdate();
			}
		}
		//게시글 삭제
		if(b_chk != null){
			for(i = 0; i < b_chk.length; i++){
				//게시글 삭제하면 해당 게시글에 있는 댓글 삭제
				sql = "delete from reply where b_ID=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(b_chk[i]));
				pstmt.executeUpdate();
				sql = "delete from board where b_ID=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(b_chk[i]));
				pstmt.executeUpdate();
			}
		}
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'managerUser.jsp'");
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