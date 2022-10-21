<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 게시판</title>
</head>

<br><br>

		<!-- 회원관리 게시판, 승인제, 승인불가 기능 -->
		<form method="post" name="textform">
		<fieldset>
				<legend align="center">&nbsp;댓글관리</legend>
					<table class="table text-center">
						<tr class ="sticky" height=20px;>
							<th>선택</th>
							<th>No.</th>
							<th>학번</th>
							<th>이름</th>
							<th>ID</th>
							<th>가입신청날짜</th>
						</tr>
						<!-- DB에서 signcheck가 X인 사람들만 검색하여 리스트 작성 -->
						<!-- No. 는 for문에서 사용되는 변수를 이용 -->
						<%
						// DB에서 id에 맞는 정보들을 가져온 값
						String StdID = null; // 학번
						String ID = null; // 아이디
						String Name = null; // 이름
						String signcheck = null;
						String date = null; // 가입 신청 날짜
						int i = 1;

						//DB연결
						Connection conn = null;
						PreparedStatement pstmt = null;
						try {
							String jdbcUrl = "jdbc:mysql://localhost:3306/tmi?useUnicode=yes&characterEncoding=UTF8";
							String dbId = "root";
							String dbPass = "jsp2021";
							Class.forName("com.mysql.jdbc.Driver");
							conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

							// SQL문으로 DB내에서 로그인하려는 ID와 PW 이름 검색
							String sql = "select stdid, name, id, sign_date from member where signcheck = 'X'";
							pstmt = conn.prepareStatement(sql);
							ResultSet result = pstmt.executeQuery();
						%>
							<input type="hidden" name="ck" value="1">
						<%
							// 결과 레코드 하나씩마다 ID PW 이름 변수에 입력
							while (result.next()) {
								StdID = result.getString("stdid");
								ID = result.getString("id");
								Name = result.getString("name");
								date = result.getString("sign_date");
						%>
						
						<tr height=30px>
							<td><input type="checkbox" name="memck" value="<%=ID%>"></td>
							<td><%=i%></td>
							<td><%=StdID%></td>
							<td><%=Name%></td>
							<td><%=ID%></td>
							<td><%=date%></td>
						</tr>
						<%
						i++;
						}

						// 에러 처리
						} catch (SQLException ex) {
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
						
						<tr>
						</tr>
					</table>


		<br>
			<button type="submit" class="mem_ok" value="승인" onclick="javascript: form.action='memok.jsp';">승인</button>
			<button type="submit" class="mem_no" value="거절" onclick="javascript: form.action='memno.jsp';">거절</button>
		</fieldset>
		</form>
		<hr>

		<!-- 게시판 내 글 삭제 및 기타 기능 추가 -->
		<form action="delete.jsp" method="post">
			<fieldset>
				<legend align="center">&nbsp;게시판 관리</legend> 
					<table class="table text-center">
						<tr height=20px;>
							<th>선택</th>
							<th>No.</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>내용</th>
						</tr>
						<%
						String b_num = null; //게시글 번호
						String b_writer = null; //작성자
						String b_date = null; //작성일
						String b_content = null; //작성 내용
						
						//DB연결
						Connection conn_b = null;
						PreparedStatement pstmt_b = null;
						ResultSet rs = null;
						try {
							String jdbcUrl = "jdbc:mysql://localhost:3306/tmi?useUnicode=yes&characterEncoding=UTF8";
							String dbId = "root";
							String dbPass = "jsp2021";
							Class.forName("com.mysql.jdbc.Driver");
							conn_b = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
							
							//sql문으로 db에 번호, 작성자id, 날짜, 내용 검색
							String sql = "select boardid, id, wrdate, wrcontent from board order by boardid desc limit 5";
							pstmt_b = conn_b.prepareStatement(sql);
							rs = pstmt_b.executeQuery();
							%>
							
							<input type="hidden" name="check" value="1">
							<%
							//각각의 결과 레코드를 변수에 입력
							while(rs.next()){
								b_num = rs.getString("boardid");
								b_writer = rs.getString("id");
								b_date = rs.getString("wrdate");
								b_content = rs.getString("wrcontent");
								%>
								<tr height=30px>
									<td><input type="checkbox" name="chk" value="<%=b_num%>"></td>
									<td><%=b_num%></td>
									<td><%=b_writer%></td>
									<td><%=b_date%></td>
									<td><%=b_content%></td>
								</tr>
							<%
							}
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
						<tr>
						</tr>
					</table>

		<br>
			<button type="submit" class="board_delete" value="게시글 삭제">게시글 삭제</button>
		</fieldset>
	</form>

</body>
</html>