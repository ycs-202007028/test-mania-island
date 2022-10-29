<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="layout/styles/mypages.css" rel="stylesheet" type="text/css" media="all">
<title>my pages</title>
</head>
<body>
<jsp:include page = "top.jsp" flush = "false"/>
<br>
<div class="hoc clear">

<!-- 상단 두개 --> 
	<div class = "div1">
	
	<!-- 마이페이지 프로필부분 -->
		<div class="box1">
    		<img src="images/mbti/ESFP.jpg" class="profile"/>    	
    		<h2 class="center" style="margin:20px ">이름</h2>
		</div>
		
	<!-- 마이페이지 info부분 -->
	<!-- 사용자 정보 불러오는 법 알아오 -->
		<div class="box2">
    		<table >    		
    		<tr> <td>이 &nbsp; 름 : </td> <td></td> 	<td>생년월일 : </td> 				<td></td> </tr>
    		<tr> <td>MBTI : </td> 			 <td></td> 	<td>나 &nbsp; &nbsp; 이 : </td> 	<td></td> </tr>
    		<tr> <td></td> 					 <td></td> 	<td>성 &nbsp; &nbsp; 별 : </td> 	<td></td> </tr>
    		</table>
    		<button class="update" type="button">수정</button>
    		
		</div>		
	</div>
	
<!-- 하단 두개 -->
	<div class = "div2"> 
	
	<!-- 프로그레스 -->
		<div class="box3">
			<h2 style="text-align: left; margin-left:30px;"> 테스트 진행률 </h2>
    		<progress class="progress" value="60" min="0" max="100"></progress>
    		<hr>
    		<button class="bn" type="button" >내가 쓴 글 / 댓글</button>
    		<button class="bn" type="button" >테스트 결과 보기</button>
    		
		</div>
		
	<!--  변경버튼 모아놓음 -->
		<div class="box4">
    		<table >    		
    		<tr> <td>아이디 : </td> <td></td> </tr>
    		<tr> <td>비밀번호 </td> <td> <button class="ps">비밀번호 변경</button> </td> </tr>
    		<tr> <td>이메일 : </td> <td></td></tr>
    		</table>
		</div>
	</div>
</div>

</body>
</html>