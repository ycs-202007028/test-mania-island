<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="layout/styles/mypages.css" rel="stylesheet" type="text/css"
	media="all">
<title>my pages</title>
</head>
<body>
	<jsp:include page="top.jsp" flush="false" /><hr>
	<br>
	<div class="hoc clear">
		<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql;

//마이페이지에 들어가는 정보를 저장하기 위한 변수
String userID = (String)session.getAttribute("userID");
String name = null;
String birth = null;
String email = null;
String gender = null;
String mbti = null;
int t_count = 0;
int r_count = 0;
String img = ""; //mbti별 이미지를 저장하기 위한 변수
String t_id = null;

//나이 저장 변수
String year = null;
String month = null;
String date = null;

try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/BBS?useUnicode=yes&characterEncoding=UTF8";
	String dbId = "root";
	String dbPass = "root";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
	//test에서 타이틀, 테스트 종류, 테스트 상세, 테스트 이미지 불러오기
	sql = "select name, birth, email, gender, mbti, t_id from user where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userID);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		name = rs.getString("name");
		birth = rs.getString("birth");
		email = rs.getString("email");
		gender = rs.getString("gender");
		mbti = rs.getString("mbti");
		t_id = rs.getString("t_id");

		if(t_id == null){
			r_count = 0;
			}
		else if (t_id != null){
			String array_t[] = t_id.split(",");
			r_count = array_t.length;
		}
	}
	
	sql = "select count(*) from test";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		t_count = rs.getInt(1);
	}
	
	mbti = (String)mbti.toUpperCase().trim();
	
	switch(mbti){
	case "ENFJ" :
		img = "images/mbti/ENFJ.jpg";
		break;
	case "ENFP" :
		img = "images/mbti/ENFP.jpg";
		break;
	case "ENTJ" :
		img = "images/mbti/ENTJ.jpg";
		break;
	case "ENTP" :
		img = "images/mbti/ENTP.jpg";
		break;
	case "ESFJ" :
		img = "images/mbti/ESFJ.jpg";
		break;
	case "ESFP" :
		img = "images/mbti/ESFP.jpg";
		break;
	case "ESTJ" :
		img = "images/mbti/ESTJ.jpg";
		break;
	case "ESTP" :
		img = "images/mbti/ESTP.jpg";
		break;
	case "INFJ" :
		img = "images/mbti/INFJ.jpg";
		break;
	case "INFP" :
		img = "images/mbti/INFP.jpg";
		break;
	case "INTJ" :
		img = "images/mbti/INTJ.jpg";
		break;
	case "INTP" :
		img = "images/mbti/INTP.jpg";
		break;
	case "ISFJ" :
		img = "images/mbti/ISFJ.jpg";
		break;
	case "ISFP" :
		img = "images/mbti/ISFP.jpg";
		break;
	case "ISTJ" :
		img = "images/mbti/ISTJ.jpg";
		break;
	default :
		img = "images/mbti/ISTP.jpg";
		break;
	}

	year = birth.substring(0,4);
	month = birth. substring(5,7);
	date = birth.substring(8,10);
	
	int old = 2022 - Integer.parseInt(year) + 1;
	%>
		<!-- 상단 두개 -->
		<div class="div1">

			<!-- 마이페이지 프로필부분 -->
			<div class="box1">
				<img src=<%=img %> class="profile" />
				<h2 class="center" style="margin: 20px"><%=name %></h2>
			</div>

			<!-- 마이페이지 info부분 -->
			<!-- 사용자 정보 불러오는 법 알아오 -->
			<div class="box2">
				<table>
					<tr>
						<td>이 &nbsp; 름 :</td>
						<td><%=name %></td>
						<td>생년월일 :</td>
						<td><%=year %>년 <%=month %>월 <%=date %>일</td>
					</tr>
					<tr>
						<td>MBTI :</td>
						<td><%=mbti %></td>
						<td>나 &nbsp; &nbsp; 이 :</td>
						<td><%=old %>살</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td>성 &nbsp; &nbsp; 별 :</td>
						<td><%=gender %></td>
					</tr>
				</table>
				<button class="update" type="button">수정</button>
			</div>
		</div>

		<!-- 하단 두개 -->
		<div class="div2">

			<!-- 프로그레스 -->
			<div class="box3">
				<h2 style="text-align: left; margin-left: 30px;">
					테스트 진행률 &nbsp; &nbsp;
					<%=r_count %>
					/
					<%=t_count %></h2>
				<progress class="progress" value=<%=r_count %> min="0"
					max=<%=t_count %>></progress>
				<hr>
				<button class="bn" type="button">내가 쓴 글 / 댓글</button>
				<button class="bn" type="button"
					onclick="location.href='t_result.jsp'">테스트 결과 보기</button>
			</div>

			<!--  변경버튼 모아놓음 -->
			<div class="box4">
				<table>
					<tr>
						<td>아이디 :</td>
						<td><%=userID %></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<button class="ps">비밀번호 변경</button>
						</td>
					</tr>
					<tr>
						<td>이메일 :</td>
						<td><%=email %></td>
					</tr>
				</table>
			</div>
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
</body>
</html>