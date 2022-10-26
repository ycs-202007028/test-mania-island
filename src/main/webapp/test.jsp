<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>타토인형
<meta charset="UTF-8">
<title>test</title>
</head>
<body>
<%
	//저장할 테스트들의 사이트 배열 선언
	//String test[] = {};
	Document doc2 = Jsoup.connect("https://www.banggooso.com/gl/136/").get();

	Elements posts2 = doc2.body().getElementsByClass("app-main");
	Elements file2 = posts2.select("article");

	for(Element e : file2){
	%>
		선택지 설명 : <%=e.select(".question-options button").text() %><br>
		<br>
	<%
	    }

	Document doc1 = 
			Jsoup.connect("https://www.banggooso.com/").get();
	
	// feed-list 속성안에  요소 데이터들을 긁어온다
    Elements posts = doc1.body().getElementsByClass("feed-list");
    Elements file = posts.select("li");
%>
-------------------------------------------------------<br>
<%
    for(Element e : file){
%>
	카테고리 : <%=e.select(".item-header span").text() %><br>
	제목 : <%=e.select(".title_wrap h4").text() %><br>
	설명 : <%=e.select(".title_wrap h5").text() %><br>
	이미지 : <%=e.select(".thumb img").attr("src") %><br>
	<br>
<%
    }
    
    
    
    
%>

</body>
</html>	