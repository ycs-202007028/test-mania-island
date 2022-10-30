<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>
<%
Connection conn;
ResultSet rs;
PreparedStatement pstmt;

try{
	String dbURL = "jdbc:mysql://localhost:3306/BBS?useUnicode=yes&characterEncoding=UTF8";
	String dbID = "root";
	String dbPassword = "root";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dbURL,  dbID, dbPassword);

	Document doc1 = 
			Jsoup.connect("https://www.banggooso.com/").get();
	
	// feed-list 속성안에  요소 데이터들을 긁어온다
    Elements posts = doc1.body().getElementsByClass("feed-list");
    Elements file = posts.select("li");
    
    String title;
    String kind;
    String content;
    String img;

    for(Element e : file){
    	
    	title = e.select(".title_wrap h4").text();
    	kind = e.select(".item-header span").text();
    	content = e.select(".title_wrap h5").text();
    	img = e.select(".thumb img").attr("data-src");
    	
    	String SQL = "insert into test(t_title,t_kind,t_content,t_img) values(?,?,?,?)";
    	
    	pstmt = conn.prepareStatement(SQL);
    	pstmt.setString(1, title);
    	pstmt.setString(2, kind);
    	pstmt.setString(3, content);
    	pstmt.setString(4, img);
    	pstmt.executeUpdate();
    }
} finally {	}
%>

</body>
</html>	