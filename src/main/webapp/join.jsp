<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
    <script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
        	//아이디 빈칸 시 알림
            if(!document.userInfo.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
        
            //비밀번호 빈칸 시 알림
            if(!document.userInfo.pw.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            //이름 빈칸 시 알림
            if(!document.userInfo.name.value){
                alert("이름을 입력하세요.");
                return false;
            }
            
            //생일 빈칸 시 알림
            if(!document.userInfo.birth.value){
                alert("생일을 입력하세요.");
                return false;
            }
            
            //닉네임 빈칸 시 알림
            if(!document.userInfo.nickname.value){
                alert("닉네임을 입력하세요.");
                return false;
            }
            
            //이메일 빈칸 시 알림
            if(!document.userInfo.email.value){
                alert("이메일을 입력하세요.");
                return false;
            }
            

        }
      
    </script>
</head>
<body>
	<h2>회원가입</h2>
	<form action="joinOK.jsp" method="post" name="userInfo" onsubmit="return checkValue()">
		Username <input type="text" name="name"/><br><br>
		ID <input type="text" name="id"/><br><br>
		Password <input type="password" name="pw"/><br><br>
		Date <input type="text" name="birth"/><br><br>
		Nickname <input type="text" name="nickname"/><br><br>
		E-Mail <input type="text" name="email"><br><br>
		Gender <input type="radio" name="gender" value="man"/>Male &nbsp;
  			 <input type="radio" name="gender" value="female"/>Female<br><br>
		MBTI <input type="text" name="mbti"><br><br> <!-- mbtim는 입력 선택 -->
		<input type="submit" value="완료" onclick="infoConfirm()"/>
		<input type="reset" value="취소" onclick="javascript:window.location = 'main.jsp'"/>
	</form>
</body>
</html>