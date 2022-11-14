<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="layout/styles/board.css" rel="stylesheet" type="text/css"	media="all">
<title>게시판</title>
</head>
<body>
	<!-- Top 호출-->
	<jsp:include page="top.jsp" flush="false" />
	<div class="hoc clear">
	
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1; // 기본페이지
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>

	<!-- 게시판 시작 -->
	<div >
  	<h1>게시판</h1>
  	<h4>자유롭게 글을 쓸 수 있는 게시판입니다.</h4>
  	</div>
  	
  	<div class="allofus">
    <table class ="contents">
      <thead class="conth">
          <tr>
              <th>NO</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>작성일</th>
            </tr>
       </thead>
        
        <!-- 데이터 -->
        <%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i=0; i<list.size(); i++){
					%>
      <tbody>
        <tr>
        	<td width="10%"><%= list.get(i).getB_ID() %></td>
			<td width="40%"><a href="view.jsp?b_ID=<%=list.get(i).getB_ID()%>"><%= list.get(i).getB_Title() %></a></td>
			<td width="20%"><%= list.get(i).getId() %></td>
			<td width="30%"><%= list.get(i).getB_Date().substring(0, 11) + list.get(i).getB_Date().substring(11, 13) + "시" + list.get(i).getB_Date().substring(14, 16) + "분" %></td>
        </tr>
        <%
				}
			%>
      </tbody>
    </table>
    <div class="btnarea">
			<button class="write" onclick="location.href='write.jsp'" type="submit" value="글쓰기">글쓰기</button>
			</div>
	
			<!-- 다음, 이전 페이지 버튼 -->
			<%
				if(pageNumber != 1){
			%>
			<a href="board.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arraw-left">이전</a>
			<%
				} 
				if(bbsDAO.nextPage(pageNumber + 1)) {
			%>
			<a href="board.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
			
			
			
		</div>	
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