<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="reply.Reply"%>
<%@ page import="reply.ReplyDAO"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판 글 보기</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="layout/styles/view.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
   <!-- Top 호출-->
   <jsp:include page="top.jsp" flush="false" />
   <div class="hoc clear">

   <%
     Connection conn = null;
     PreparedStatement pstmt = null;
     ResultSet rs = null;
     String id = request.getParameter("t_id");
     String title = "";
     String content = "";
     String img = "";
     String sql;
     // 댓글 사용자 이미지 가져오기 
     String userID = (String)session.getAttribute("userID");
     String manager = (String)session.getAttribute("manager");
     String mbti = null;
     String img1 = ""; 
     
     if(session.getAttribute("userID") != null){
         userID = (String) session.getAttribute("userID");
      }
     if(session.getAttribute("manager") != null){
        manager = (String)session.getAttribute("manager");
     }
      if(userID == null && manager == null){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('로그인을 하세요.')");
         script.println("location.href = 'login.jsp'");
         script.println("</script>");
      }else{
         PrintWriter script = response.getWriter();
      }

   try{
      String jdbcUrl = "jdbc:mysql://localhost:3306/BBS?useUnicode=yes&characterEncoding=UTF8";
      String dbId = "root";
      String dbPass = "root";
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
      
      sql = "select mbti from user where id = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, userID);
      rs = pstmt.executeQuery();
      
      while(rs.next()){
         mbti = rs.getString("mbti");
      }
      
      if(manager != null){
         mbti = "ISTJ";
      }
      else if(manager == null){
      mbti = (String)mbti.toUpperCase().trim();
      }
      
      switch(mbti){
      case "ENFJ" :
         img1 = "images/mbti/ENFJ.jpg";
         break;
      case "ENFP" :
         img1 = "images/mbti/ENFP.jpg";
         break;
      case "ENTJ" :
         img1 = "images/mbti/ENTJ.jpg";
         break;
      case "ENTP" :
         img1 = "images/mbti/ENTP.jpg";
         break;
      case "ESFJ" :
         img1 = "images/mbti/ESFJ.jpg";
         break;
      case "ESFP" :
         img1 = "images/mbti/ESFP.jpg";
         break;
      case "ESTJ" :
         img1 = "images/mbti/ESTJ.jpg";
         break;
      case "ESTP" :
         img1 = "images/mbti/ESTP.jpg";
         break;
      case "INFJ" :
         img1 = "images/mbti/INFJ.jpg";
         break;
      case "INFP" :
         img1 = "images/mbti/INFP.jpg";
         break;
      case "INTJ" :
         img1 = "images/mbti/INTJ.jpg";
         break;
      case "INTP" :
         img1 = "images/mbti/INTP.jpg";
         break;
      case "ISFJ" :
         img1 = "images/mbti/ISFJ.jpg";
         break;
      case "ISFP" :
         img1 = "images/mbti/ISFP.jpg";
         break;
      case "ISTJ" :
         img1 = "images/mbti/ISTJ.jpg";
         break;
      default :
         img1 = "images/mbti/ISTP.jpg";
         break;
      }
      
      
      
      
      int replyID = 0;
      
      int b_ID = 0;
      // url에 b_ID가 넘어온다면 b_ID 변수에 정보 저장
      if(request.getParameter("b_ID") != null){
         b_ID = Integer.parseInt(request.getParameter("b_ID"));
      }
      if(b_ID==0){
         PrintWriter script=response.getWriter();
         script.println("<script>");
         script.println("alert('유효하지 않은 댓글입니다.')");
         script.println("location.href='board.jsp'");
         script.println("</script>");   
      }
      int pageNumber = 1; // 기본페이지
      if(request.getParameter("pageNumber") != null){
         pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
      }
      
      Bbs bbs = new BbsDAO().getBbs(b_ID);
   %>

   <!-- 게시판 시작 -->

   <div class="topper">
   
   <div class="v_title"><%= bbs.getB_Title().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&tr;") %></div>
      <div class="v_info">  
      <%
      sql = "select mbti from user where id = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, bbs.getId());
      rs = pstmt.executeQuery();
      
      String reply_mbti = "";
      String img3 = "";
      
      while(rs.next()){
         reply_mbti = (String)rs.getString("mbti").toUpperCase().trim();
      }

      switch(reply_mbti){
      case "ENFJ" :
         img3 = "images/mbti/ENFJ.jpg";
         break;
      case "ENFP" :
         img3 = "images/mbti/ENFP.jpg";
         break;
      case "ENTJ" :
         img3 = "images/mbti/ENTJ.jpg";
         break;
      case "ENTP" :
         img3 = "images/mbti/ENTP.jpg";
         break;
      case "ESFJ" :
         img3 = "images/mbti/ESFJ.jpg";
         break;
      case "ESFP" :
         img3 = "images/mbti/ESFP.jpg";
         break;
      case "ESTJ" :
         img3 = "images/mbti/ESTJ.jpg";
         break;
      case "ESTP" :
         img3 = "images/mbti/ESTP.jpg";
         break;
      case "INFJ" :
         img3 = "images/mbti/INFJ.jpg";
         break;
      case "INFP" :
         img3 = "images/mbti/INFP.jpg";
         break;
      case "INTJ" :
         img3 = "images/mbti/INTJ.jpg";
         break;
      case "INTP" :
         img3 = "images/mbti/INTP.jpg";
         break;
      case "ISFJ" :
         img3 = "images/mbti/ISFJ.jpg";
         break;
      case "ISFP" :
         img3 = "images/mbti/ISFP.jpg";
         break;
      case "ISTJ" :
         img3 = "images/mbti/ISTJ.jpg";
         break;
      default :
         img3 = "images/mbti/ISTP.jpg";
         break;
      }
      %> 
      <img src=<%=img3 %> class="v_user" />   
         
         <div class="v_text">
         <div class="v_name"><%= bbs.getId() %></div>
         <div class="v_date"><%= bbs.getB_Date().substring(0, 11) + bbs.getB_Date().substring(11, 13) + "시" + bbs.getB_Date().substring(14, 16) + "분" %></div>
         </div>
      
         
         <div class="g_btn">         
         <%
            if(userID != null && userID.equals(bbs.getId())){
         %>
         <a class="v_btna" onclick="location.href='update.jsp?b_ID=<%=b_ID%>'">수정</a>
         <a onclick="return confirm('정말로 삭제하시겠습니까?')"
            href="b_deleteOK.jsp?b_ID=<%=b_ID%>" class="v_btna">삭제</a>
         <%
            }
         %>
         <a class="v_btna" onclick="location.href='board.jsp'">목록</a>
         <a type="button" onclick="location.href='write.jsp'" class="v_btna" >글쓰기</a>
         </div>
         
      </div><hr>
         
      <div class="v_content">      
         <%= bbs.getB_Content().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&tr;").replaceAll("\n", "<br>") %>
      </div>   
   
   </div>

   <!--       댓글         -->
   <div class="v_down">
   <hr>
      <form action="replyOK.jsp?b_ID=<%= b_ID %>" method="post">      
      <div class="comment">
      <img src=<%=img1 %> class="v_profile" />
      <input id="comment-input" type="text" name="replyContent" maxlength="150" placeholder="댓글을 입력해 주세요.">
      <button class="submit1" onclick="location.href='replyOK.jsp'" type="submit" value="등록">등록</button>         
      </div>
      </form>
         <!-- 데이터 불러오기 -->
         <%
         ReplyDAO replyDAO=new ReplyDAO();
         ArrayList<Reply> list=replyDAO.getList(b_ID, pageNumber);
         for(int i=list.size()-1;i>=0;i--){
            //test에서 타이틀, 테스트 종류, 테스트 상세, 테스트 이미지 불러오기
            sql = "select replyID from reply where replyContent = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, list.get(i).getReplyContent());
            rs = pstmt.executeQuery();
            
            while(rs.next()){
               replyID = Integer.parseInt(rs.getString("replyID"));
            }   
String mbti_img = null;
            
            sql = "select mbti from user where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, list.get(i).getUserID());
            rs = pstmt.executeQuery();
            while(rs.next()){
               mbti_img = rs.getString("mbti");
            }
            
            mbti_img = (String)mbti_img.toUpperCase().trim();
            String img2 = "";
            
            switch(mbti_img){
            case "ENFJ" :
               img2 = "images/mbti/ENFJ.jpg";
               break;
            case "ENFP" :
               img2 = "images/mbti/ENFP.jpg";
               break;
            case "ENTJ" :
               img2 = "images/mbti/ENTJ.jpg";
               break;
            case "ENTP" :
               img2 = "images/mbti/ENTP.jpg";
               break;
            case "ESFJ" :
               img2 = "images/mbti/ESFJ.jpg";
               break;
            case "ESFP" :
               img2 = "images/mbti/ESFP.jpg";
               break;
            case "ESTJ" :
               img2 = "images/mbti/ESTJ.jpg";
               break;
            case "ESTP" :
               img2 = "images/mbti/ESTP.jpg";
               break;
            case "INFJ" :
               img2 = "images/mbti/INFJ.jpg";
               break;
            case "INFP" :
               img2 = "images/mbti/INFP.jpg";
               break;
            case "INTJ" :
               img2 = "images/mbti/INTJ.jpg";
               break;
            case "INTP" :
               img2 = "images/mbti/INTP.jpg";
               break;
            case "ISFJ" :
               img2 = "images/mbti/ISFJ.jpg";
               break;
            case "ISFP" :
               img2 = "images/mbti/ISFP.jpg";
               break;
            case "ISTJ" :
               img2 = "images/mbti/ISTJ.jpg";
               break;
            default :
               img2 = "images/mbti/ISTP.jpg";
               break;
            }
                     
      %>
      <div class="div3">
      <!-- 사용자 이미지 프로 -->
      <img src=<%=img2 %> class="v_profile" />
      
      <div class="div5">
      <div class="div4">
      <!-- 사용자 이름 -->
      <h1 class="username"><%= list.get(i).getUserID() %></h1>
      <!-- 작성 날짜 -->
      <p class="comdate"><%= list.get(i).getR_Date().substring(0, 11) + list.get(i).getR_Date().substring(11, 13) + "시" + list.get(i).getR_Date().substring(14, 16) + "분" %>
      </p>
      <!-- 수정 버튼 -->
      <div class="v_btng">
      <p><a href="reply_update.jsp?b_ID=<%=b_ID%>&replyID=<%=replyID%>"class="btnupdate">수정</a> </p>
      <!-- 삭제 버튼 -->
      <p><a onclick="return confirm('정말로 삭제하시겠습니까?')" href="reply_deleteOK.jsp?replyID=<%=replyID%>"class="btnupdate">삭제</a> </p>
      </div>
      </div>   
      
      <div class="comfont">
       <%= list.get(i).getReplyContent() %> 
      </div>
      
      </div>
      </div>
      <hr>
         <%
         }
      %>
   </div>      
   
   <script src="js/scripts.js?ver=123"></script>
   <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   
   
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