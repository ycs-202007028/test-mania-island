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
	String SQL = "";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dbURL,  dbID, dbPassword);
    
    String title;
    String kind;
    String content;
    String img;
    String src; //선택지 따올 테스트의 주소
    
	int i=0; //테스트 5개만 가져와서 저장
	
	//--------------------------------------방구석연구소 크롤링 시작-----------------------------------------
	Document doc1 = 
			Jsoup.connect("https://www.banggooso.com/").get();
	
	// feed-list 속성안에  요소 데이터들을 긁어온다
    Elements posts = doc1.body().getElementsByClass("feed-list");
    Elements file = posts.select("li");
	
    for(Element e : file){
    	
    	title = e.select(".title_wrap h4").text();
    	kind = "방구석 연구소";
    	content = e.select(".title_wrap h5").text();
    	img = e.select(".thumb img").attr("data-src");
    	src = e.select("a").attr("href");
    	
    	if(src != null){
	    	if(src.startsWith("/intro") == true){
	    		src = "https://www.banggooso.com/" + src;
	    		i++;
	    	}
	    	if(src.contains("메타브")==true){continue;}
    	}
    	SQL = "insert into test(t_title,t_kind,t_content,t_img,t_src) values(?,?,?,?,?)";
    	
    	pstmt = conn.prepareStatement(SQL);
    	pstmt.setString(1, title);
    	pstmt.setString(2, kind);
    	pstmt.setString(3, content);
    	pstmt.setString(4, img);
    	pstmt.setString(5, src);
    	pstmt.executeUpdate();

    	if(i == 5){break;}
    }
    	//--------------------------------------방구석연구소 크롤링 끝-----------------------------------------
    	
    	//-------------------------------------- ktest 크롤링 시작-----------------------------------------
    	i = 0;
    	
    	Document doc2 = Jsoup.connect("https://ktestone.com/kapable.github.io/").get();
    	
    	// feed-list 속성안에  요소 데이터들을 긁어온다
        Elements posts2 = doc2.body().getElementsByClass("main-link-div");
        Elements file2 = posts2.select("a");
        for(Element e1 : file2){
        	
        	title = e1.select("img").attr("alt");
        	kind = "ktest";
        	content = e1.select("img").attr("alt");
        	img = e1.select("img").attr("src");
        	src = e1.select("a").attr("href");

    	    src = "https://ktestone.com/" + src;
    	    i++;
    	    
        	SQL = "insert into test(t_title,t_kind,t_content,t_img,t_src) values(?,?,?,?,?)";
        	
        	pstmt = conn.prepareStatement(SQL);
        	pstmt.setString(1, title);
        	pstmt.setString(2, kind);
        	pstmt.setString(3, content);
        	pstmt.setString(4, img);
        	pstmt.setString(5, src);
        	pstmt.executeUpdate();

        	if(i == 5){break;}

        
    }
    
} finally {	}
%>

</body>
</html>	